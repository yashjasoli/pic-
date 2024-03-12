import 'package:flutter/material.dart';
import 'package:toy_tree_new/notifions/appTheme.dart';
import 'package:toy_tree_new/productdetails_screen.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';
import 'package:toy_tree_new/utility/consts/list.dart';

class SubCatogary extends StatefulWidget {
  String titel;

  SubCatogary({super.key, required this.titel});

  @override
  State<SubCatogary> createState() => _SubCatogaryState();
}

class _SubCatogaryState extends State<SubCatogary> {
  bool filter = false;
  List<bool> isCheckedList = [false, false, false, false,false,false];
  List<String> filterName = ['3 To 5 Years', '5 To 8 Years', '8To 12 Years', 'Electronic Toy','Non Electronic Toy','Coming Soon'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bodyBgColor,
      appBar: AppBar(
        title: Text(widget.titel),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                filter == false ? filter = true : filter = false;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.filter_list),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: homeScreenProductImagelist.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 200,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductDetailScreen()));
                          },
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                    child: Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(
                                          homeScreenProductImagelist[index],
                                        ),
                                        fit: BoxFit.scaleDown,
                                      )),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  homeScreenProductTitlelist[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  homeScreenProductTitlelist2[index],
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
                ],
              ),
            ),
          ),
          filter == true
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          color: Colors.black38
                        )
                      ],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: filterName.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(filterName[index]),

                            trailing: Checkbox(
                              value: isCheckedList[index],
                              onChanged: (value) {
                                setState(() {
                                  isCheckedList[index] = value!;

                                  value == true  ? print(filterName[index]) : print("*");
                                });
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Reset"),
                          SizedBox(width: 10,),
                          Text("Apply",style: TextStyle(color: golden),),
                        ],
                      )
                    ],
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}