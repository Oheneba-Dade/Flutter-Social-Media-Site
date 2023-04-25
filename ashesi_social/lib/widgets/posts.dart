import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class PostsList extends StatelessWidget {
  PostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .orderBy('postedAt', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text(
            'Something Went Wrong :(',
            style: GoogleFonts.manrope(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 22, 81, 102),
            ),
          );
        }

        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> data =
                  snapshot.data!.docs[index].data()! as Map<String, dynamic>;
              String email = data['email'] ?? '';
              String content = data['content'] ?? '';
              String postedAt = data['postedAt'] ?? '';
              int likes = data['likes'] ?? 0;
              bool isLiked = data['isLiked'] ?? false;
              return Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                child: ListTile(
                  tileColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  leading: const Icon(
                    Icons.person,
                    size: 50,
                    color: Color.fromARGB(255, 22, 81, 102),
                  ),
                  title: Text(
                    content,
                    style: GoogleFonts.manrope(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 22, 81, 102),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        email,
                        style: GoogleFonts.manrope(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: const Color.fromARGB(255, 22, 81, 102),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        postedAt,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      // Update likes in Firestore
                      FirebaseFirestore.instance
                          .collection('posts')
                          .doc(snapshot.data!.docs[index].id)
                          // if liked, decrement likes by 1 and set isLiked to false and change the icon color to gray
                          // else increment likes by 1 and set isLiked to true and change the icon color to blue
                          .update({
                        'likes': isLiked ? likes - 1 : likes + 1,
                        'isLiked': !isLiked,
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          color: isLiked
                              ? const Color.fromARGB(255, 22, 81, 102)
                              : Colors.grey[600],
                        ),
                        Text(
                          likes.toString(),
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
