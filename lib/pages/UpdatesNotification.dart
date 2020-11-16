import 'package:flutter/material.dart';

class UpdatesNotification extends StatefulWidget {
  @override
  _UpdatesNotificationState createState() => _UpdatesNotificationState();
}

class _UpdatesNotificationState extends State<UpdatesNotification> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: [
              Container( // event
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left:21.0),
                      child: Text(
                        'Events',
                        style: TextStyle(
                                  color: Color(0xFFF89E26),
                                  fontFamily: 'Poppins',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (BuildContext context,index){
                        return Column(
                          children:[
                            ListTile(
                              leading: CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Color(0xFFF89E26),
                                    child: CircleAvatar(
                                      radius: 28.0,
                                      backgroundColor: Colors.white,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:[
                                          Text((index+1).toString(),
                                              style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize:25.0,
                                              color: Color(0xFfF89E26), 
                                              fontWeight: FontWeight.w400,                                       
                                            ),
                                          ),
                                          Text('oct',
                                              style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize:10.0,
                                              color: Color(0xFfF89E26), 
                                              fontWeight: FontWeight.w400,                                       
                                            ),
                                          ),
                                        ]
                                      ),
                                    ),
                                  ),
                                title: Text('Event ‘live with mona’ up in two days',
                                        style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontSize: 18.0,
                                            ),
                                        ),
                                  subtitle: Text('2hr ago · Virkshire',
                                              style: TextStyle(
                                                    color: Color(0xFFA7A7A7),
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14.0,
                                                  ),
                                              ),
                              ),
                            GestureDetector(
                              onTap: (){},
                                child: Container(
                                height: 30.0,
                                width: (MediaQuery.of(context).size.width)- 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Color(0xFFF89E26),
                                    width: 1.0,
                                    )
                                ),
                                child: Center(
                                  child: Text('View Pass',
                                           style:  TextStyle(
                                                color: Color(0xFFF89E26),
                                                fontFamily: 'Poppins',
                                                fontSize: 14.0,
                                  ),
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              indent: 25.0,
                              endIndent: 25.0,
                              thickness: 1.0,
                            color: Color(0xFFA7A7A7),
                          ),
                          ]
                        );
                      },
                      ),
                  ],
                ),
              ),//event
              Container( // Acitivity
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left:21.0),
                      child: Text(
                        'Acitivity',
                        style: TextStyle(
                                  color: Color(0xFFF89E26),
                                  fontFamily: 'Poppins',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (BuildContext context,index){
                        return Column(
                          children:[
                            ListTile(
                              leading: CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Color(0xFFF89E26),
                                    child: CircleAvatar(
                                      radius: 28.0,
                                      backgroundColor: Colors.white,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:[
                                          Text((index+1).toString(),
                                              style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize:25.0,
                                              color: Color(0xFfF89E26), 
                                              fontWeight: FontWeight.w400,                                       
                                            ),
                                          ),
                                          Text('oct',
                                              style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize:10.0,
                                              color: Color(0xFfF89E26), 
                                              fontWeight: FontWeight.w400,                                       
                                            ),
                                          ),
                                        ]
                                      ),
                                    ),
                                  ),
                                title: Text('Activity ‘football eve’ up in one day',
                                        style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontSize: 18.0,
                                            ),
                                        ),
                                  subtitle: Text('2hr ago · Virkshire',
                                              style: TextStyle(
                                                    color: Color(0xFFA7A7A7),
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14.0,
                                                  ),
                                              ),
                              ),
                            Divider(
                              indent: 25.0,
                              endIndent: 25.0,
                              thickness: 1.0,
                            color: Color(0xFFA7A7A7),
                          ),
                          ]
                        );
                      },
                      ),
                  ],
                ),
              ),
              Container( // Growth+ 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left:21.0),
                      child: Text(
                        'Growth+',
                        style: TextStyle(
                                  color: Color(0xFFF89E26),
                                  fontFamily: 'Poppins',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context,index){
                        return Column(
                          children:[
                            ListTile(
                              leading: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: AssetImage('assets/images/simba.png'),
                                  ),
                                title: Text('Bluebird inc. shortlisted you for job ‘content writing’',
                                        style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontSize: 18.0,
                                            ),
                                        ),
                                  subtitle: Text('2hr ago · Virkshire',
                                              style: TextStyle(
                                                    color: Color(0xFFA7A7A7),
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14.0,
                                                  ),
                                              ),
                              ),
                            Divider(
                              indent: 25.0,
                              endIndent: 25.0,
                              thickness: 1.0,
                            color: Color(0xFFA7A7A7),
                          ),
                          ]
                        );
                      },
                      ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}