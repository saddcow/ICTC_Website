import 'package:ICTC_Website/pages/desktop/editProfile.dart';
import 'package:ICTC_Website/pages/desktop/editProfileForm.dart';
import 'package:flutter/material.dart';
import 'package:ICTC_Website/models/student.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key, required this.student}) : super(key: key);

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * .8,
          child: Container(
            margin: EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // IMAGE
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 360,
                  decoration: BoxDecoration(color: Colors.black12),
                ),
                Text(
                  '${student.toString()}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 24),
                ),
                Text(
                  '${student.email}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black38,
                      fontSize: 14),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    "Contact: ${student.contactNumber}",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                        fontSize: 13),
                  ),
                ),
                Material(
                  color: Colors.black12,
                  child: InkWell(
                    splashColor: Colors.black26,
                    onTap: () async {
                      await showDialog<void>(
                          context: context,
                          builder: (context) => buildEditDialog(context));
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Edit Profile",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
    }
    Widget buildEditDialog(context) {
      return AlertDialog(
        content: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.3,
          child: ProfileForm(student: student))
      );
    }
}
