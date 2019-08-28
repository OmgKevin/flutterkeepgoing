
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/colors.dart';
import 'package:flutterkeepgoing/common/styles.dart';
import 'package:flutterkeepgoing/util/image_utils.dart';

class ClickItem extends StatelessWidget {

  const ClickItem({
    Key key,
    this.onTap,
    @required this.title,
    this.itemicon,
    this.content: "",
    this.textAlign: TextAlign.start,
    this.style: TextStyles.textGray16,
    this.maxLines: 1
  }): super(key: key);

  final GestureTapCallback onTap;
  final String title;
  final String itemicon;
  final String content;
  final TextAlign textAlign;
  final TextStyle style;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 15.0),
        padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
        constraints: BoxConstraints(
            maxHeight: double.infinity,
            minHeight: 50.0
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
              bottom: Divider.createBorderSide(context, color: Colours.line, width: 0.6),
            )
        ),
        child: Row(
          //为了数字类文字居中
          crossAxisAlignment: maxLines == 1 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: <Widget>[
            loadAssetImage(itemicon, height: 20.0, width: 20.0,), // 添加图片设置
            Gaps.hGap10,
            Text(
              title,
              style: TextStyles.textBoldDark18,
            ),
            const Spacer(),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 16.0),
                child: Text(
                  content,
                  maxLines: maxLines,
                  textAlign: maxLines == 1 ? TextAlign.right : textAlign,
                  overflow: TextOverflow.ellipsis,
                  style: style ?? TextStyles.textDark14,
                ),
              ),
            ),
            Opacity(
              // 无点击事件时，隐藏箭头图标
              opacity: onTap == null ? 0 : 1,
              child: Padding(
                padding: EdgeInsets.only(top: maxLines == 1 ? 0.0 : 2.0),
                child: loadAssetImage("ic_arrow_right", height: 16.0, width: 16.0,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
