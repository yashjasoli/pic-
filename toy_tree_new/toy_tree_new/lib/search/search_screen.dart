import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';
import 'package:toy_tree_new/utility/consts/list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchControlled = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: golden,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Container(
          height: 40,
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.circular(12)),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchScreen()));
            },
            child:
             TextFormField(
               controller: searchControlled,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(bottom: 13),
                          hintText: 'Search for toys',
                          icon: Icon(Icons.search),
                          border: InputBorder.none,
                          //fillColor: Colors.green
                        ),

               /*  onChanged: (value){
                  searchon = true;
                  _searchForProduct(value);
                },*/
            ),
          ),
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 12,top: 12,right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Resent searchs",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  setState(() {
                    searchControlled.text = "Ches";
                  });
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(" Ches ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Tranding searchs",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
              SizedBox(height: 15,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        searchControlled.text = "Spa";
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0.5
                            )
                          ]
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(" Spa ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        searchControlled.text = "Kitchen";
                      });
                    },
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0.5
                            )
                          ]
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(" Kitchen ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        searchControlled.text = "Sand & Water";
                      });
                    },
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0.5
                            )
                          ]
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(" Sand & Water ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        searchControlled.text = "Swimming pool";
                      });
                    },
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0.5
                            )
                          ]
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(" Swimming pool ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        searchControlled.text = "Doll House";
                      });
                    },
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0.5
                            )
                          ]
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(" Doll House ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  setState(() {
                    searchControlled.text = "Cocomelon";
                  });
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(" Cocomelon ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Trending Brands',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: golden),),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: brandImage.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        height: 50,
                        width: 80,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 12,top: 12,bottom: 12,left: 1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 2
                              )
                            ]
                        ),
                        child: Image.network(brandImage[index]),
                      );
                    }),
              ),
              Text('Water Games',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: golden),),
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
                          child: Image.network(
                            waterGame[i],
                            fit: BoxFit.fill,
                          ));
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
