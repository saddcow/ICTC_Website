import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesktop(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.80,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: () {
                              Navigator.pop(context);
                            }, icon: Icon(Icons.arrow_back_ios)),
                          ],
                        ),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Image.asset('assets/images/squid.png'),
                          ),
                        ),
                        profileForm(),
                      ],
                    ),
                  ),
                ),
              ),
              FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileForm() {
  return Form(
    child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'First Name',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            hintText: 'Enter your first name',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Last Name',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            hintText: 'Enter your last name',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            hintText: 'Enter your email',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Phone Number',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            hintText: 'Enter your phone number',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        OutlinedButton(
          onPressed: () {}, 
          child: Text('Save')
        )
      ],
    ),
  );
}
