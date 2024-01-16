import 'package:flutter/material.dart';
import 'package:toy_tree_new/order/order_details.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: golden,
        title: Text("Order"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OrderDetails()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/skateboard.jpeg",height: 130,width: 100,fit: BoxFit.scaleDown,),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Skateboard',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
                                  Text('📅 order placed : 01-12-2023'),
                                  Text('bhavngar ,gujrat, indai,364001 ',overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 30,)
                                  //  Spacer()
                                ],
                              )
                            ],
                          ),
                          Divider(),
                          Text('🚚 Status : Pending')
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
