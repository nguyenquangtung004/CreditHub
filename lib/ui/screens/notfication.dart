import 'package:credit_hub_app/core/constant/app_string.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          titleNotification,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: ListTile(
                title: Text('Yêu cầu về lô 000372 của bạn đã được quyết toán',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                subtitle: Row(children:[ Icon(Icons.timelapse),Text('2020-05-06 11:24:08')] ),
              ),
            ),
            Card(
              color: Color.fromRGBO(255, 241, 236,1),
              child: ListTile(
                title: Text('Yêu cầu về lô 000372 của bạn đã được quyết toán',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                subtitle: Row(children:[ Icon(Icons.timelapse),Text('2020-05-06 11:24:08')] ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
