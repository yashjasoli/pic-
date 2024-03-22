import 'package:flutter/material.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  TextEditingController couponCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: golden,
        title: const Text("Subscription Details",style: TextStyle(fontSize: 15),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
          child: Column(


            children: [
              Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 1
                      )
                    ]
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text("   ₹3199",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Quarterly"),
                        Text("₹3199")
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Refundable deposit"),
                        Text("₹1000")
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Coupon Code descount",style: TextStyle(color: Colors.green),),
                        Text("- ₹1000",style: TextStyle(color: Colors.green),)
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",style: TextStyle(fontWeight: FontWeight.w500),),
                        Text("₹5199",style: TextStyle(fontWeight: FontWeight.w500),)
                      ],
                    ),


                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: couponCodeController,
                      decoration: InputDecoration(
                        counterText: "",
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(4)),
                        labelText: "Coupon Code",
                        labelStyle: const TextStyle(color: Colors.black),
                        enabled: true,
                      ),
                      onChanged: (value) {
                        setState(() {
                        });
                        // print(couponCode + '-----------------');
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4), color: golden),
                      child: const Text(
                        "Apply",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onTap: () {
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Container(
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(5),
                       border: Border.all( color: Colors.black),
                       boxShadow: const [
                         BoxShadow(
                             color: Colors.black38,
                             blurRadius: 1
                         )
                       ]
                   ),
                   child: ListTile(
                     trailing: Container(
                       height: 20,
                       width: 20,
                       decoration: const BoxDecoration(
                           shape: BoxShape.circle,
                           color: Colors.white,
                           boxShadow: [
                             BoxShadow(
                                 color: Colors.black38,
                                 blurRadius: 1
                             )
                           ]
                       ),
                       child:  const Icon(Icons.done,size: 15,color: Colors.black,),
                     ),
                     leading: const Icon(
                         Icons.credit_card,size: 30,color: Colors.black,
                     ),
                     title: const Text("Credit/Debit Card",style: TextStyle(color: Colors.black),),
                     subtitle: const Text("Visa & Mastercard",style: TextStyle(color: Colors.black),),
                   ),
                 ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all( color: Colors.black),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 0
                          )
                        ]
                    ),
                    child: const ListTile(
                      leading: Icon(
                        Icons.note_add_rounded,size: 30,color: Colors.black,
                      ),
                      title: Row(
                        children: [
                          Text("UPI *",style: TextStyle(color: Colors.black),),
                         // Text("Coming Soon...",style: TextStyle(color: golden,fontWeight: FontWeight.w600),)
                        ],
                      ),
                      subtitle: Text("Google Pay, PhonePe, Paytm & more",style: TextStyle(color: Colors.black),),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const PaymentScreen()));
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          decoration: BoxDecoration(
              color: golden,
              borderRadius: BorderRadius.circular(5)
          ),
          child: const Center(
            child: Text("Pay ₹5199",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
          ),
        ),
      ),
    );
  }
}
