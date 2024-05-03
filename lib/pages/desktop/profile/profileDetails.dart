import 'package:ICTC_Website/pages/desktop/profile/editProfileForm.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ICTC_Website/models/student.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key, required this.student}) : super(key: key);

  final Student student;

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  late Future<String?> avatarUrl = getAvatarUrl();

  Future<String?> getAvatarUrl() async {
    try {
      final url = await Supabase.instance.client.storage
          .from('avatars')
          .createSignedUrl(
              '${Supabase.instance.client.auth.currentSession!.user.id}/avatar.png',
              60);

      return url;
    } catch (e) {
      return null;
    }
  }

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
                  child: FutureBuilder(
                    // TODO: Implement image loading
                    future: avatarUrl,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (snapshot.hasData) {
                        final url = snapshot.data!;
                        return Image.network(
                          url,
                          fit: BoxFit.cover,
                        );
                      }

                      return Center(
                        child: Icon(Icons.error_outline_rounded),
                      );
                    },
                  ),
                ),
                Text(
                  '${widget.student.toString()}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 24),
                ),
                Text(
                  '${widget.student.email}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black38,
                      fontSize: 14),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    "Contact: ${widget.student.contactNumber}",
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
                      // select an image
                      final image = await FilePicker.platform.pickFiles(
                          type: FileType.custom, allowedExtensions: ['png']);
                      if (image == null) {
                        return;
                      }

                      // upload image to supabase
                      final supa = Supabase.instance.client;

                      print(
                          "${supa.auth.currentSession!.user.id}/avatar.${image.files.first.extension}");
                      await supa.storage
                          .from('avatars')
                          .uploadBinary(
                              "${supa.auth.currentSession!.user.id}/avatar.${image.files.first.extension}",
                              image.files.first.bytes!,
                              fileOptions: FileOptions(upsert: true))
                          .whenComplete(() {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Image uploaded successfully!")));

                        setState(() {
                          avatarUrl = getAvatarUrl();
                        });
                      });
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
                            "Upload Image",
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
                  height: 10,
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
        content: Flexible(
          flex: 2,
          child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileForm(student: widget.student),
                ],
              )),
        ));
  }
}
