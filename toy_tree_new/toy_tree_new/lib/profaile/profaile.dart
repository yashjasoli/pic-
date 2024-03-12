import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toy_tree_new/auth/ragition.dart';
import 'package:toy_tree_new/utility/consts/consts.dart';
import 'package:toy_tree_new/utility/consts/list.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.orange300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //edit account button
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: const Align(alignment: Alignment.topRight, child: Icon(Icons.edit,color: whiteColor)).onTap(() {}),
              // ),
              20.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: golden,
                            radius: 23,
                            child: const Text('YJ'),
                          ),
                          title: Text(
                            'Yash',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: InkWell(
                            child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: golden
                                              .withOpacity(0.6),
                                          spreadRadius: 1)
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(
                                        20)),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        color: golden,fontSize: 15),
                                  ),
                                )),
                          ),
                          subtitle: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '7383006215',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              Text(
                                'yash@gmail.com',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        )
                      // Row(
                      //   children: [
                      //     Image.asset(icProfile, width: 50, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                      //     10.widthBox,
                      //     Expanded(
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             "Dummy User".text.fontFamily(semibold).white.make(),
                      //             "customer@example.com".text.white.make(),
                      //           ],
                      //         )),
                      //     OutlinedButton(
                      //       style: OutlinedButton.styleFrom(
                      //           side: const BorderSide(
                      //             color: whiteColor,
                      //           )
                      //       ),
                      //       onPressed: () {}, child: logout.text.fontFamily(semibold).white.make(),)
                      //   ],
                      // ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 3),
                        child: ListTile(
                          title: const Text(
                            'Delivery Address',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.navigate_next)),
                          subtitle: const Text(
                            'Bhavnagar',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        )
                      // Row(
                      //   children: [
                      //     Image.asset(icProfile, width: 50, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                      //     10.widthBox,
                      //     Expanded(
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             "Dummy User".text.fontFamily(semibold).white.make(),
                      //             "customer@example.com".text.white.make(),
                      //           ],
                      //         )),
                      //     OutlinedButton(
                      //       style: OutlinedButton.styleFrom(
                      //           side: const BorderSide(
                      //             color: whiteColor,
                      //           )
                      //       ),
                      //       onPressed: () {}, child: logout.text.fontFamily(semibold).white.make(),)
                      //   ],
                      // ),
                    ),
                  ]),
                ),
              ),
              //Account Details Section

              20.heightBox,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     detailsWishlist(count: "05", title: "in your Wishlist", width: context.screenWidth / 2.25),
              //     detailsOrders(count: "15", title: "in your Orders", width: context.screenWidth / 2.25),
              //   ],
              // ),
              /*ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const Divider(color: Colors.white);
                },
                itemCount: profileButtonsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonsIcon[index],
                      width: 22,
                    ),
                    title: profileButtonsList[index]
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                  );
                },
              )*/
              Column(
                children: [
                  const ListTile(
                    leading: Icon(
                      Icons.paid,
                    ),
                    title: Text(
                      'My Subscription',
                    ),
                    trailing:   Icon(Icons.navigate_next),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.share_rounded,
                    ),
                    title: Text(
                      'Share the app',
                    ),
                    trailing:   Icon(Icons.navigate_next),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.warning_amber,
                    ),
                    title: Text(
                      'About us',
                    ),
                    trailing:   Icon(Icons.navigate_next),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.star,
                    ),
                    title: Text(
                      'Rate us on the play store',
                    ),
                    trailing:   Icon(Icons.navigate_next),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.mobile_screen_share,
                    ),
                    title: Text(
                      'refer a frend',
                    ),
                    trailing:   Icon(Icons.navigate_next),
                  ),
                   ListTile(
                    onTap: ()async{
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.setBool("isLogin", false);
                      Get.offAll(RegisterScreen());
                    },
                    leading: Icon(
                      Icons.logout,
                    ),
                    title: Text(
                      'Log out',
                    ),
                    trailing:   Icon(Icons.navigate_next),
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .margin(const EdgeInsets.all(12))
                  .padding(const EdgeInsets.symmetric(horizontal: 16))
                  .shadowSm
                  .make()
                  .box
                  .color(Vx.orange300)
                  .make(),

              Container(
                height: 150,
                margin: EdgeInsets.symmetric(vertical: 20),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(margin: EdgeInsets.only(top: 10), height: 1,color: Colors.black38,),
                    Text('Follow us on social media',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.network('https://downloadr2.apkmirror.com/wp-content/uploads/2023/09/90/650c50b6190bf_com.facebook.lite.png',height: 30,width: 30,),
                            ),
                          ),
                          SizedBox(width: 5,),
                          GestureDetector(
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.network('https://www.edigitalagency.com.au/wp-content/uploads/new-Instagram-logo-png-full-colour-glyph.png',height: 30,width: 30,),
                            ),
                          ),
                          SizedBox(width: 5,),
                          InkWell(
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                icTwitterLogo,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          InkWell(
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.network('https://static-00.iconduck.com/assets.00/linkedin-icon-2048x2048-ya5g47j2.png',height: 30,width: 30,),
                            ),
                          ),
                        ]
                      // List.generate(
                      //     3,
                      //     (index) => Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: CircleAvatar(
                      //             backgroundColor: lightGrey,
                      //             radius: 25,
                      //             child: Image.asset(
                      //               socialIconList[index],
                      //               width: 30,
                      //             ),
                      //           ),
                      //         )),
                    ),
                    Container(margin: EdgeInsets.only(bottom: 10), height: 1,color: Colors.black38,),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ).box.orange300.make();
  }
}

