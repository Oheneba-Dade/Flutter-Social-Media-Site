import json
import firebase_admin
import functions_framework
import constants
import os
from firebase_admin import firestore
from flask import Flask, request, jsonify
from flask_mail import Mail, Message
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
mail = Mail(app)
fire_app = firebase_admin.initialize_app()
db = firestore.client()

file_path = os.path.join(os.getcwd(), "ashesi_social\config\config.json")
with open(file_path, "r") as config_file:
    config_data = json.load(config_file)
    mail_config = config_data["mail"]

MAIL_SERVER = mail_config["MAIL_SERVER"]
MAIL_PORT = mail_config["MAIL_PORT"]
MAIL_USE_TLS = mail_config["MAIL_USE_TLS"]
MAIL_USERNAME = mail_config["MAIL_USERNAME"]
MAIL_PASSWORD = mail_config["MAIL_PASSWORD"]
MAIL_DEFAULT_SENDER = mail_config["MAIL_DEFAULT_SENDER"]
USERS_COLLECTION = db.collection("users")
POSTS_COLLECTION = db.collection("posts")


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
        new_doc_ref.set(record)
        
        user_emails = []
        for user in USERS_COLLECTION.stream():
            user_emails.append(user.to_dict()["email"])
        send_email(user_emails, "New Post Alert!", f"{record['email']} made a new post.")
    except Exception:
        return jsonify(constants.INTERNAL_SERVER_ERROR_500), 500
    return jsonify(record), 200

"""
HELPER FUNCTIONS
"""
def send_email(email, subject, message):
    """
    This function sends an email with a specified subject and message to a specified recipient email
    address.
    
    :param email: The email address of the recipient to whom the email will be sent
    :param subject: The subject of the email that will be sent. It should be a string
    :param message: The message parameter is the body of the email that will be sent to the recipient.
    It can be a string containing any text or HTML content that you want to include in the email
    """
    msg = Message(subject, recipients=[email])
    msg.body = message
    mail.send(msg)

if __name__ == "__main__":
    app.run()
