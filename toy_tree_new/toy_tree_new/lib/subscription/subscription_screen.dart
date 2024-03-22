import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:toy_tree_new/subscription/payment_screen.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

  bool months = true;
  bool year = false;
  TextEditingController couponCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: golden,
        title: const Text("Subscribe now and start streaming",style: TextStyle(fontSize: 15),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        child: Column(

          children: [
            Container(
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
                children: [
                 Padding(padding: EdgeInsets.symmetric(vertical: 3),
                 child:  Row(
                   children: [
                     Icon(Icons.done,size: 17,),
                     SizedBox(width: 12,),
                     Text("Access to all toy categories"),
                   ],
                 ),),
                 Padding(padding: EdgeInsets.symmetric(vertical: 3),
                 child:  Row(
                   children: [
                     Icon(Icons.done,size: 17,),
                     SizedBox(width: 12,),
                     Text("Order new toys in every 10 \ndays we will deliver toy to you home",),
                   ],
                 ),),
                 Padding(padding: EdgeInsets.symmetric(vertical: 3),
                 child:  Row(
                   children: [
                     Icon(Icons.done,size: 17,),
                     SizedBox(width: 12,),
                     Text("Community Engagement"),
                   ],
                 ),),
                 Padding(padding: EdgeInsets.symmetric(vertical: 3),
                 child:  Row(
                   children: [
                     Icon(Icons.done,size: 17,),
                     SizedBox(width: 12,),
                     Text("Priority Customer Support"),
                   ],
                 ),),


                ],
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                     months = true;
                     year = false;
                     setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: months == true ? Colors.black : Colors.transparent),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 1
                          )
                        ]
                    ),
                    padding: const EdgeInsets.all(8),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("6 Months"),
                            SizedBox(height: 4,),
                            Text("₹5000",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                            SizedBox(height: 4,),
                           // Text("₹50 per month",style: TextStyle(color: Colors.orangeAccent),),
                          ],),
                        const SizedBox(width: 15,),
                        Container(
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
                          child: months == true ? const Icon(Icons.done,size: 15,) : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    months = false;
                    year = true;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: year == true ? Colors.black : Colors.transparent),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 1
                          )
                        ]
                    ),
                    padding: const EdgeInsets.all(8),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1 Year"),
                            SizedBox(height: 4,),
                            Text("₹8000",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                            SizedBox(height: 4,),
                           // Text("₹42 per month",style: TextStyle(color: Colors.orangeAccent),),
                          ],),
                        const SizedBox(width: 15,),
                        Container(
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
                          child: year == true ? const Icon(Icons.done,size: 15,) : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                              print(" clcick ");
                          },
                        ),
                      ],
                    ),
            SizedBox(
              height: 30,
            ),
            Accordion(
              maxOpenSections: 2,
              headerBackgroundColorOpened: Colors.black,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              headerPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              //  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              // sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                AccordionSection(
                  isOpen: false,
                  contentBorderColor: golden,
                  headerBackgroundColor: golden,

                  headerBackgroundColorOpened: golden,
                  header: Text('Discover features and compare plans', style: TextStyle(color: Colors.black,fontSize: 16)),
                  content: Text("2nd Pocket enables Credit and Debit Card holders in India to earn money via their cards by helping others avail discounts available on their cards.\n" +
                      "For example, Rahul wants to buy a phone which is available at a 10% discount online when purchased through Credit cards but Rahul doesn't have any credit card. He reaches out to 2nd Pocket and we help him get that discount by asking our users (You) to place the order on his behalf. This way he gets the discount even without having the right card and you earn reward points on your card plus get some extra cash bonus from us.", style: TextStyle(fontSize: 11,color: Color(0Xff29295D))),
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 1,


                  // onOpenSection: () => print('onOpenSection ...'),
                  // onCloseSection: () => print('onCloseSection ...'),
                ),
              ],
            )
          ],
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
            child: Text("Continue",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
          ),
        ),
      ),
    );
  }
}
