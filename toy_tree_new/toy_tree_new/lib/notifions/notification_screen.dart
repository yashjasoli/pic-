import 'package:flutter/material.dart';
import 'package:slide_switcher/slide_switcher.dart';
import 'package:toy_tree_new/notifions/all_notification.dart';
import 'package:toy_tree_new/notifions/appTheme.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int switcherIndex1 = 0;
  int switcherIndex2 = 0;
  int switcherIndex3 = 0;
  int switcherIndex4 = 0;
  int switcherIndex5 = 0;
  int switcherIndex6 = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppTheme.bodyBgColor,
        appBar: AppBar(
          elevation: 0,
          foregroundColor: AppTheme.primaryColor,
          backgroundColor: AppTheme.appbarBgColor,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: const Text(
            'Notification',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,

                  child: SlideSwitcher(

                    children: [
                      Text(
                        'ALL',
                        style: TextStyle(
                            fontSize: 15,
                            color: switcherIndex4 == 0
                                ? Colors.white.withOpacity(0.9)
                                : Colors.grey),
                      ),
                      Text(
                        'ORDER UPDATES',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: switcherIndex4 == 1
                                ? Colors.white.withOpacity(0.9)
                                : Colors.grey),
                      ),
                      Text(
                        'PROMOTIONS',
                        style: TextStyle(
                            fontSize: 15,
                            color: switcherIndex4 == 2
                                ? Colors.white.withOpacity(0.9)
                                : Colors.grey),
                      ),
                    ],
                    onSelect: (int index) =>
                        setState(() => switcherIndex4 = index),
                    containerColor: Colors.white54,
                    containerBorder: Border.all(color: Colors.white),
                    slidersColors: [
                      golden,
                    ],
                    indents: 5,
                    containerHeight: 50,
                    containerWight: MediaQuery.of(context).size.width*0.9,
                  ),
                ),
                const SizedBox(height: 20),
                switcherIndex4 == 0
                    ? AllNotification()
                    : switcherIndex4 == 1
                    ? Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/remove.png',height: 50,width: 50,),
                      SizedBox(height: 15,),
                      Text('No notification',style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: 5,),
                      Text('There are no notification to list now'),
                      SizedBox(height: 15,),
                      GestureDetector(
                        child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              color: golden,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: Text("Continue"),
                          ),
                        ),
                      )
                    ],
                  ),
                )
                    : Container(
                  color: Colors.transparent,
                  height: 500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
