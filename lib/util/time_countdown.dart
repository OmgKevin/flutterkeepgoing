
import 'dart:async';
import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
 @override
 _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {

 Timer _timer;
 int seconds;

 @override
 Widget build(BuildContext context) {
  return Center(
   child: Text(

   constructTime(seconds),
   style: TextStyle(color: Colors.orange, fontSize: 16, fontWeight: FontWeight.w600,decoration: TextDecoration.none)),

  );
 }

 //时间格式化，根据总秒数转换为对应的 hh:mm:ss 格式
 String constructTime(int seconds) {
  // int hour = seconds ~/ 3600;
  int minute = seconds % 3600 ~/ 60;
  int second = seconds % 60;
  // return formatTime(hour) + ":" + formatTime(minute) + ":" + formatTime(second);
    return  formatTime(minute) + ":" + formatTime(second);
 }

 //数字格式化，将 0~9 的时间转换为 00~09
 String formatTime(int timeNum) {
  return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
 }

 @override
 void initState() {
  super.initState();
  //获取当期时间
  var now = DateTime.now();
  //获取 2 分钟的时间间隔
  var twoHours = now.add(Duration(minutes: 0)).difference(now);
  //获取总秒数，2 分钟为 120 秒
  seconds = twoHours.inSeconds;
  startTimer();
 }

 void startTimer() {
  //设置 1 秒回调一次
  const period = const Duration(seconds: 1);
  _timer = Timer.periodic(period, (timer) {
   setState(() {
    seconds++;
   });
   if (seconds == 3600) {
    cancelTimer();
   }
  });
 }

 void cancelTimer() {
  if (_timer != null) {
   _timer.cancel();
   _timer = null;
  }
 }

 @override
 void dispose() {
  super.dispose();
  cancelTimer();
 }
}