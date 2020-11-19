import 'package:flutter/material.dart';

class ProfessionalNotification extends StatefulWidget {
  @override
  _ProfessionalNotificationState createState() => _ProfessionalNotificationState();
}

class _ProfessionalNotificationState extends State<ProfessionalNotification> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context,index){
              return Column(
                children: [
                   ListTile(
              leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/profile_photo.png'),
                ),
              title: Text('Prarthna Joshi added sent you a connection request',
                        style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                              ),
              ),
              subtitle: Text('15  minutes ago',
                        style: TextStyle(
                                color: Color(0xFFA7A7A7),
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                              ),
              ),
            ),
            Divider(
              indent: 20.0,
              endIndent: 20.0,
              thickness: 1.0,
              color: Color(0xFFA7A7A7),
            ),
                  ],
              );
          }, 
      ),
    );
  }
}