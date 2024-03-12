import 'package:flutter/material.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: golden,
        title: Text("Order Details"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          margin:  EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 2
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Summary',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),
              Text("From the Quick Access screen, enter the complete order number, the customer's telephone number, or the customer's e-mail address and click Find Order."),
              Image.asset("assets/images/skateboard.jpeg",height: 130,width: 100,fit: BoxFit.scaleDown,),
              Text('Name : Skateboard',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
              SizedBox(height: 10,),
              Container(
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2
                      )
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Color : ',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                        Text('Blue'),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text('Catogary : ',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                        Text('-'),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text('Children Age : ',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                        Text('5 to 12 year'),
                      ],
                    ),
                    SizedBox(height: 3,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text('🆔Order ID : 123456789'),
              SizedBox(height: 5,),
              Text('📅 arrived Date : 01-12-2023'),
              SizedBox(height: 5,),
              Text('🚚 Status : Pending'),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2
                      )
                    ]
                ),
                child: Text("💬 Chat whith us"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
