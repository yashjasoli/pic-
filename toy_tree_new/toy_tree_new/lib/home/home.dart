import 'package:get/get.dart';
import 'package:toy_tree_new/catogary/catogary.dart';
import 'package:toy_tree_new/home/home_screen.dart';
import 'package:toy_tree_new/order/order.dart';
import 'package:toy_tree_new/utility/consts/consts.dart';
import '../profaile/profaile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Properties

  int currentTab = 0;
  final List<Widget> screen = [
 //   const OrderScreen(),
    const HomeScreen(),
  //   CategoryScreen(),
   // const FnqScreen(),
    AccountScreen(),
  ];

  //Active Page(Tab)

   Widget currentScreen = const HomeScreen();

  final PageStorageBucket bucket = PageStorageBucket();
  // final auth = FirebaseAuth.instance;
  int _tabIndex = 1;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDBA74),
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Vx.orange50,
          shape: CircleBorder(eccentricity: 0,),


          onPressed: () {

            setState(
                  () {
                // Get.offAll(HomeScreen());
                currentScreen = AllCatogary();
                currentTab = 5;
              },
            );


           // Get.to( CategoryScreen());
          },
          child:  Icon(
            Icons.category,
            color: currentTab == 5 ? Colors.orange : Colors.grey,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(
                            () {
                              // Get.offAll(HomeScreen());
                              currentScreen = const HomeScreen();
                              currentTab = 0;
                            },
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              color:
                                  currentTab == 0 ? Colors.orange : Colors.grey,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color:
                                    currentTab == 0 ? Colors.orange : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(
                            () {
                            //  Get.offAll(OrderScreen());
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OrderScreen()));
                            //  currentScreen = const OrderScreen();
                              currentTab = 1;
                            },
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.bookmark_add,
                              color:
                                  currentTab == 1 ? Colors.orange : Colors.grey,
                            ),
                            Text(
                              'Order',
                              style: TextStyle(
                                color:
                                    currentTab == 1 ? Colors.orange : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(
                                () {
                              //   Get.offAll(FnqScreen());
                              //  currentScreen = const FnqScreen();
                              currentTab = 3;
                            },
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.message,
                              color:
                              currentTab == 3 ? Colors.orange : Colors.grey,
                            ),
                            Text(
                              'Help',
                              style: TextStyle(
                                color:
                                currentTab == 3 ? Colors.orange : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(
                            () {
                             // Get.offAll(AccountScreen());
                              currentScreen =  AccountScreen();
                              currentTab = 2;
                            },
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.manage_accounts,
                              color:
                                  currentTab == 2 ? Colors.orange : Colors.grey,
                            ),
                            Text(
                              'Account',
                              style: TextStyle(
                                color:
                                    currentTab == 2 ? Colors.orange : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
