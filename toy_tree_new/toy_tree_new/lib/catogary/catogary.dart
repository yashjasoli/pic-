import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toy_tree_new/catogary/su_catogary.dart';
import 'package:toy_tree_new/model/catogary_model.dart';
import 'package:toy_tree_new/notifions/appTheme.dart';
import 'package:toy_tree_new/search/search_screen.dart';
import 'package:toy_tree_new/service/service.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';
import 'package:toy_tree_new/utility/consts/list.dart';

class AllCatogary extends StatefulWidget {
  const AllCatogary({super.key});

  @override
  State<AllCatogary> createState() => _AllCatogaryState();
}

class _AllCatogaryState extends State<AllCatogary> {
  service wrapar = service();
 late CategoryModel categoryModel;
 bool _isLoading = true;

  void initState() {
    // TODO: implement initState
    // dlatLng = LatLng(widget.dlat, widget.dlang);
    _get_data();
  }

  _get_data()async{
  Map<String,dynamic> pref = await wrapar.category();
  print(pref);
  categoryModel = CategoryModel.fromJson(pref);
  _isLoading = false;
  setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bodyBgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SearchScreen()));
          },
          child: Container(
            height: 40,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.orangeAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12)),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 3, bottom: 5),
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

                        */ /*onChanged: (value){
                  searchon = true;
                  _searchForProduct(value);
                },*/ /*
                      )*/
              ,
            ),
          ),
        ),

      ),
      body: _isLoading == true ? Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        physics:  BouncingScrollPhysics(),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categoryModel.category.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 140,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubCatogary(
                            titel: categoryModel.category[index].name,
                          )));
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
                                  child:
                                  /*CachedNetworkImage(
                                    imageUrl: categoryModel.category[index].image,
                                    fit: BoxFit.fill,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  )*/

                                  Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: NetworkImage(categoryModel.category[index].image),fit: BoxFit.cover,)
                                    ),
                                  )
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                categoryModel.category[index].name,

                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 30,
                ),
                Text('Shop by Brand',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: golden),),
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
                SizedBox(
                  height: 30,
                ),
              ],
            )),
      ),
    );
  }
}
