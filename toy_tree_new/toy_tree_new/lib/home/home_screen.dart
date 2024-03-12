import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toy_tree_new/model/Featured_Toy_Model.dart';
import 'package:toy_tree_new/model/catogary_model.dart';
import 'package:toy_tree_new/model/tranding_product_Model.dart';
import 'package:toy_tree_new/notifions/appTheme.dart';
import 'package:toy_tree_new/notifions/notification_screen.dart';
import 'package:toy_tree_new/productdetails_screen.dart';
import 'package:toy_tree_new/search/search_screen.dart';
import 'package:toy_tree_new/service/service.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';
import 'package:toy_tree_new/utility/consts/consts.dart';
import 'package:toy_tree_new/utility/consts/list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
//----------

  service wrapar = service();
  late FeaturedToyModel featuredToyModel;
  late TrandingProductModel trandingProductModel;
  bool _isLoading = true;
  bool _isLoading2 = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _get_data();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          print(_scrollController);
          final _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.blue;
        });
      });
  }

  _get_data()async {
    Map<String, dynamic> pref = await wrapar.featured_toy();
    print(pref);
    featuredToyModel = FeaturedToyModel.fromJson(pref);

    Map<String, dynamic> prefs = await wrapar.tranding_toy();
    print(pref);
    trandingProductModel = TrandingProductModel.fromJson(prefs);

    _isLoading = false;
    setState(() {});
  }



//----------
  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (100 - kToolbarHeight);
  }
