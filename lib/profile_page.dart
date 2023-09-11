// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Color.fromARGB(255, 133, 9, 9),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // CircleAvatar(
//             //   radius: 40,
//             //   backgroundImage: AssetImage('assets/profile_image.jpg'),
//             // ),
//             SizedBox(height: 20),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text(
//                 'Name',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.email),
//               title: Text(
//                 'Email: abc@email.com',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.mail_outline),
//               title: Text(
//                 'Vayu_ID: abc@email.com',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ),
            // ListTile(
            //   leading: Icon(Icons.phone),
            //   title: Text(
            //     'Phone Number: Your_Phone_Number',
            //     style: TextStyle(
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(Icons.location_on),
            //   title: Text(
            //     'Address: Your_Address',
            //     style: TextStyle(
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
//             ListTile(
//               leading: Icon(Icons.access_time),
//               title: Text(
//                 'Preferred Time for Offline Session: Preferred_Time',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ),
            // ListTile(
            //   leading: Icon(Icons.person_outline),
            //   title: Text(
            //     'Age Category: Your_Age_Category',
            //     style: TextStyle(
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(Icons.school),
            //   title: Text(
            //     'School/College Name: Your_School_College_Name',
            //     style: TextStyle(
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(Icons.check_circle),
            //   title: Text(
            //     'Completion Status: Completion_Status',
            //     style: TextStyle(
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(Icons.star),
            //   title: Text(
            //     'Certificate: Certificate_Status',
            //     style: TextStyle(
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final storage = FlutterSecureStorage();

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> userProfileData = {}; // Initialize at the class level

  @override
  void initState() {
    super.initState();
    fetchUserProfileData(); // Fetch user profile data when the page loads
  }

  Future<void> fetchUserProfileData() async {
    try {
      // Make an API request to fetch user profile data
      final token = await storage.read(key: 'jwt_token');
      final url = Uri.parse('http://localhost:5555//userprofile'); // Corrected the URL

      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          userProfileData = data['userProfile'];
        });
      } else {
        // Handle API request error
        print('Failed to fetch user profile data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error fetching user profile data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
      body: Center(
        child: userProfileData.isEmpty
            ? CircularProgressIndicator() // Show loading indicator while fetching data
            : buildUserProfileUI(), // Display user profile data
      ),
    );
  }

  Widget buildUserProfileUI() {
    // Build UI components using userProfileData
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add your UI components here using userProfileData
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            'Name: ${userProfileData['name']}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text(
            'Email: ${userProfileData['email']}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        ListTile(
              leading: Icon(Icons.mail_outline),
               title: Text(
                 'Vayu_ID: ${userProfileData['vaayu_id']}',
                 style: TextStyle(
                   fontSize: 16,
                 ),
               ),
             ),
        ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'Contact: ${userProfileData['contact_num']}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
        ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                'Address: ${userProfileData['address']}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
        ListTile(
              leading: Icon(Icons.person_outline),
              title: Text(
                'Age Category: ${userProfileData['age_group']}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
        ListTile(
              leading: Icon(Icons.school),
              title: Text(
                'School/College Name: ${userProfileData['school_college_name']}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
        ListTile(
              leading: Icon(Icons.check_circle),
              title: Text(
                'Completion Status: ${userProfileData['status_of_completion']}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
        ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Certificate: ${userProfileData['certificate']}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
       
      ],
    );
  }
}



