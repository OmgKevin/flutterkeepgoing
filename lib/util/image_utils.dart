import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterkeepgoing/util/utils.dart';
import 'package:image_picker_saver/image_picker_saver.dart';

/// 加载本地资源图片
Widget loadAssetImage(String name, {double width, double height, BoxFit fit}){
  return Image.asset(
    Utils.getImgPath(name),
    height: height,
    width: width,
    fit: fit,
  );
}

/// 加载网络图片
Widget loadNetworkImage(String imageUrl, {double width, double height, BoxFit fit: BoxFit.cover, String holderImg: "none"}){
  if (TextUtil.isEmpty(imageUrl)){
    return loadAssetImage(holderImg, height: height, width: width, fit: fit);
  }
  return CachedNetworkImage(
    imageUrl: imageUrl,
    placeholder: (context, url) => loadAssetImage(holderImg, height: height, width: width, fit: fit),
    errorWidget: (context, url, error) => loadAssetImage(holderImg, height: height, width: width, fit: fit),
    width: width,
    height: height,
    fit: fit,
  );
}

ImageProvider getImageProvider(String imageUrl, {String holderImg: "none"}){
  if (TextUtil.isEmpty(imageUrl)){
    return AssetImage(Utils.getImgPath(holderImg));
  }
  return CachedNetworkImageProvider(imageUrl);
}

// 保存网络图片到本地相册
Future<bool> saveNetworkImageToPhoto(String url, {bool useCache: true}) async {
  var data = await getNetworkImageData(url, useCache: useCache);
  var filePath = await ImagePickerSaver.saveFile(fileData: data);
  return filePath != null && filePath != "";
}


// 圆角图片
class SetRoundImage extends StatelessWidget {

  const SetRoundImage({
    Key key,
    this.size : 70.0,
    this.onTap,
    this.image
  }): super(key: key);

  final double size;
  final GestureTapCallback onTap;
  final File image;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          // 图片圆角展示
          borderRadius: BorderRadius.circular(35.0),
          image: DecorationImage(
            image: image == null ? AssetImage(Utils.getImgPath("mine/2.0x/user")) : FileImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}