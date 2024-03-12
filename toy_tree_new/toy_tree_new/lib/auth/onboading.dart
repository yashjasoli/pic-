// ignore_for_file: must_be_immutable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toy_tree_new/auth/continue.dart';
import 'package:toy_tree_new/auth/ragition.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';
import 'package:toy_tree_new/utility/consts/list.dart';

PageController _controller = PageController(initialPage: 0);

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // List<homeScreenProductImagelist> slides = <SliderModel>[];
  int currentIndex = 0;
  var gettokan;

  bool isLoding = true;

  @override
  void initState() {
    _handleLocationPermission();
    // TODO: implement initState
    super.initState();
    // _controller = PageController(initialPage: 0);
    // slides = getSlides();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.78,
                child: PageView.builder(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemCount: onbodingProductImagelist.length,
                    itemBuilder: (context, index) {
                      // contents of slider
                      return Slider(
                        image: onbodingProductImagelist[index],
                        //description: slides[index].getDescription(),
                        // title: slides[index].title,
                      );
                    }),
              ),
              SizedBox(height: 100,
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(onPressed: (){
                  _controller.jumpToPage(2);
                }, child: Text("Skip",style: TextStyle(fontSize: 18,color: golden),)),
              ),),

            ],
          ),

        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          currentIndex == 0 ? Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            width: 50,
          ) :
          GestureDetector(
            onTap: () {
              if (currentIndex == onbodingProductImagelist.length - 1) {

              }
              _controller.previousPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn);

              _controller.jumpToPage(currentIndex--);
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(10),
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onTap: () {
                    if (currentIndex ==
                        onbodingProductImagelist.length - 1) {

                    }
                    _controller.previousPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onbodingProductImagelist.length,
                  (index) => buildDot(index, context),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == onbodingProductImagelist.length - 1) {

              }
              _controller.jumpToPage(currentIndex++);
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(10),
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent, shape: BoxShape.circle),
              child:
              Padding(
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),

                  onTap: () {
                    if (currentIndex ==
                        onbodingProductImagelist.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Continue()),
                      );
                    }
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

// container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: currentIndex == index ? 15 : 10,
      width: currentIndex == index ? 15 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? Colors.orangeAccent
            : Colors.orangeAccent.withOpacity(0.5),
      ),
    );
  }
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }
  skip() {}
}

// ignore: must_be_immutable
// slider declared
class Slider extends StatefulWidget {
  String? image;
  String? description;
  String? title;

  Slider({super.key, this.image, this.description, this.title});

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    onPrimary: Colors.transparent,
                  ),
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    _controller.jumpToPage(4);
                  },
                  // textColor: Colors.white,
                  //  shape: RoundedRectangleBorder(
                  //    borderRadius: BorderRadius.circular(25),
                  // ),
                ),
              ),
            ),
          ),
          // image given in slider
          Image.asset(widget.image!),
          /*Text(
              widget.title!,
            ),*/
          //   const SizedBox(height: 25),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

}

/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:toy_tree_new/auth/ragition.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      skipStyle: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 17)),
          foregroundColor: MaterialStateProperty.all(Colors.orangeAccent)),
      allowImplicitScrolling: true,
      autoScrollDuration: 300000,
      infiniteAutoScroll: true,
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Text('Your Personal Habit Manager',
                  style: GoogleFonts.mochiyPopOne(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 248, 64, 64))),
              const SizedBox(height: 20),
              const Image(image: NetworkImage('https://cdn.firstcry.com/education/2022/11/06094158/Toy-Names-For-Kids.jpg')),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(image: NetworkImage('https://5.imimg.com/data5/HQ/TD/MY-2735848/bento.jpg')),
              const SizedBox(height: 20),
              Text('Play Guitar!',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.mochiyPopOne(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 119, 56, 199)))
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Listen Music!',
                  style: GoogleFonts.mochiyPopOne(
                      fontSize: 33,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 248, 64, 64))),
              const SizedBox(height: 20),
              const Image(image: NetworkImage('https://i.pinimg.com/236x/21/93/7e/21937e986f65e0a6fa6d5da07f37158a.jpg')),
            ],
          ),
        ),
      ],
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      // onChange: (val) {},
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(
        Icons.arrow_forward,
      ),
      done: const Text('Done',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.orangeAccent)),
      onDone: () => _onIntroEnd(context),
      nextStyle: ButtonStyle(
          foregroundColor:
          MaterialStateProperty.all( Colors.orangeAccent)),
      dotsDecorator: const DotsDecorator(
        size: Size.square(10),
        activeColor: Colors.orangeAccent,
        activeSize: Size.square(17),
      ),
    );
  }
}*/
