import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toy_tree_new/addresh/location.dart';
import 'package:toy_tree_new/home/home.dart';
import 'package:toy_tree_new/service/service.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';

class SignUp extends StatefulWidget {
    LatLng? latLng;
    String? number;
   SignUp({super.key,  this.latLng,this.number});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController dateInput = TextEditingController();
  var startdate;
  late CameraPosition initialCameraPosition;
  late GoogleMapController _googleMapController;
  Set<Marker> markersSet = Set<Marker>();
  static const LatLng center =  LatLng(31.9539494, 35.910635);
  LatLng _lastMapPosition = center;
  late LatLng dlatLng, custlatLng;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController floot = TextEditingController();
  TextEditingController addres = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController dob = TextEditingController();
  bool male = false;
  bool female = false;
  String selectedValue = '';
  service wrapar = service();

  void initState() {
    // TODO: implement initState
    // dlatLng = LatLng(widget.dlat, widget.dlang);
    print( widget.number);
    initialCameraPosition = CameraPosition(
      target: widget.latLng!,
      zoom: 15.5,
    );
    /*googlePlace = GooglePlace(mapKey)*/;
    //_getLocation(latLng);


    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    name.selection = TextSelection.fromPosition(TextPosition(offset: name.text.length),);
    email.selection = TextSelection.fromPosition(TextPosition(offset: email.text.length),);
    floot.selection = TextSelection.fromPosition(TextPosition(offset: floot.text.length),);
    addres.selection = TextSelection.fromPosition(TextPosition(offset: addres.text.length),);
    landmark.selection = TextSelection.fromPosition(TextPosition(offset: landmark.text.length),);

    var dateNow = new DateTime.now();
    var givenDate = dob.text;
    var givenDateFormat = givenDate.isEmpty ? DateTime.now() : DateTime.parse(givenDate);
    var diff = dateNow.difference(givenDateFormat);
    var year = ((diff.inDays)/365).round();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) =>  LocationScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  child: GoogleMap(
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: true,
                    // zoomGesturesEnabled: true,
                    initialCameraPosition: initialCameraPosition,
                    onMapCreated: (controller) => _googleMapController = controller,
                    markers: markersSet,
                    // onLongPress: _add,
                    onCameraMove: _onCameraMove,
                    onCameraIdle: _onCameraIdle,
                    myLocationEnabled: true,
                    // onTap: _handleTap,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Kid Name'),
                    Text('*',style: TextStyle(color: Colors.red),),
                  ],
                ),

                SizedBox(height: 5,),
                TextFormField(
                  controller: name,
                  onChanged: (value) {
                    setState(() {
                      name.text = value;
                    });
                  },
                  decoration: InputDecoration(

                    border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: golden,
                        ),
                      ),

                      contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: golden,
                        ),
                      ),
                    suffixIcon: Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: name.text.length > 6 ? Colors.green : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                      labelStyle: TextStyle(color: golden),
                    hintText: "Kid Name",
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Email'),
                    Text('*',style: TextStyle(color: Colors.red),),
                  ],
                ),
                SizedBox(height: 5,),
                TextFormField(
                  controller: email,
                  onChanged: (value) {
                    setState(() {
                      email.text = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: golden,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: golden,
                        ),
                      ),
                    suffixIcon: Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: email.text.length > 6 ? Colors.green : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                      labelStyle: TextStyle(color: golden),
                      hintText: "Email",
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Address'),
                    Text('*',style: TextStyle(color: Colors.red),),
                  ],
                ),
                SizedBox(height: 5,),
                TextFormField(
                  controller: addres,
                  onChanged: (value) {
                    setState(() {
                      addres.text = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: golden,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: golden,
                        ),
                      ),
                    suffixIcon: Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: addres.text.length > 6 ? Colors.green : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                      labelStyle: TextStyle(color: golden),
                      hintText: "Address",
                  ),
                ),
                SizedBox(height: 10,),
                Text('Floor (optionl)'),
                SizedBox(height: 5,),
                TextFormField(
                  controller: floot,
                  onChanged: (value) {
                    setState(() {
                      floot.text = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: golden,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: golden,
                        ),
                      ),
                    suffixIcon: Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: floot.text.length > 6 ? Colors.green : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                      labelStyle: TextStyle(color: golden),
                      hintText: "Floor (optionl)",
                  ),
                ),
                SizedBox(height: 10,),

                Text('Neareby lanmark (optionl)'),
                SizedBox(height: 5,),
                TextFormField(
                  controller: landmark,
                  onChanged: (value) {
                    setState(() {
                      landmark.text = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: golden,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: golden,
                        ),
                      ),
                    suffixIcon: Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: landmark.text.length > 6 ? Colors.green : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                      labelStyle: TextStyle(color: golden),
                      hintText: "Neareby lanmark (optionl)",
                  ),
                ),
                SizedBox(height: 10,),


                Row(
                  children: [
                    Text('Date of birth'),
                    Text('*',style: TextStyle(color: Colors.red),),
                  ],
                ),
                SizedBox(height: 5,),
                GestureDetector(
                  onTap: ()async{
                    var pickedDate = await DatePicker.showSimpleDatePicker(
                      context,
                      // initialDate: DateTime(2020),
                      firstDate: DateTime(1980),

                      lastDate: DateTime(2090),
                      dateFormat: "dd-MMMM-yyyy",
                      textColor: CupertinoColors.black,
                      itemTextStyle: TextStyle(color: golden),

                      locale: DateTimePickerLocale.en_us,
                      looping: true,
                    );
                    // DateTime? pickedDate = await showDatePicker(
                    //                context: context,
                    //                initialDate: DateTime.now(),
                    //
                    //                firstDate: DateTime(1950),
                    //                //DateTime.now() - not to allow to choose before today.
                    //                lastDate: DateTime(2100),
                    //              );


                    if (pickedDate != null) {
                      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                      // DateFormat('yyyy-MM-dd').format(pickedDate);
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                      print(formattedDate);
                      startdate = formattedDate; //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateInput.text = formattedDate;
                        String ageDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        print('---------------->>>> $ageDate');
                        dob.text = ageDate;//set output date to TextField value.
                      });
                    } else {}
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: golden),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child:  Text( startdate ?? "dd/mm/yyyy",style: TextStyle(color: startdate == null ? Colors.grey : Colors.black,fontWeight: FontWeight.w500,fontSize: 17),),
                        )
                      ],
                    ),
                  ),
                ),
                /*TextFormField(
                  controller: dob,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: GestureDetector(
                      onTap: ()async{
                        var pickedDate = await DatePicker.showSimpleDatePicker(
                          context,
                          // initialDate: DateTime(2020),
                          firstDate: DateTime(1980),
                          lastDate: DateTime(2090),
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          looping: true,
                        );
                        // DateTime? pickedDate = await showDatePicker(
                        //                context: context,
                        //                initialDate: DateTime.now(),
                        //
                        //                firstDate: DateTime(1950),
                        //                //DateTime.now() - not to allow to choose before today.
                        //                lastDate: DateTime(2100),
                        //              );


                                     if (pickedDate != null) {
                                       print(
                                           pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                       String formattedDate =
                                       // DateFormat('yyyy-MM-dd').format(pickedDate);
                                       DateFormat('yyyy-MM-dd').format(pickedDate);
                                       print(formattedDate);
                                       startdate =
                                           formattedDate; //formatted date output using intl package =>  2021-03-16
                                       setState(() {
                                         dateInput.text =
                                             formattedDate;
                                         dob.text = formattedDate;//set output date to TextField value.
                                       });
                                     } else {}
                      },
                      child: Icon(
                        CupertinoIcons.calendar
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: golden,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: golden,
                      ),
                    ),
                    labelStyle: TextStyle(color: golden),
                    hintText: "2003-09-30",
                  ),
                ),*/

               //  Container(
               //    margin: const EdgeInsets.symmetric(
               //        horizontal: 8, vertical: 10),
               //    height: 50,
               //    decoration: BoxDecoration(
               //      color: Colors.white,
               //      borderRadius: BorderRadius.circular(8),
               //      boxShadow: const [
               //        BoxShadow(
               //          color: Colors.black26,
               //          blurRadius: 2,
               //        ),
               //      ],
               //    ),
               //    child: Center(
               //      child: InkWell(
               //        onTap: () async {
               //          DateTime? pickedDate = await showDatePicker(
               //            context: context,
               //            initialDate: DateTime.now(),
               //            firstDate: DateTime(1950),
               //            //DateTime.now() - not to allow to choose before today.
               //            lastDate: DateTime(2100),
               //          );
               //
               //          if (pickedDate != null) {
               //            print(
               //                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
               //            String formattedDate =
               //            // DateFormat('yyyy-MM-dd').format(pickedDate);
               //            DateFormat('dd-MM-yyyy').format(pickedDate);
               //            print(formattedDate);
               //            startdate =
               //                formattedDate; //formatted date output using intl package =>  2021-03-16
               //            setState(() {
               //              dateInput.text =
               //                  formattedDate; //set output date to TextField value.
               //            });
               //          } else {}
               //        },
               //        child: Column(
               //          mainAxisAlignment: MainAxisAlignment.center,
               //          crossAxisAlignment: CrossAxisAlignment.center,
               //          children: [
               //            Text(
               //              "Birthdate",
               //            ),
               //          ],
               //        ),
               //      ),
               //    ),
               //  ),
               // SizedBox(height: 10,),
               //
               //  Text(
               //    startdate ?? "",
               //  ),

               /* TextFormField(
                  controller: dateInput,
                  decoration: InputDecoration(
                      hintText: "Birthdate",
                      labelText: "Birthdate"
                  ),
                ),*/
                SizedBox(height: 20,),


                Row(
                  children: [
                    Text('Gender'),
                    Text('*',style: TextStyle(color: Colors.red),),
                  ],
                ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child:  Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      child: RadioListTile<String>(
                        title: Text('Boy'),
                        value: 'Boy',
                        activeColor: golden,
                        groupValue: selectedValue,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.45,
                      child: RadioListTile<String>(
                        title: Text('Girl'),
                        value: 'Girl',
                        groupValue: selectedValue,
                        contentPadding: EdgeInsets.zero,

                        activeColor: golden,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
                const SizedBox(height: 10,),
               /* Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          male = true;
                          female = false;
                          //  buttonText = "Rs 1000";
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: male == false ? Colors.white : Colors.orangeAccent,
                            borderRadius:  BorderRadius.circular(5),
                            boxShadow: [
                              const BoxShadow(
                                  color: Colors.orangeAccent,
                                  spreadRadius: 1
                              )
                            ]
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text("  👶🏻 Male  ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color : male != false ? Colors.white : Colors.orangeAccent,),),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),

                    InkWell(
                      onTap: (){
                        setState(() {
                          female = true;
                          male = false;
                          // buttonText = "Rs 2000";
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: female == false ? Colors.white : Colors.orangeAccent,
                            borderRadius:  BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.orangeAccent,
                                  spreadRadius: 1
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(" 👧🏼 Female",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16 ,color : female != false ? Colors.white : Colors.orangeAccent,),),
                        ),
                      ),
                    ),

                  ],
                ),*/
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: ()async{
                    setState(() {
                      print(dob.text);
                    });
                   if(year >= 15){
                     Fluttertoast.showToast(
                         msg: 'You are 15 year up',
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.CENTER,
                         timeInSecForIosWeb: 1,
                         backgroundColor: Colors.red,
                         textColor: Colors.white,
                         fontSize: 16.0
                     );
                   }else{
                     if(name.text != '' && email.text != '' && addres.text != ''  && startdate != '' && selectedValue != "" ){
                       wrapar.singup(name.text, email.text, addres.text, floot.text, landmark.text, startdate.toString(), selectedValue, widget.number);
                       Navigator.of(context).pushReplacement(
                         MaterialPageRoute(builder: (_) => const Home()),
                       );
                       SharedPreferences sharedPreferences =
                           await SharedPreferences.getInstance();
                       sharedPreferences.setBool("isLogin", true);
                     }else
                     {
                       Fluttertoast.showToast(
                           msg: 'Please Enter Data',
                           toastLength: Toast.LENGTH_SHORT,
                           gravity: ToastGravity.CENTER,
                           timeInSecForIosWeb: 1,
                           backgroundColor: Colors.red,
                           textColor: Colors.white,
                           fontSize: 16.0
                       );
                     }
                   }

                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: golden,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Text("Update Address",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),

    );
  }
  void _onCameraMove(CameraPosition position) {
    widget.latLng == "" ? _lastMapPosition : widget.latLng = position.target;
    // print(TAG + " new position "+ _lastMapPosition.longitude.toString());
  }

  void _onCameraIdle() {
    setState(() {
    //  isSearching = true;
    });
   // _getLocation(_lastMapPosition);
  }
}