/*
import 'package:toy_tree_new/utility/consts/consts.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: Container(
          margin: EdgeInsets.only(left: 5,top: 5,bottom: 5),
          height: 10,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.transparent, borderRadius: BorderRadius.circular(32)),
        ),
        title: Text('My Account',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500, color: Colors.white),),
        //centerTitle: true,
      ),
      backgroundColor: Vx.orange100.withOpacity(0.2),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //edit account button
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: const Align(alignment: Alignment.topRight, child: Icon(Icons.edit,color: whiteColor)).onTap(() {}),
              // ),
              20.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8,
                        ),
                        child: ListTile(
                          title: Text(
                            'yash',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '7383006215',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          trailing: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: redColor,width: 1),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              width: 80,
                              height: 30,
                              child: Center(
                                child: Text("Subscribe ",style: TextStyle(color: redColor),),
                              ),
                            ),
                          ),
                        ),),
                  ]),
                ),
              ),
              //Account Details Section
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 3),
                    child: ListTile(
                      leading: Icon(Icons.location_on_outlined,color: redColor,),
                      title: const Text(
                        'Sardar patel school kaliyabid bhavngar gujrat',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                color: Colors.white,

                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(
                        Icons.paid,
                      ),
                      title: Text(
                        'My Subscription',
                      ),
                      trailing:   Icon(Icons.navigate_next),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.share_rounded,
                      ),
                      title: Text(
                        'Share the app',
                      ),
                      trailing:   Icon(Icons.navigate_next),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.warning_amber,
                      ),
                      title: Text(
                        'About us',
                      ),
                      trailing:   Icon(Icons.navigate_next),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.star,
                      ),
                      title: Text(
                        'Rate us on the play store',
                      ),
                      trailing:   Icon(Icons.navigate_next),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.mobile_screen_share,
                      ),
                      title: Text(
                        'refer a frend',
                      ),
                      trailing:   Icon(Icons.navigate_next),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.logout,
                      ),
                      title: Text(
                        'Log out',
                      ),
                      trailing:   Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     detailsWishlist(count: "05", title: "in your Wishlist", width: context.screenWidth / 2.25),
              //     detailsOrders(count: "15", title: "in your Orders", width: context.screenWidth / 2.25),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
