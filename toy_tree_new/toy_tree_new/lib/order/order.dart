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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order"),
          backgroundColor: golden,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "My Order",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Order Historys",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            my_order(),
            Order_Historys(),
          ],
        ),
      ),
    );
  }

  my_order() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/skateboard.jpeg",
              height: 300,
              width: 300,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            'Skateboard',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Game',
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 50,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'DELIVERY BY 25-SEP-23',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock,
                          size: 15,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '100% SECURE CHECKOUT',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Reoort problem whit this toy",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "You can order new toy after 10 days of playing this toy",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "You can order your next toy on 00/00/0000",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                color: golden.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "Gidelines",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Order_Historys() {
    return ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OrderDetails()));
            },
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 2)]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/skateboard.jpeg",
                        height: 130,
                        width: 100,
                        fit: BoxFit.scaleDown,
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Skateboard',
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18),
                          ),
                          Text('📅 order placed : 01-12-2023'),
                          Text(
                            'bhavngar ,gujrat, indai,364001 ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 30,
                          )
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
        });
  }
}
