import 'package:flutter/material.dart';
import 'package:toy_tree_new/auth/ragition.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';
import 'package:toy_tree_new/utility/consts/images.dart';

class Continue extends StatefulWidget {
  const Continue({super.key});

  @override
  State<Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(imgFc5,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
          Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 75,),
              Text("Toy Tree",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
              SizedBox(height: 35,),
              Text('🎉 Where Toys Are Borrowed, Memories Are Created! 🎁',style: TextStyle(fontSize: 17),),
              SizedBox(height: 40,),
              Text('🧸 A World of Toys Awaits You! 🧩',style: TextStyle(fontSize: 17),),
              Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('Exploring New Ways to Play',style: TextStyle(fontSize: 17),),
              ),
            ],
          ),)
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
          );
        },
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          decoration: BoxDecoration(
              color: golden,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Center(
            child: Text("Continue With Phone Number",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 15),),
          ),
        ),
      ),
    );
  }
}