//----------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bodyBgColor,
      appBar: AppBar(
        backgroundColor: golden,
        centerTitle: true,
        leading: _isSliverAppBarExpanded ?  null : Container(
          height: 10,
          margin: EdgeInsets.only(left: 10,bottom: 5,top: 5),
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Image.asset(icAppLogo,scale: 10,),
        ),
        title: _isSliverAppBarExpanded ?
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchScreen()));
          },
          child: Container(
            height: 40,
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.only(left: 10,top: 10,right: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchScreen()));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 00, left: 10, bottom: 00),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
                    ),
                    Text(
                      '  Search for toys',
                      style: TextStyle(color: Colors.grey,fontSize: 15),
                    )
                  ],
                ),
              )
              /* TextFormField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.all(12),
                                    hintText: 'Search for toys',
                                    icon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    //fillColor: Colors.green
                                  ),

                                  */
              /*onChanged: (value){
                            searchon = true;
                            _searchForProduct(value);
                          },*/
              /*
                                )*/
              ,
            ),
          ),
        ) :
        Text(
          'Toy Tree',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800,color: CupertinoColors.black),
        ),
        actions: _isSliverAppBarExpanded ?  null : [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NotificationScreen()));
              }, icon: Icon(Icons.notifications_none_sharp,color: CupertinoColors.black,))
        ],
      ),
      // appBar: AppBar(
      //   backgroundColor: redColor,
      //   centerTitle: true,
      //   leading: Container(
      //     height: 10,
      //     margin: EdgeInsets.only(left: 10,bottom: 5,top: 5),
      //     decoration: BoxDecoration(
      //       color: Colors.orangeAccent,
      //       borderRadius: BorderRadius.circular(12)
      //     ),
      //     child: Image.asset(icAppLogo,scale: 10,),
      //   ),
      //   title: Text(
      //     'Toy Tree',
      //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
      //   ),
      //   //centerTitle: true,
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NotificationScreen()));
      //         }, icon: Icon(Icons.notifications_none_sharp))
      //   ],
      // ),

     /* drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text('Hello'),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "yash",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 15,
                            ),
                            Container(
                              width: 180,
                              child: const Text(
                                  'Sardar Patel school, Kaliyabid , Bhavnagar,Gujrat '),
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text('Account'),
            ),
            const ListTile(
              leading: Icon(Icons.calendar_month_outlined),
              title: Text('My Subscriptions'),
            ),
            const ListTile(
              leading: Icon(Icons.category_outlined),
              title: Text('Shop By Category'),
            ),
            const ListTile(
              leading: Icon(Icons.notifications_none_sharp),
              title: Text('Notification'),
            ),
            const ListTile(
              leading: Icon(Icons.star_border),
              title: Text('Rate our app'),
            ),
            const ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Need Help?'),
            ),
            const ListTile(
              leading: Icon(Icons.share_outlined),
              title: Text('Share'),
            ),
            ListTile(
              onTap: () async {
               */
      /* SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setBool("isLogin", false);
                Get.to(const LoginScreen());*/
      /*
              },
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ],
        ),
      ),*/
      body: _isLoading  == true ? Center(child: CircularProgressIndicator(),) :
      SingleChildScrollView(
        controller: _scrollController,
        physics:  BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            Text(
                              '  Search for toys',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 120,
                  padding: EdgeInsets.only(top: 12, left: 45, right: 30),
                  decoration: BoxDecoration(
                      color: Vx.orange200,
                      boxShadow: [
                        BoxShadow(blurRadius: 3, color: Colors.black38)
                      ],
                      borderRadius: BorderRadius.circular(45)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Special offers',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubscribeScreen()));
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(8)),
                                height: 30,
                                width: 100,
                                child: Center(
                                  child: Text('Subscribe'),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                          'join us and experience the joy of membership perk 🎉'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 338 / 140,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.easeInExpo,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          // _current_slider = index;
                        });
                      }),
                  items: [0,1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.amber),
                            child: Image.asset(
                              slidersList[i],
                              fit: BoxFit.fill,
                            ));
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '⭐ How it Works',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '👉 Choose a plan 📋',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '👉 Get Toys Delivered 🚚',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '👉 Play, Learn, Enjoy!',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '👉 Easy Returns 🔄',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text("View More"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/whatsapp.png',
                          height: 30,
                          color: Colors.white,
                        ),
                        Text(
                          '  CHAT WITH EXPERTS',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '👪 What Parents Say',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 338 / 141,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.easeInExpo,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          // _current_slider = index;
                        });
                      }),
                  items: [0,1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height: 151,
                          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                          padding: EdgeInsets.only(top: 12, left: 45, right: 30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(blurRadius: 3, color: Colors.black38)
                              ],
                              borderRadius: BorderRadius.circular(55)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Michelle',
                                      style: TextStyle(
                                        fontSize: 17,
                                      )),
                                  Icon(CupertinoIcons.chat_bubble_text_fill)
                                ],
                              ),
                              Text(
                                  '" ToyShare is the only APP in the UAE where you can borrow toys& keep them for 2 weeks. i love the idea! "'),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: golden,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: golden,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: golden,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: golden,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: golden,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Categories',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                    Text('View all',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: Center(
                          child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: Center(
                          child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: Center(
                          child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: Center(
                          child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: Center(
                          child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: Center(
                          child: Text("More.. ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Featured Toys',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                    Text('View all',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: featuredToyModel.product.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 190,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetailScreen()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: NetworkImage(featuredToyModel.product[index].image),fit: BoxFit.fill,)
                                      ),
                                    )
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    featuredToyModel.product[index].name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                    }),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Trading toys',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                    Text('',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: trandingProductModel.product.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 230,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetailScreen()));
                        },
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                  child: Container(
                                    height: 150,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: NetworkImage(trandingProductModel.product[index].image,),fit: BoxFit.scaleDown,)
                                    ),
                                  )
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                trandingProductModel.product[index].name,

                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                trandingProductModel.product[index].category,

                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      )


      // CustomScrollView(
      //   controller: _scrollController,
      //   slivers: <Widget>[
      //
      //   //   SliverAppBar(
      //   //     expandedHeight: 130.0,
      //   //     pinned: true,
      //   //     snap: false,
      //   //     floating: false,
      //   //     centerTitle: true,
      //   // actions: _isSliverAppBarExpanded ?  null : [
      //   //   IconButton(
      //   //       onPressed: () {
      //   //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NotificationScreen()));
      //   //       }, icon: Icon(Icons.notifications_none_sharp,color: CupertinoColors.black,))
      //   // ],
      //   //    leading: _isSliverAppBarExpanded ?  null : Container(
      //   //       height: 10,
      //   //       margin: EdgeInsets.only(left: 10,bottom: 5,top: 5),
      //   //       decoration: BoxDecoration(
      //   //         color: Colors.orange,
      //   //         borderRadius: BorderRadius.circular(12)
      //   //       ),
      //   //       child: Image.asset(icAppLogo,scale: 10,),
      //   //     ),
      //   //     title: _isSliverAppBarExpanded ?  null : Text(
      //   //           'Toy Tree',
      //   //           style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800,color: CupertinoColors.black),
      //   //         ),
      //   //     scrolledUnderElevation: 12,
      //   //
      //   //     backgroundColor: golden,
      //   //     flexibleSpace: FlexibleSpaceBar(
      //   //       expandedTitleScale: 1,
      //   //       title:  GestureDetector(
      //   //                     onTap: () {
      //   //                       Navigator.of(context).push(MaterialPageRoute(
      //   //                           builder: (context) => SearchScreen()));
      //   //                     },
      //   //                     child: Container(
      //   //                       height: 40,
      //   //                       padding: EdgeInsets.all(0),
      //   //                       margin: EdgeInsets.only(left: 10,top: 42,right: 10),
      //   //                       decoration: BoxDecoration(
      //   //                           color: Colors.white,
      //   //                           borderRadius: BorderRadius.circular(8)),
      //   //                       child: GestureDetector(
      //   //                         onTap: () {
      //   //                           Navigator.of(context).push(MaterialPageRoute(
      //   //                               builder: (context) => SearchScreen()));
      //   //                         },
      //   //                         child: Padding(
      //   //                           padding: EdgeInsets.only(top: 00, left: 10, bottom: 00),
      //   //                           child: Row(
      //   //                             children: [
      //   //                               Icon(
      //   //                                 Icons.search,
      //   //                                 color: Colors.grey,
      //   //                                 size: 20,
      //   //                               ),
      //   //                               Text(
      //   //                                 '  Search for toys',
      //   //                                 style: TextStyle(color: Colors.grey,fontSize: 15),
      //   //                               )
      //   //                             ],
      //   //                           ),
      //   //                         )
      //   //                         /* TextFormField(
      //   //                           decoration: InputDecoration(
      //   //                             fillColor: Colors.white,
      //   //                             contentPadding: const EdgeInsets.all(12),
      //   //                             hintText: 'Search for toys',
      //   //                             icon: Icon(Icons.search),
      //   //                             border: InputBorder.none,
      //   //                             //fillColor: Colors.green
      //   //                           ),
      //   //
      //   //                           */
      //   //                         /*onChanged: (value){
      //   //                     searchon = true;
      //   //                     _searchForProduct(value);
      //   //                   },*/
      //   //                         /*
      //   //                         )*/
      //   //                         ,
      //   //                       ),
      //   //                     ),
      //   //                   ),
      //   //       centerTitle: true,
      //   //     ),
      //   //   ),
      //     //3
      //     SliverList(
      //
      //       delegate: SliverChildBuilderDelegate(
      //         childCount: 1,
      //
      //             (_, int index) {
      //           return
      //               SingleChildScrollView(
      //
      //                 physics:  BouncingScrollPhysics(),
      //                 child: Padding(
      //                   padding: EdgeInsets.symmetric(),
      //                   child: Padding(
      //                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         // GestureDetector(
      //                         //   onTap: () {
      //                         //     Navigator.of(context).push(MaterialPageRoute(
      //                         //         builder: (context) => SearchScreen()));
      //                         //   },
      //                         //   child: Container(
      //                         //     padding: EdgeInsets.all(3),
      //                         //     decoration: BoxDecoration(
      //                         //         color: Colors.grey.withOpacity(0.2),
      //                         //         borderRadius: BorderRadius.circular(12)),
      //                         //     child: GestureDetector(
      //                         //       onTap: () {
      //                         //         Navigator.of(context).push(MaterialPageRoute(
      //                         //             builder: (context) => SearchScreen()));
      //                         //       },
      //                         //       child: Padding(
      //                         //         padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
      //                         //         child: Row(
      //                         //           children: [
      //                         //             Icon(
      //                         //               Icons.search,
      //                         //               color: Colors.grey,
      //                         //             ),
      //                         //             Text(
      //                         //               '  Search for toys',
      //                         //               style: TextStyle(color: Colors.grey),
      //                         //             )
      //                         //           ],
      //                         //         ),
      //                         //       )
      //                         //       /* TextFormField(
      //                         //         decoration: InputDecoration(
      //                         //           fillColor: Colors.white,
      //                         //           contentPadding: const EdgeInsets.all(12),
      //                         //           hintText: 'Search for toys',
      //                         //           icon: Icon(Icons.search),
      //                         //           border: InputBorder.none,
      //                         //           //fillColor: Colors.green
      //                         //         ),
      //                         //
      //                         //         */ /*onChanged: (value){
      //                         //   searchon = true;
      //                         //   _searchForProduct(value);
      //                         // },*/ /*
      //                         //       )*/
      //                         //       ,
      //                         //     ),
      //                         //   ),
      //                         // ),
      //                         SizedBox(
      //                           height: 20,
      //                         ),
      //                         Container(
      //                           height: 120,
      //                           padding: EdgeInsets.only(top: 12, left: 45, right: 30),
      //                           decoration: BoxDecoration(
      //                               color: Vx.orange200,
      //                               boxShadow: [
      //                                 BoxShadow(blurRadius: 3, color: Colors.black38)
      //                               ],
      //                               borderRadius: BorderRadius.circular(45)),
      //                           child: Column(
      //                             children: [
      //                               Row(
      //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                 children: [
      //                                   Text(
      //                                     'Special offers',
      //                                     style: TextStyle(
      //                                         fontSize: 17, fontWeight: FontWeight.w800),
      //                                   ),
      //                                   GestureDetector(
      //                                     onTap: () {
      //                                       // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubscribeScreen()));
      //                                     },
      //                                     child: Container(
      //                                         margin: EdgeInsets.only(right: 12),
      //                                         decoration: BoxDecoration(
      //                                             color: Colors.orangeAccent,
      //                                             borderRadius: BorderRadius.circular(8)),
      //                                         height: 30,
      //                                         width: 100,
      //                                         child: Center(
      //                                           child: Text('Subscribe'),
      //                                         )),
      //                                   )
      //                                 ],
      //                               ),
      //                               SizedBox(
      //                                 height: 12,
      //                               ),
      //                               Text(
      //                                   'join us and experience the joy of membership perk 🎉'),
      //                             ],
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 20,
      //                         ),
      //                         CarouselSlider(
      //                           options: CarouselOptions(
      //                               aspectRatio: 338 / 140,
      //                               viewportFraction: 1,
      //                               initialPage: 0,
      //                               enableInfiniteScroll: true,
      //                               reverse: false,
      //                               autoPlay: true,
      //                               autoPlayInterval: Duration(seconds: 5),
      //                               autoPlayAnimationDuration: Duration(milliseconds: 1000),
      //                               autoPlayCurve: Curves.easeInExpo,
      //                               enlargeCenterPage: true,
      //                               scrollDirection: Axis.horizontal,
      //                               onPageChanged: (index, reason) {
      //                                 setState(() {
      //                                   // _current_slider = index;
      //                                 });
      //                               }),
      //                           items: [0,1, 2, 3].map((i) {
      //                             return Builder(
      //                               builder: (BuildContext context) {
      //                                 return Container(
      //                                     width: MediaQuery.of(context).size.width,
      //                                     margin: EdgeInsets.symmetric(horizontal: 5.0),
      //                                     decoration: BoxDecoration(color: Colors.amber),
      //                                     child: Image.asset(
      //                                       slidersList[i],
      //                                       fit: BoxFit.fill,
      //                                     ));
      //                               },
      //                             );
      //                           }).toList(),
      //                         ),
      //                         SizedBox(
      //                           height: 20,
      //                         ),
      //                         Text(
      //                           '⭐ How it Works',
      //                           style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
      //                         ),
      //                         SizedBox(
      //                           height: 8,
      //                         ),
      //                         Text(
      //                           '👉 Choose a plan 📋',
      //                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      //                         ),
      //                         SizedBox(
      //                           height: 8,
      //                         ),
      //                         Text(
      //                           '👉 Get Toys Delivered 🚚',
      //                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      //                         ),
      //                         SizedBox(
      //                           height: 8,
      //                         ),
      //                         Text(
      //                           '👉 Play, Learn, Enjoy!',
      //                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      //                         ),
      //                         SizedBox(
      //                           height: 8,
      //                         ),
      //                         Text(
      //                           '👉 Easy Returns 🔄',
      //                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      //                         ),
      //                         SizedBox(
      //                           height: 15,
      //                         ),
      //                         Align(
      //                           alignment: Alignment.centerRight,
      //                           child: Container(
      //                             height: 30,
      //                             width: 100,
      //                             decoration: BoxDecoration(
      //                                 color: Colors.orangeAccent,
      //                                 borderRadius: BorderRadius.circular(12)),
      //                             child: Center(
      //                               child: Text("View More"),
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 15,
      //                         ),
      //                         Container(
      //                           margin: EdgeInsets.symmetric(horizontal: 13),
      //                           height: 50,
      //                           decoration: BoxDecoration(
      //                               color: Colors.green,
      //                               borderRadius: BorderRadius.circular(15)),
      //                           child: Center(
      //                             child: Row(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: [
      //                                 Image.asset(
      //                                   'assets/icons/whatsapp.png',
      //                                   height: 30,
      //                                   color: Colors.white,
      //                                 ),
      //                                 Text(
      //                                   '  CHAT WITH EXPERTS',
      //                                   style: TextStyle(
      //                                       fontSize: 17,
      //                                       fontWeight: FontWeight.w600,
      //                                       color: Colors.white),
      //                                 )
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 20,
      //                         ),
      //                         Text(
      //                           '👪 What Parents Say',
      //                           style: TextStyle(fontSize: 20),
      //                         ),
      //                         SizedBox(
      //                           height: 10,
      //                         ),
      //                         CarouselSlider(
      //                           options: CarouselOptions(
      //                               aspectRatio: 338 / 141,
      //                               viewportFraction: 1,
      //                               initialPage: 0,
      //                               enableInfiniteScroll: true,
      //                               reverse: false,
      //                               autoPlay: true,
      //                               autoPlayInterval: Duration(seconds: 5),
      //                               autoPlayAnimationDuration: Duration(milliseconds: 1000),
      //                               autoPlayCurve: Curves.easeInExpo,
      //                               enlargeCenterPage: true,
      //                               scrollDirection: Axis.horizontal,
      //                               onPageChanged: (index, reason) {
      //                                 setState(() {
      //                                   // _current_slider = index;
      //                                 });
      //                               }),
      //                           items: [0,1, 2, 3].map((i) {
      //                             return Builder(
      //                               builder: (BuildContext context) {
      //                                 return Container(
      //                                   height: 151,
      //                                   margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      //                                   padding: EdgeInsets.only(top: 12, left: 45, right: 30),
      //                                   decoration: BoxDecoration(
      //                                       color: Colors.white,
      //                                       boxShadow: [
      //                                         BoxShadow(blurRadius: 3, color: Colors.black38)
      //                                       ],
      //                                       borderRadius: BorderRadius.circular(55)),
      //                                   child: Column(
      //                                     children: [
      //                                       Row(
      //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                         children: [
      //                                           Text('Michelle',
      //                                               style: TextStyle(
      //                                                 fontSize: 17,
      //                                               )),
      //                                           Icon(CupertinoIcons.chat_bubble_text_fill)
      //                                         ],
      //                                       ),
      //                                       Text(
      //                                           '" ToyShare is the only APP in the UAE where you can borrow toys& keep them for 2 weeks. i love the idea! "'),
      //                                       Align(
      //                                         alignment: Alignment.center,
      //                                         child: Row(
      //                                           children: [
      //                                             Icon(
      //                                               Icons.star,
      //                                               color: golden,
      //                                             ),
      //                                             Icon(
      //                                               Icons.star,
      //                                               color: golden,
      //                                             ),
      //                                             Icon(
      //                                               Icons.star,
      //                                               color: golden,
      //                                             ),
      //                                             Icon(
      //                                               Icons.star,
      //                                               color: golden,
      //                                             ),
      //                                             Icon(
      //                                               Icons.star,
      //                                               color: golden,
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       )
      //                                     ],
      //                                   ),
      //                                 );
      //                               },
      //                             );
      //                           }).toList(),
      //                         ),
      //
      //                         SizedBox(
      //                           height: 10,
      //                         ),
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             Text('Categories',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                             Text('View all',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           height: 10,
      //                         ),
      //
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             InkWell(
      //                               onTap: (){
      //                                 setState(() {
      //                                 });
      //                               },
      //                               child: Container(
      //                                 padding: EdgeInsets.symmetric(horizontal: 15),
      //                                 height: 40,
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.orangeAccent,
      //                                   borderRadius: BorderRadius.circular(30),
      //
      //                                 ),
      //                                 child: Center(
      //                                   child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                                 ),
      //                               ),
      //                             ),
      //                             InkWell(
      //                               onTap: (){
      //                                 setState(() {
      //                                 });
      //                               },
      //                               child: Container(
      //                                 padding: EdgeInsets.symmetric(horizontal: 15),
      //                                 height: 40,
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.orangeAccent,
      //                                   borderRadius: BorderRadius.circular(30),
      //
      //                                 ),
      //                                 child: Center(
      //                                   child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                                 ),
      //                               ),
      //                             ),
      //                             InkWell(
      //                               onTap: (){
      //                                 setState(() {
      //                                 });
      //                               },
      //                               child: Container(
      //                                 padding: EdgeInsets.symmetric(horizontal: 15),
      //                                 height: 40,
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.orangeAccent,
      //                                   borderRadius: BorderRadius.circular(30),
      //
      //                                 ),
      //                                 child: Center(
      //                                   child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                                 ),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           height: 10,
      //                         ),
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             InkWell(
      //                               onTap: (){
      //                                 setState(() {
      //                                 });
      //                               },
      //                               child: Container(
      //                                 padding: EdgeInsets.symmetric(horizontal: 15),
      //                                 height: 40,
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.orangeAccent,
      //                                   borderRadius: BorderRadius.circular(30),
      //
      //                                 ),
      //                                 child: Center(
      //                                   child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                                 ),
      //                               ),
      //                             ),
      //                             InkWell(
      //                               onTap: (){
      //                                 setState(() {
      //                                 });
      //                               },
      //                               child: Container(
      //                                 padding: EdgeInsets.symmetric(horizontal: 15),
      //                                 height: 40,
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.orangeAccent,
      //                                   borderRadius: BorderRadius.circular(30),
      //
      //                                 ),
      //                                 child: Center(
      //                                   child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                                 ),
      //                               ),
      //                             ),
      //                             InkWell(
      //                               onTap: (){
      //                                 setState(() {
      //                                 });
      //                               },
      //                               child: Container(
      //                                 padding: EdgeInsets.symmetric(horizontal: 15),
      //                                 height: 40,
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.orangeAccent,
      //                                   borderRadius: BorderRadius.circular(30),
      //
      //                                 ),
      //                                 child: Center(
      //                                   child: Text("More.. ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                                 ),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           height: 30,
      //                         ),
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             Text('Featured Toys',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                             Text('View all',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           height: 10,
      //                         ),
      //                          GridView.builder(
      //                             physics: NeverScrollableScrollPhysics(),
      //                             shrinkWrap: true,
      //                             itemCount: featuredToyModel.product.length,
      //                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                                 crossAxisCount: 2,
      //                                 mainAxisExtent: 190,
      //                                 mainAxisSpacing: 8,
      //                                 crossAxisSpacing: 8),
      //                             itemBuilder: (context, index) {
      //                               return
      //                                 GestureDetector(
      //                                   onTap: (){
      //                                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetailScreen()));
      //                                   },
      //                                   child: Container(
      //                                     height: 50,
      //                                     decoration: BoxDecoration(
      //                                         color: Colors.orangeAccent.withOpacity(0.5),
      //                                         borderRadius: BorderRadius.circular(10)),
      //                                     child: Column(
      //                                       children: [
      //                                         ClipRRect(
      //                                             borderRadius: BorderRadius.circular(10),
      //                                             child: Container(
      //                                               height: 150,
      //                                               width: MediaQuery.of(context).size.width,
      //                                               decoration: BoxDecoration(
      //                                                   image: DecorationImage(image: NetworkImage(featuredToyModel.product[index].image),fit: BoxFit.fill,)
      //                                               ),
      //                                             )
      //                                         ),
      //                                         SizedBox(
      //                                           height: 5,
      //                                         ),
      //                                         Padding(
      //                                           padding: EdgeInsets.symmetric(horizontal: 5),
      //                                           child: Text(
      //                                             featuredToyModel.product[index].name,
      //                                           style: TextStyle(
      //                                               color: Colors.black,
      //                                               fontWeight: FontWeight.w600),
      //                                           overflow: TextOverflow.ellipsis,
      //                                         ),
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ),
      //                                 );
      //                             }),
      //                         SizedBox(
      //                           height: 30,
      //                         ),
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             Text('Trading toys',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                             Text('',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           height: 10,
      //                         ),
      //                         GridView.builder(
      //                             physics: NeverScrollableScrollPhysics(),
      //                             shrinkWrap: true,
      //                             itemCount: trandingProductModel.product.length,
      //                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                                 crossAxisCount: 2,
      //                                 mainAxisExtent: 230,
      //                                 mainAxisSpacing: 8,
      //                                 crossAxisSpacing: 8),
      //                             itemBuilder: (context, index) {
      //                               return GestureDetector(
      //                                 onTap: (){
      //                                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetailScreen()));
      //                                 },
      //                                 child: Container(
      //                                   height: 50,
      //                                   padding: EdgeInsets.symmetric(horizontal: 8),
      //                                   decoration: BoxDecoration(
      //                                       color: Colors.white,
      //                                       borderRadius: BorderRadius.circular(18)),
      //                                   child: Column(
      //                                     crossAxisAlignment: CrossAxisAlignment.start,
      //                                     children: [
      //                                       ClipRRect(
      //                                           borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
      //                                           child: Container(
      //                                             height: 150,
      //                                             width: MediaQuery.of(context).size.width,
      //                                             decoration: BoxDecoration(
      //                                                 image: DecorationImage(image: NetworkImage(trandingProductModel.product[index].image,),fit: BoxFit.scaleDown,)
      //                                             ),
      //                                           )
      //                                       ),
      //                                       SizedBox(
      //                                         height: 5,
      //                                       ),
      //                                       Text(
      //                                         trandingProductModel.product[index].name,
      //
      //                                         style: TextStyle(
      //                                             color: Colors.black,
      //                                             fontWeight: FontWeight.w600),
      //                                         overflow: TextOverflow.ellipsis,
      //                                       ),
      //                                       SizedBox(
      //                                         height: 5,
      //                                       ),
      //                                       Text(
      //                                         trandingProductModel.product[index].category,
      //
      //                                         style: TextStyle(
      //                                             color: Colors.grey,
      //                                             fontWeight: FontWeight.w400),
      //                                         overflow: TextOverflow.clip,
      //                                         maxLines: 2,
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               );
      //                             }),
      //                         SizedBox(
      //                           height: 30,
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
      // SingleChildScrollView(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(),
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(MaterialPageRoute(
      //                   builder: (context) => SearchScreen()));
      //             },
      //             child: Container(
      //               padding: EdgeInsets.all(3),
      //               decoration: BoxDecoration(
      //                   color: Colors.grey.withOpacity(0.2),
      //                   borderRadius: BorderRadius.circular(12)),
      //               child: GestureDetector(
      //                 onTap: () {
      //                   Navigator.of(context).push(MaterialPageRoute(
      //                       builder: (context) => SearchScreen()));
      //                 },
      //                 child: Padding(
      //                   padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
      //                   child: Row(
      //                     children: [
      //                       Icon(
      //                         Icons.search,
      //                         color: Colors.grey,
      //                       ),
      //                       Text(
      //                         '  Search for toys',
      //                         style: TextStyle(color: Colors.grey),
      //                       )
      //                     ],
      //                   ),
      //                 )
      //                 /* TextFormField(
      //                   decoration: InputDecoration(
      //                     fillColor: Colors.white,
      //                     contentPadding: const EdgeInsets.all(12),
      //                     hintText: 'Search for toys',
      //                     icon: Icon(Icons.search),
      //                     border: InputBorder.none,
      //                     //fillColor: Colors.green
      //                   ),
      //
      //                   */ /*onChanged: (value){
      //             searchon = true;
      //             _searchForProduct(value);
      //           },*/ /*
      //                 )*/
      //                 ,
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Container(
      //             height: 120,
      //             padding: EdgeInsets.only(top: 12, left: 45, right: 30),
      //             decoration: BoxDecoration(
      //                 color: Vx.orange200,
      //                 boxShadow: [
      //                   BoxShadow(blurRadius: 3, color: Colors.black38)
      //                 ],
      //                 borderRadius: BorderRadius.circular(45)),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(
      //                       'Special offers',
      //                       style: TextStyle(
      //                           fontSize: 17, fontWeight: FontWeight.w800),
      //                     ),
      //                     GestureDetector(
      //                       onTap: () {
      //                         // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubscribeScreen()));
      //                       },
      //                       child: Container(
      //                           margin: EdgeInsets.only(right: 12),
      //                           decoration: BoxDecoration(
      //                               color: Colors.orangeAccent,
      //                               borderRadius: BorderRadius.circular(8)),
      //                           height: 30,
      //                           width: 100,
      //                           child: Center(
      //                             child: Text('Subscribe'),
      //                           )),
      //                     )
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   height: 12,
      //                 ),
      //                 Text(
      //                     'join us and experience the joy of membership perk 🎉'),
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           CarouselSlider(
      //             options: CarouselOptions(
      //                 aspectRatio: 338 / 140,
      //                 viewportFraction: 1,
      //                 initialPage: 0,
      //                 enableInfiniteScroll: true,
      //                 reverse: false,
      //                 autoPlay: true,
      //                 autoPlayInterval: Duration(seconds: 5),
      //                 autoPlayAnimationDuration: Duration(milliseconds: 1000),
      //                 autoPlayCurve: Curves.easeInExpo,
      //                 enlargeCenterPage: true,
      //                 scrollDirection: Axis.horizontal,
      //                 onPageChanged: (index, reason) {
      //                   setState(() {
      //                     // _current_slider = index;
      //                   });
      //                 }),
      //             items: [0,1, 2, 3].map((i) {
      //               return Builder(
      //                 builder: (BuildContext context) {
      //                   return Container(
      //                       width: MediaQuery.of(context).size.width,
      //                       margin: EdgeInsets.symmetric(horizontal: 5.0),
      //                       decoration: BoxDecoration(color: Colors.amber),
      //                       child: Image.asset(
      //                         slidersList[i],
      //                         fit: BoxFit.fill,
      //                       ));
      //                 },
      //               );
      //             }).toList(),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Text(
      //             '⭐ How it Works',
      //             style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
      //           ),
      //           SizedBox(
      //             height: 8,
      //           ),
      //           Text(
      //             '👉 Choose a plan 📋',
      //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      //           ),
      //           SizedBox(
      //             height: 8,
      //           ),
      //           Text(
      //             '👉 Get Toys Delivered 🚚',
      //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      //           ),
      //           SizedBox(
      //             height: 8,
      //           ),
      //           Text(
      //             '👉 Play, Learn, Enjoy!',
      //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      //           ),
      //           SizedBox(
      //             height: 8,
      //           ),
      //           Text(
      //             '👉 Easy Returns 🔄',
      //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      //           ),
      //           SizedBox(
      //             height: 15,
      //           ),
      //           Align(
      //             alignment: Alignment.centerRight,
      //             child: Container(
      //               height: 30,
      //               width: 100,
      //               decoration: BoxDecoration(
      //                   color: Colors.orangeAccent,
      //                   borderRadius: BorderRadius.circular(12)),
      //               child: Center(
      //                 child: Text("View More"),
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 15,
      //           ),
      //           Container(
      //             margin: EdgeInsets.symmetric(horizontal: 13),
      //             height: 50,
      //             decoration: BoxDecoration(
      //                 color: Colors.green,
      //                 borderRadius: BorderRadius.circular(15)),
      //             child: Center(
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Image.asset(
      //                     'assets/icons/whatsapp.png',
      //                     height: 30,
      //                     color: Colors.white,
      //                   ),
      //                   Text(
      //                     '  CHAT WITH EXPERTS',
      //                     style: TextStyle(
      //                         fontSize: 17,
      //                         fontWeight: FontWeight.w600,
      //                         color: Colors.white),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Text(
      //             '👪 What Parents Say',
      //             style: TextStyle(fontSize: 20),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           CarouselSlider(
      //             options: CarouselOptions(
      //                 aspectRatio: 338 / 140,
      //                 viewportFraction: 1,
      //                 initialPage: 0,
      //                 enableInfiniteScroll: true,
      //                 reverse: false,
      //                 autoPlay: false,
      //                 autoPlayInterval: Duration(seconds: 5),
      //                 autoPlayAnimationDuration: Duration(milliseconds: 1000),
      //                 autoPlayCurve: Curves.easeInExpo,
      //                 enlargeCenterPage: true,
      //                 scrollDirection: Axis.horizontal,
      //                 onPageChanged: (index, reason) {
      //                   setState(() {
      //                     // _current_slider = index;
      //                   });
      //                 }),
      //             items: [0,1, 2, 3].map((i) {
      //               return Builder(
      //                 builder: (BuildContext context) {
      //                   return Container(
      //                     height: 150,
      //                     margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      //                     padding: EdgeInsets.only(top: 12, left: 45, right: 30),
      //                     decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         boxShadow: [
      //                           BoxShadow(blurRadius: 3, color: Colors.black38)
      //                         ],
      //                         borderRadius: BorderRadius.circular(55)),
      //                     child: Column(
      //                       children: [
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             Text('Michelle',
      //                                 style: TextStyle(
      //                                   fontSize: 17,
      //                                 )),
      //                             Icon(CupertinoIcons.chat_bubble_text_fill)
      //                           ],
      //                         ),
      //                         Text(
      //                             '" ToyShare is the only APP in the UAE where you can borrow toys& keep them for 2 weeks. i love the idea! "'),
      //                         Align(
      //                           alignment: Alignment.center,
      //                           child: Row(
      //                             children: [
      //                               Icon(
      //                                 Icons.star,
      //                                 color: golden,
      //                               ),
      //                               Icon(
      //                                 Icons.star,
      //                                 color: golden,
      //                               ),
      //                               Icon(
      //                                 Icons.star,
      //                                 color: golden,
      //                               ),
      //                               Icon(
      //                                 Icons.star,
      //                                 color: golden,
      //                               ),
      //                               Icon(
      //                                 Icons.star,
      //                                 color: golden,
      //                               ),
      //                             ],
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                   );
      //                 },
      //               );
      //             }).toList(),
      //           ),
      //
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text('Categories',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //               Text('View all',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               InkWell(
      //                 onTap: (){
      //                   setState(() {
      //                   });
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.symmetric(horizontal: 15),
      //                   height: 40,
      //                   decoration: BoxDecoration(
      //                     color: Colors.orangeAccent,
      //                     borderRadius: BorderRadius.circular(30),
      //
      //                   ),
      //                   child: Center(
      //                     child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                   ),
      //                 ),
      //               ),
      //               InkWell(
      //                 onTap: (){
      //                   setState(() {
      //                   });
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.symmetric(horizontal: 15),
      //                   height: 40,
      //                   decoration: BoxDecoration(
      //                     color: Colors.orangeAccent,
      //                     borderRadius: BorderRadius.circular(30),
      //
      //                   ),
      //                   child: Center(
      //                     child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                   ),
      //                 ),
      //               ),
      //               InkWell(
      //                 onTap: (){
      //                   setState(() {
      //                   });
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.symmetric(horizontal: 15),
      //                   height: 40,
      //                   decoration: BoxDecoration(
      //                     color: Colors.orangeAccent,
      //                     borderRadius: BorderRadius.circular(30),
      //
      //                   ),
      //                   child: Center(
      //                     child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               InkWell(
      //                 onTap: (){
      //                   setState(() {
      //                   });
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.symmetric(horizontal: 15),
      //                   height: 40,
      //                   decoration: BoxDecoration(
      //                     color: Colors.orangeAccent,
      //                     borderRadius: BorderRadius.circular(30),
      //
      //                   ),
      //                   child: Center(
      //                     child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                   ),
      //                 ),
      //               ),
      //               InkWell(
      //                 onTap: (){
      //                   setState(() {
      //                   });
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.symmetric(horizontal: 15),
      //                   height: 40,
      //                   decoration: BoxDecoration(
      //                     color: Colors.orangeAccent,
      //                     borderRadius: BorderRadius.circular(30),
      //
      //                   ),
      //                   child: Center(
      //                     child: Text("Action ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                   ),
      //                 ),
      //               ),
      //               InkWell(
      //                 onTap: (){
      //                   setState(() {
      //                   });
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.symmetric(horizontal: 15),
      //                   height: 40,
      //                   decoration: BoxDecoration(
      //                     color: Colors.orangeAccent,
      //                     borderRadius: BorderRadius.circular(30),
      //
      //                   ),
      //                   child: Center(
      //                     child: Text("More.. ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 30,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text('Featured Toys',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //               Text('View all',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           GridView.builder(
      //               physics: NeverScrollableScrollPhysics(),
      //               shrinkWrap: true,
      //               itemCount: homeScreenProductImagelist.length,
      //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                   mainAxisExtent: 190,
      //                   mainAxisSpacing: 8,
      //                   crossAxisSpacing: 8),
      //               itemBuilder: (context, index) {
      //                 return
      //                   GestureDetector(
      //                     onTap: (){
      //                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetailScreen()));
      //                     },
      //                     child: Container(
      //                       height: 50,
      //                       decoration: BoxDecoration(
      //                           color: Colors.orangeAccent.withOpacity(0.5),
      //                           borderRadius: BorderRadius.circular(10)),
      //                       child: Column(
      //                         children: [
      //                           ClipRRect(
      //                               borderRadius: BorderRadius.circular(10),
      //                               child: Container(
      //                                 height: 150,
      //                                 width: MediaQuery.of(context).size.width,
      //                                 decoration: BoxDecoration(
      //                                     image: DecorationImage(image: AssetImage(homeScreenProductImagelist[index],),fit: BoxFit.fill,)
      //                                 ),
      //                               )
      //                           ),
      //                           SizedBox(
      //                             height: 5,
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.symmetric(horizontal: 5),
      //                             child: Text(
      //                             homeScreenProductTitlelist[index],
      //                             style: TextStyle(
      //                                 color: Colors.black,
      //                                 fontWeight: FontWeight.w600),
      //                             overflow: TextOverflow.ellipsis,
      //                           ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   );
      //               }),
      //           SizedBox(
      //             height: 30,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text('Trading toys',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      //               Text('',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           GridView.builder(
      //               physics: NeverScrollableScrollPhysics(),
      //               shrinkWrap: true,
      //               itemCount: 10,
      //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                   mainAxisExtent: 230,
      //                   mainAxisSpacing: 8,
      //                   crossAxisSpacing: 8),
      //               itemBuilder: (context, index) {
      //                 return GestureDetector(
      //                   onTap: (){
      //                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetailScreen()));
      //                   },
      //                   child: Container(
      //                     height: 50,
      //                     padding: EdgeInsets.symmetric(horizontal: 8),
      //                     decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(5)),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         ClipRRect(
      //                             borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
      //                             child: Container(
      //                               height: 150,
      //                               width: MediaQuery.of(context).size.width,
      //                               decoration: BoxDecoration(
      //                                   image: DecorationImage(image: AssetImage(categoriesImages[index],),fit: BoxFit.scaleDown,)
      //                               ),
      //                             )
      //                         ),
      //                         SizedBox(
      //                           height: 5,
      //                         ),
      //                         Text(
      //                           categoriesList[index],
      //
      //                           style: TextStyle(
      //                               color: Colors.black,
      //                               fontWeight: FontWeight.w600),
      //                           overflow: TextOverflow.ellipsis,
      //                         ),
      //                         SizedBox(
      //                           height: 5,
      //                         ),
      //                         Text(
      //                           categoriesList[index],
      //
      //                           style: TextStyle(
      //                               color: Colors.grey,
      //                               fontWeight: FontWeight.w400),
      //                           overflow: TextOverflow.clip,
      //                           maxLines: 2,
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 );
      //               }),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
