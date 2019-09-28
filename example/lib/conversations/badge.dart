import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sms/sms.dart';

class Badge extends StatelessWidget {
  Badge(this.messages) : super();

  final List<SmsMessage> messages;

  @override
  Widget build(BuildContext context) {
    if (_countUnreadMessages() == 0) {
      return new Container();
    }

    return new Container(
      padding: const EdgeInsets.all(2.0),
      decoration:
          new ShapeDecoration(shape: new CircleBorder(), color: Colors.red),
      child: Center(child: new Text(_countUnreadMessages().toString(),
          style: new TextStyle(color: Colors.white,fontSize: 10)),)
    );
  }

  int _countUnreadMessages() {
    return messages
        .where((msg) => msg.kind == SmsMessageKind.Received && !msg.isRead)
        .length;
  }
}
