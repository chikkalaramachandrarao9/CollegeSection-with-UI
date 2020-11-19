import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yibe_final_ui/pages/PrivateNotification.dart';
import 'package:yibe_final_ui/pages/ProfessionalNotification.dart';
import 'package:yibe_final_ui/pages/UpdatesNotification.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  TabController tabcontroller;
  @override
  void initState() {
    tabcontroller = TabController(length: 3, vsync: this, initialIndex: 0);
    tabcontroller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.0),
        child: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            indicatorColor: Colors.black,
            labelColor: tabcontroller.index == 0
                ? Color(0xFF0CB5BB)
                : tabcontroller.index == 1
                    ? Color(0xFF7280FF)
                    : tabcontroller.index == 2
                        ? Color(0xFFF89E26)
                        : Colors.grey,
            unselectedLabelColor: Colors.grey,
            controller: tabcontroller,
            tabs: [
              Tab(
                child: Text(
                  'Private',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Professional',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Updates',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(controller: tabcontroller, children: [
            PrivateNotification(),
            ProfessionalNotification(),
            UpdatesNotification(),
          ]),
        ),
      ]),
    );
  }
}
