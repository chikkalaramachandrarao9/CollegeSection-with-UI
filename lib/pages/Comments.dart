import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

double screenWidth;

double screenHeight;

bool isliked1 = false, isliked2 = false, isliked3 = false;

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
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
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          height: 46.0,
          child: TextField(decoration: InputDecoration(hintText: 'Comment'))),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 12),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Pearl R. Avery.png'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Lousi Harvey',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '1 hour ago · Virkshire',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 12),
            Container(
                width: screenWidth,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/images/post6.png'),
                      fit: BoxFit.cover),
                )),
            SizedBox(height: 8),
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isliked1) {
                          isliked1 = false;
                        } else {
                          isliked1 = true;
                        }
                      });
                    },
                    child: isliked1
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30.0,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 30.0,
                          ),
                  ),
                  SizedBox(width: 5.0),
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "120 Yibed",
                        style: TextStyle(fontSize: 12),
                      )),
                  Spacer(),
                  SizedBox(width: 15.0),
                  SizedBox(width: 15.0),
                  SvgPicture.asset('assets/images/share_logo.svg'),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Row(children: [
              Text(
                'Louis Harvey:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 4),
              Text(
                'Some cool text for them ladies',
                style: TextStyle(fontSize: 14),
              )
            ]),
            SizedBox(height: 12.0),
            Divider(thickness: 2),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Comments',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 12.0),
            Row(children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Pearl R. Avery.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 12),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Louis Harvey',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Text('im so lonely i comment on my posts',
                    style: TextStyle(fontSize: 14))
              ])
            ])
          ],
        ),
      ),
    );
  }
}
