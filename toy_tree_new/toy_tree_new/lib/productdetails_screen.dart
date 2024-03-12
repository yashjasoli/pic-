import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:slide_action/slide_action.dart';
import 'package:toy_tree_new/model/product_details_model.dart';
import 'package:toy_tree_new/notifions/appTheme.dart';
import 'package:toy_tree_new/service/service.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';
import 'package:toy_tree_new/utility/consts/list.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool showOverview = true;
  int thumselected = 0;
  int _currentPage = 0;
  bool positive = false;
  service wrapar = service();
  late ProductDetailsModel productDetailsModel;
  bool _isLoading = true;
  List<String> showThumbnailList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _get_data();
  }

  _get_data()async{
    Map<String,dynamic> pref = await wrapar.sendMultipartRequest();
    print(pref);
    productDetailsModel = ProductDetailsModel.fromJson(pref);
    _isLoading = false;
    for (var j = 0; j < productDetailsModel.productDetails[0].imgurl.length; j++) {
      showThumbnailList.add(productDetailsModel.productDetails[0].imgurl[j].url);
      print(" image path prd-- " + productDetailsModel.productDetails[0].imgurl[j].url);
    }
    setState(() {});
  }

  PageController _pageController =
  PageController(keepPage: true, viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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
          'Back',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: _isLoading == true ? Center(child: CircularProgressIndicator(),) : Stack(
        children: [
          SingleChildScrollView(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 350,
                      width: 350,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        //  border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: PageView.builder(
                          itemCount: homeScreenProductImagelist.length,
                          controller: _pageController,
                          onPageChanged: (page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          itemBuilder: (_, index) => AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: _currentPage == index ? 1.0 : 0.5,
                            child: GestureDetector(
                              onTap: () {
                                /*Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration: const Duration(milliseconds: 700),
                                pageBuilder: (_, animation1, __) => FullImageZoom(
                                  imageUrl: showThumbnailList[index],
                                  herotag: showThumbnailList[index] + index.toString(),
                                  showThumbnailList: showThumbnailList,
                                  currentIndex: index,
                                ),
                                transitionsBuilder: (_, animation1, animation2, child) {
                                  return FadeTransition(
                                    opacity: animation1,
                                    child: child,
                                  );
                                },
                              ),
                            );*/
                              },
                              child: Image.network(productDetailsModel.productDetails[0].imgurl[index].url),
                            ),
                          )),
                    ),
                    _thumbnaillayoutWidget(),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      )),
                  child:  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('You can order between 6:30 PM to 12 AMS'),
                        SizedBox(height: 5,),
                        Text("Order by 2pm for next-day joy! missed it? play's on in two days!"),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,color: golden,size: 20,),
                            Text('Deliver to - 364001',style: TextStyle(color: golden),),
                          ],
                        ),
                        SizedBox(height: 8,),

                        Text(
                          'See More by',
                          style:
                          TextStyle(color: AppTheme.primaryColor, fontSize: 15),
                        ),
                        Text(
                          'Careera',
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(productDetailsModel.productDetails[0].productName.toString(),
                          style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x384F4C4C),
                        blurRadius: 5,
                        offset: Offset(1, 5),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*Container(
                      width: 209,
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(Icons.delivery_dining_sharp),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'DELIVERY BY 25-SEP-23',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),*/
                        Container(
                          height: 50,
                          width: 209,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.delivery_dining_sharp),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'DELIVERY BY 25-SEP-23',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showOverview = true;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width*0.44,
                                      decoration: BoxDecoration(
                                          color: showOverview != true
                                              ? Colors.grey.withOpacity(0.4)
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
                                      ),
                                      child:  Center(child: Text('Overview', style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: showOverview
                                              ? golden
                                              : Colors.black,
                                          fontSize: 15),)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showOverview = false;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width*0.44,
                                      decoration: BoxDecoration(
                                          color: showOverview
                                              ? Colors.grey.withOpacity(0.4)
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(20))
                                      ),

                                      child:
                                      Center(child: Text('Description',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: !showOverview
                                                ? golden
                                                : Colors.black,
                                            fontSize: 15),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: showOverview ? Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Dimensions',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                              Text(productDetailsModel.productDetails[0].dimensions,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),),
                                            ],
                                          ),
                                          SizedBox(height: 15,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Recommended\nAge',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                              Text(productDetailsModel.productDetails[0].age,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),),
                                            ],
                                          ),
                                          SizedBox(height: 15,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Gender',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                              Text(productDetailsModel.productDetails[0].gender,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),),
                                            ],
                                          ),
                                          SizedBox(height: 40,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Brands',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                              Text(productDetailsModel.productDetails[0].brand,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Battery\nInformation',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                              Text(productDetailsModel.productDetails[0].battery,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),),
                                            ],
                                          ),
                                          SizedBox(height: 15,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Skills',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                              Text(productDetailsModel.productDetails[0].skills,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),),
                                            ],
                                          ),
                                          SizedBox(height: 15,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Age',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                              Text(productDetailsModel.productDetails[0].age,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox()
                                    ],
                                  ),
                                ) : Text(
                                  productDetailsModel.productDetails[0].description,
                                  style: const TextStyle(
                                      fontSize: 15.0, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Similar Products',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index){
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                SizedBox(height: 3,),
                                ClipRRect(

                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network('https://media.istockphoto.com/id/909772478/photo/brown-teddy-bear-isolated-in-front-of-a-white-background.jpg?s=612x612&w=0&k=20&c=F4252bOrMfRTB8kWm2oM2jlb9JXY08tKCaO5G_ms1Uw=',
                                    height: 100,),
                                  // Container(
                                  //   height: 100,
                                  //   width: 100,
                                  //   decoration: BoxDecoration(
                                  //       image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/id/909772478/photo/brown-teddy-bear-isolated-in-front-of-a-white-background.jpg?s=612x612&w=0&k=20&c=F4252bOrMfRTB8kWm2oM2jlb9JXY08tKCaO5G_ms1Uw=",),fit: BoxFit.fill)
                                  //   ),
                                  // )
                                ),
                                // SizedBox(
                                //   height: 100,
                                //   child: Image.network('https://media.istockphoto.com/id/909772478/photo/brown-teddy-bear-isolated-in-front-of-a-white-background.jpg?s=612x612&w=0&k=20&c=F4252bOrMfRTB8kWm2oM2jlb9JXY08tKCaO5G_ms1Uw=',
                                //   color: Colors.black,),
                                // ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Little Tikes Shark Strike\nRemote Control',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _bottomNavigationBar(),
          ),
        ],
      ),

      // Container(
      //   color: Colors.transparent,
      //   padding: EdgeInsets.only(bottom: 10,left: 8,right: 8,top: 8),
      //   child: AnimatedToggleSwitch<bool>.dual(
      //     current: positive,
      //     first: false,
      //     second: true,
      //     spacing: 50.0,
      //
      //     style: const ToggleStyle(
      //       borderColor: Colors.transparent,
      //       boxShadow: const [
      //         BoxShadow(
      //           color: Colors.black26,
      //           spreadRadius: 1,
      //           blurRadius: 2,
      //           offset: Offset(0, 1.5),
      //         ),
      //       ],
      //     ),
      //     borderWidth: 5.0,
      //     height: 55,
      // //  onTap: (b) => setState(() => positive == false ? positive = b as bool : print(positive)),
      //     onChanged: (b) => setState(() => positive == false ? positive = b : print(positive)),
      //     styleBuilder: (b) => ToggleStyle(indicatorColor: b ? Colors.green : golden),
      //     iconBuilder: (value) => value
      //         ? Icon(Icons.lock_outline_rounded)
      //         : Image.asset("assets/images/right.png",scale: 18),
      //     textBuilder: (value) => value
      //         ? Center(child: Text(''))
      //         : Center(child: Text('Book your toy',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w800),)),
      //   ),
      // ),
      /*floatingActionButton: GestureDetector(
        onTap: () async{
          //  sendPhoneNumber();
        },
        child: Container(

          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12
          ),
          height: 50,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('Place Order',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)],
          ),
        ),
      ),*/
     // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      /*bottomNavigationBar:  GestureDetector(
        onTap: () async{
          //  sendPhoneNumber();
        },
        child: Container(

          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12
          ),
          height: 50,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('Place Order')],
          ),
        ),
      ),*/
      /*bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price'),
                  Text(
                    'QAR 320.00',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: golden,
                fixedSize: Size(width * 0.4, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'place order',
              ),
            ),
          ],
        ),
      ),*/
    );
  }

  Widget _thumbnaillayoutWidget() {
    return Container(
      //margin:EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: MediaQuery.of(context).size.width,
      height: 70.0,
      decoration: BoxDecoration(
        color: Colors.white,
        //boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(1.0, 4.0), blurRadius: 5.0)],
        //borderRadius: BorderRadius.circular(5),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          //color: Colors.white,
          //width: 15.h * showThumbnailList.length,
          decoration: BoxDecoration(
            color: Colors.white,
            //boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(1.0, 4.0), blurRadius: 5.0)],
            //borderRadius: BorderRadius.circular(5),
            // border: Border.all(color: Colors.white, width: 3)
          ),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int index = 0; index < productDetailsModel.productDetails[0].imgurl.length; index++)
                  _thumbnail(productDetailsModel.productDetails[0].imgurl[index].url, index)

              ]),
        ),
      ),
    );
  }

  _thumbnail(String image, int index) {
    return GestureDetector(
      onTap: () {
        thumselected = index;
        _pageController.jumpToPage(index);
         print( " change page "+ thumselected.toString());
        /* Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 700),
            pageBuilder: (_, animation1, __) => FullImageZoom(
              currentIndex: index,
              imageUrl: showThumbnailList[index],
              herotag: showThumbnailList[index] + index.toString(),
              showThumbnailList: showThumbnailList,
            ),
            transitionsBuilder: (_, animation1, animation2, child) {
              return FadeTransition(
                opacity: animation1,
                child: child,
              );
            },
          ),
        );*/
      },
      child: Container(
        height: 60,
        width: 60,
        // margin: EdgeInsets.symmetric(horizontal: 0.0),
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.only( right: 1,top: 5,bottom: 5,left: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color:thumselected == index ? golden : Colors.grey,spreadRadius: 1.3)],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.network(showThumbnailList[index]),
      ),
    );
  }

  Widget _bottomNavigationBar(){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 8
            )
          ],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
      ),
      margin: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          SizedBox(height: 5,),
          Row(
            children: [

              Icon(Icons.location_on,color: golden,),
              SizedBox(width: 5,),
              Expanded(child: Text('Kaliyabid , sardar patel school, bhavngar , gujrat , indai',overflow: TextOverflow.clip,)),
            ],
          ),
          SizedBox(height: 10,),
          SlideAction(
            trackHeight: 50,
            trackBuilder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child:  Center(
                  child: Center(child: Text('Book your toy',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w800),)),
                  /*Text(
                  // Show loading if async operation is being performed
                  */
                  /*state.isPerformingAction ?
                 "Loading..." :*/
                  /* "Slide to logout",
                )*/
                ),
              );
            },
            thumbBuilder: (context, state) {
              return Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  // Show loading indicator if async operation is being performed
                  child: state.isPerformingAction
                      ? Icon(Icons.lock_outline_rounded)
                      : Image.asset("assets/images/right.png",scale: 18),
                  //     ? const CupertinoActivityIndicator(
                  //   color: Colors.white,
                  // )
                  //     : const Icon(
                  //   Icons.chevron_right,
                  //   color: Colors.white,
                  // ),
                ),
              );
            },
            action: () async {

              // Async operation
              await Future.delayed(
                const Duration(hours: 1000), () => debugPrint("action completed"),
              );
            },
          )
        ],
      ),
    );
  }

}
