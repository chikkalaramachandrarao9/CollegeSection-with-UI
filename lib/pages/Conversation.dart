import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConversationPage extends StatefulWidget {
  final String name;
  final image;
  final isPersonal;
  ConversationPage({
    Key key,
    this.name,
    this.image,
    this.isPersonal,
  }) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  void initState() {
    super.initState();
  }

  ScrollController controller = ScrollController();
  List<Map> _conversation = [
    {
      "isSendByMe": true,
      "message":
          "It’s totally fine. It’s not like I care about the Kanya festival anyways... I would rather stay home and watch TV. If I don’t have to do it I don’t, if I have to do it I make it as quick as possible"
    },
    {"isSendByMe": false, "message": "That’s a lie srsly"},
    {
      "isSendByMe": true,
      "message":
          "Hmm... maybe.... but that doesn’t give you a pass for asking me this. You had people expecting you there."
    },
    {
      "isSendByMe": false,
      "message":
          "Expecting me there because I am the class representative? I choose not to hold fake smiles because formalities"
    },
    {
      "isSendByMe": true,
      "message":
          "They call it a drinking party, but it’s just a hangout for people in the same lectrue. I would have gone if you were too. But we still wouldn’t be alone"
    },
    {"isSendByMe": false, "message": "You know... That kinda makes me happy"},
    {"isSendByMe": false, "message": "(・´3｀・) "},
    {
      "isSendByMe": true,
      "message":
          "We should plan something else instead... how about the fireworks? I might be able to get special passes for a cruise view. Not many people go there and it’ll be just us"
    },
    {"isSendByMe": true, "message": "hello"},
    {"isSendByMe": true, "message": "hello"},
  ];

  Widget chats() {
    return ListView.builder(
        controller: controller,
        itemCount: _conversation.length,
        itemBuilder: (context, index) {
          return MessageTile(
            message: _conversation[index]['message'],
            sendByMe: _conversation[index]["isSendByMe"],
            isPersonal: widget.isPersonal,
            senderImage: widget.image,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        actions: <Widget>[
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/images/back_btn.svg',
                    // width: 31.0,
                    height: 16.0,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundImage: widget.image,
                      radius: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //   Image.asset(widget.image),
                    Text(
                      widget.name,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    )
                  ],
                ),
                Spacer(),
                GestureDetector(
                  // onLongPress: () {
                  //   widget.hiberPopUp(true);
                  // },
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                    //   return Messages();
                    // }));
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
          child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: chats(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4.0,
                  ),
                ],

                color: Colors.white,
                // border: Border.all(
                //   color: Color(0xff008294),
                //   width: 1.0,
                // ),

                borderRadius: BorderRadius.circular(50.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/camera.svg",
                    width: 30,
                    height: 50,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextField(
                      //controller: messageEditingController,
                      // style: simpleTextStyle(),
                      decoration: InputDecoration(
                          hintText: "Message ...",
                          hintStyle: TextStyle(
                            color: Color(0xFFA7A7A7),
                            fontSize: 16,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ])),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;
  final bool isPersonal;
  final senderImage;
  const MessageTile({
    Key key,
    this.message,
    this.sendByMe,
    this.isPersonal,
    this.senderImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 0, bottom: 8, left: sendByMe ? 0 : 8, right: sendByMe ? 8 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          sendByMe
              ? Spacer()
              : CircleAvatar(
                  backgroundImage: senderImage,
                  radius: 20,
                ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
                minWidth: 0),
            child: Container(
              margin: sendByMe
                  ? EdgeInsets.only(left: 30)
                  : EdgeInsets.only(left: 5, right: 30),
              padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 8),
              decoration: BoxDecoration(
                  borderRadius: sendByMe
                      ? BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))
                      : BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: sendByMe
                        ? isPersonal
                            ? [Color(0xff0CB5BB), Color(0xff0CB5BB)]
                            : [Color(0xFF908EE1), Color(0xFF908EE1)]
                        : [Color(0xFFDBDBDB), Color(0xFFDBDBDB)],
                  )),
              child: sendByMe
                  ? Text(message,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'OverpassRegular',
                          fontWeight: FontWeight.w300))
                  : Text(message,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'OverpassRegular',
                          fontWeight: FontWeight.w300)),
            ),
          ),
        ],
      ),
    );
  }
}
