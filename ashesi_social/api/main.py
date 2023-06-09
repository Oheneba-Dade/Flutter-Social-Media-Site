import json
import firebase_admin
import constants
from firebase_admin import firestore
from flask import Flask, request, jsonify
from flask_cors import CORS, cross_origin
from datetime import datetime
import functions_framework

app = Flask(__name__)
CORS(app, origins="*")
fire_app = firebase_admin.initialize_app()
db = firestore.client()


USERS_COLLECTION = db.collection("users")
POSTS_COLLECTION = db.collection("posts")
MAIL_COLLECTION = db.collection("mail")


def send_emails():
    """
    The function sends an email notification to all users with the most recent post's sender's name and
    a message to check out the new post on AshTales.
    """
    emails = []
    MOST_RECENT_POST = (
        POSTS_COLLECTION.order_by("postedAt", direction=firestore.Query.DESCENDING)
        .limit(1)
        .get()[0]
    )
    MOST_RECENT_POST_SENDER = MOST_RECENT_POST.get("email")
    for user in USERS_COLLECTION.stream():
        emails.append(user.get("email"))
    # send email to all users
    for email in emails:
        new_doc_ref = MAIL_COLLECTION.document()
        new_doc_ref.set(
            {
                "to": email,
                "message": {
                    "text": f"Hello!, there is a new post on AshTales by {MOST_RECENT_POST_SENDER}. Please check it out.",
                    "subject": "New Post Notification",
                },
            }
        )


@cross_origin()
@functions_framework.http
def social_api(request):
    if request.method == "POST" and request.path == "/users":
        return register_user()
    elif request.method == "GET" and request.path == "/users":
        return get_user()
    elif request.method == "POST" and request.path == "/users/auth":
        return authenticate_user()
    elif request.method == "PATCH" and request.path.startswith("/users"):
        email = request.path.split("/")[-1]
        return update_user(email)
    elif request.method == "POST" and request.path == "/posts":
        return create_post()


@app.route("/users", methods=["POST"])
def register_user():
    if not request.data:
        return jsonify(constants.NO_DATA_PROVIDED_400), 400
    record = json.loads(request.data)
    # check if id number already exists
    id_ref = USERS_COLLECTION.where("idNumber", "==", record["idNumber"])
    id_number = id_ref.get()
    if id_number:
        return jsonify(constants.USER_ALREADY_EXISTS_409), 409
    # Check if email address already exists
    email_ref = USERS_COLLECTION.where("email", "==", record["email"])
    email = email_ref.get()
    if email:
        return jsonify(constants.EMAIL_ALREADY_EXISTS_409), 409
    try:
        new_doc_ref = USERS_COLLECTION.document()
        new_doc_ref.set(record)
    except Exception:
        return jsonify(constants.INTERNAL_SERVER_ERROR_500), 500
    return jsonify(record), 200


@app.route("/users", methods=["GET"])
def get_user():
    username = request.args.get("email")
    user_ref = USERS_COLLECTION.where("email", "==", username).limit(1)
    users = user_ref.get()
    if not users:
        return jsonify(constants.USER_NOT_FOUND_404), 404
    user_dict = users[0].to_dict()
    return jsonify(user_dict), 200


@app.route("/users/auth", methods=["POST"])
def authenticate_user():
    if not request.data:
        return jsonify(constants.NO_DATA_PROVIDED_400), 400
    record = json.loads(request.data)
    user_ref = USERS_COLLECTION.where("email", "==", record["email"]).limit(1)
    users = user_ref.get()
    if not users:
        return jsonify(constants.USER_NOT_FOUND_404), 404
    user = users[0]
    if user.get("password") != record["password"]:
        return jsonify(constants.INCORRECT_PASSWORD_401), 401
    user_dict = user.to_dict()
    return jsonify(user_dict), 200


@app.route("/users/<email>", methods=["PATCH"])
def update_user(email):
    if not request.data:
        return jsonify(constants.NO_DATA_PROVIDED_400), 400
    record = json.loads(request.data)
    user_ref = USERS_COLLECTION.where("email", "==", email).limit(1)
    users = user_ref.get()
    if not users:
        return jsonify(constants.USER_NOT_FOUND_404), 404
    user = users[0]
    try:
        updated_data = {}
        for key in record:
            if record[key] != user.get(key):
                updated_data[key] = record[key]
                user.reference.update({key: record[key]})
    except Exception:
        return jsonify(constants.INTERNAL_SERVER_ERROR_500), 500
    return jsonify(updated_data), 200


@app.route("/posts", methods=["POST"])
def create_post():
    if not request.data:
        return jsonify(constants.NO_DATA_PROVIDED_400), 400
    record = json.loads(request.data)
    try:
        new_doc_ref = POSTS_COLLECTION.document()
        current_time = datetime.now().strftime("%m/%d/%Y %H:%M:%S")
        record["postedAt"] = current_time
        record["likes"] = 0
        new_doc_ref.set(record)

        # Create an empty likes subcollection for the new post
        likes_collection_ref = new_doc_ref.collection("likes")
        likes_collection_ref.add({})
        send_emails()

    except Exception as e:
        print(e)
        return jsonify(constants.INTERNAL_SERVER_ERROR_500), 500
    return jsonify(record), 200


if __name__ == "__main__":
    app.run()
