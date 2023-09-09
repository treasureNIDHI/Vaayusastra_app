import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CircleAvatar(
            //   radius: 40,
            //   backgroundImage: AssetImage('assets/profile_image.jpg'),
            // ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'Email: abc@email.com',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.mail_outline),
              title: Text(
                'Vayu_ID: abc@email.com',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'Phone Number: Your_Phone_Number',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                'Address: Your_Address',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text(
                'Preferred Time for Offline Session: Preferred_Time',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text(
                'Age Category: Your_Age_Category',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text(
                'School/College Name: Your_School_College_Name',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.check_circle),
              title: Text(
                'Completion Status: Completion_Status',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Certificate: Certificate_Status',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
