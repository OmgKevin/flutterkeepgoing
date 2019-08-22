import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageDialog extends Dialog {
  String title;
  List<String> message;
  String negativeText;
  String positiveText;
  Function onCloseEvent;
  Function onPositivePressEvent;

  MessageDialog({
    Key key,
    @required this.title,
    @required this.message,
    this.negativeText,
    this.positiveText,
    this.onPositivePressEvent,
    this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> messageWidgets = [];
    for (int i = 0; i < message.length; i++) {
      messageWidgets.add(Text(
        message[i],
        style: TextStyle(fontSize: 16.0),
      ));
    }

    return new Padding(
      padding: const EdgeInsets.all(25.0),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(10),
                    child: new Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        new Center(
                          child: new Text(
                            title,
                            style: new TextStyle(
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    color: Color(0xffe0e0e0),
                    height: 1.0,
                  ),
                  new Container(
                    padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                    constraints: BoxConstraints(minHeight: 100.0),
                    child: Column(
                      children: messageWidgets,
                    ),
                  ),
                  this._buildBottomButtonGroup(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtonGroup() {
    var widgets = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty)
      widgets.add(_buildBottomCancelButton());
    if (positiveText != null && positiveText.isNotEmpty)
      widgets.add(_buildBottomPositiveButton());
    return Container(
      child: new Flex(
        direction: Axis.horizontal,
        children: widgets,
      ),
    );
  }

  Widget _buildBottomCancelButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onCloseEvent,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 11, 0, 11),
          child: Text(
            negativeText,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPositiveButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onPositivePressEvent,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 11, 0, 11),
          child: Text(
            positiveText,
            style: TextStyle(
              color: Color(Colors.teal.value),
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
