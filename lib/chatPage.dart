import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    Freshchat.init(
      "6077b69c-2749-4df2-b6de-4060bad93f65",
      "03448a42-dee1-4e67-88dd-5bf984d94128",
      "msdk.freshchat.com",
      teamMemberInfoVisible: true,
      cameraCaptureEnabled: true,
      gallerySelectionEnabled: true,
      responseExpectationEnabled: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
