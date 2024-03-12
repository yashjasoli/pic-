import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toy_tree_new/auth/otp.dart';
import 'package:toy_tree_new/auth/sign_up.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:http/http.dart';
import 'package:velocity_x/velocity_x.dart';

class LocationScreen extends StatefulWidget {
  String? number;
   LocationScreen({Key? key,this.number}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late CameraPosition initialCameraPosition;
  TextEditingController searchController = TextEditingController();
  late GoogleMapController _googleMapController;
  Set<Marker> markersSet = Set<Marker>();
  static const LatLng center = LatLng(23.0225, 72.5714);
  LatLng _lastMapPosition = center;
  bool isSearching = false;
  late Position currentPosition;
  late LatLng dlatLng, custlatLng;
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newRideGoogleMapController;
  Set<Circle> circleSet = Set<Circle>();
  Set<Polyline> polyLineSet = Set<Polyline>();
  String _title = "";
  List<Suggestion> placeList = [];
  String _detail = "";
  List<geocoding.Placemark> addresses = [];
  final mapKey = "AIzaSyAbqh-VYxcSIfkBhWXMaWYnDBZx2v9P8dQ";
  int sessiontoken = 1100;
  Position? _currentPosition;
  var app_user_addresses = '';
  void initState() {
    // TODO: implement initState
    // dlatLng = LatLng(widget.dlat, widget.dlang);
    custlatLng= LatLng(23.0225,72.5714);
    initialCameraPosition = CameraPosition(
      target: LatLng(23.0225, 72.5714),
      zoom: 18.5,
    );
    /*googlePlace = GooglePlace(mapKey)*/;
    //_getLocation(latLng);
    _lastMapPosition = custlatLng;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const OtpScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        // on below line we have given title of app
        title: TextField(
            controller: searchController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20, 6, 5, 6),
                isDense: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                hintText: 'Search address',
                hintStyle: TextStyle(fontSize: 14),
              // filled: true,
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                // autoCompleteSearch(value);
                findPlace(value);
              } else {
                if (placeList.isNotEmpty && mounted) {
                  setState(() {
                    placeList.clear();
                  });
                }
              }
            }),
      ),
      body: Stack(
        children: [
          Container(),
          Container(
            child: GoogleMap(
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              // zoomGesturesEnabled: true,
              initialCameraPosition: initialCameraPosition,
              onMapCreated: (controller) => _googleMapController = controller,
              markers: markersSet,
             //  onLongPress: _add,
              onCameraMove: _onCameraMove,
              onCameraIdle: _onCameraIdle,
              myLocationEnabled: true,
              // onTap: _handleTap,
            ),
          ),
          /*Container(
            child: GoogleMap(
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              // zoomGesturesEnabled: true,
              initialCameraPosition: initialCameraPosition,
              mapType: MapType.normal,
              myLocationEnabled: true,
              markers: markersSet,
              onCameraMove: _onCameraMove,
              onCameraIdle: _onCameraIdle,
              circles: circleSet,
              polylines: polyLineSet,
              onMapCreated: (GoogleMapController controller) async
              {
                _controllerGoogleMap.complete(controller);
                newRideGoogleMapController = controller;

                setState(() {
                  //    mapPaddingFromBottom = 265.0;
                });

                var currentLatLng = LatLng(currentPosition.latitude, currentPosition.longitude);
                //var currentLatLng = dlatLng;

                var pickUpLatLng = custlatLng;

                await getPlaceDirection(currentLatLng, pickUpLatLng);

               // getRideLiveLocationUpdates();
              },
            ),

          ),*/
          Center(
            child:Image.network('https://www.iconpacks.net/icons/2/free-location-pin-icon-2964-thumb.png',scale: 12,),
          ),
          if (placeList.isNotEmpty)
            Container(
              color: Colors.grey.shade100,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: placeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      placeList[index].description.toString(),
                    ),
                    onTap: () async {
                      FocusManager.instance.primaryFocus!.unfocus();
                      // debugPrint(predictions[index].description);
                      // var placeID = predictions[index].placeId;
                      List<geocoding.Location> location =
                      await geocoding.locationFromAddress(placeList[index].description);

                      // List<geocoding.Location> location =
                      //     await geocoding.locationFromAddress(
                      //         predictions[index].description!);
                      LatLng latLng = LatLng(location[0].latitude, location[0].longitude);
                      _lastMapPosition = latLng;
                      _onCameraIdle();

                      await _googleMapController.moveCamera(CameraUpdate.newLatLng(latLng));
                      _getLocation(latLng);
                      setState(() {
                        searchController.clear();
                        // predictions.clear();
                        placeList.clear();
                      });
                      // .animateCamera();
                    },
                  );
                },
              ),
            ),
        ],
      ),
      // on pressing floating action button the camera will take to user current location

      bottomNavigationBar: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.orangeAccent,
              blurRadius: 3
            )
          ],
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10,top: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: app_user_addresses != '' ? SizedBox() : Text("Oops!",textAlign: TextAlign.center, style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),),
              ),
              app_user_addresses != '' ?  Text("Delivering your order to",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
              : Text("Blinkit not available at this location at the moment. please select a different location",textAlign: TextAlign.center, style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.grey),),
              SizedBox(height: 5,),
              app_user_addresses != '' ? Container(
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                height: 53,
                decoration: BoxDecoration(
                  color: Vx.orange500.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)
                ),
                child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(width: 20,),
                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${addresses.first.street} , ${addresses.first.name}",overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                          Text("${addresses.first.locality}"),
                        ],
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubscribeScreen()));
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          height: 35,
                          child:Center(child: Text('change',style: TextStyle(color: Colors.white),),)
                      ),
                    )
                  ],
                ),
              ) : GestureDetector(
                onTap: (){
                  _getCurrentPosition();
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUp()));
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text("go to current location",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              app_user_addresses != '' ? GestureDetector(
                onTap: (){
                  print(_lastMapPosition);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) =>  SignUp(latLng: _lastMapPosition,number: widget.number,)),
                  );
               //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUp()));
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text("Confirm location & proceed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                  ),
                ),
              ) :
              GestureDetector(
                onTap: (){
                 // _getCurrentPosition();
                  app_user_addresses = ' ';
                  setState(() {});
                 // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUp(latLng: LatLng(31.9539494, 35.910635),number: widget.number,)));
                },
                child: Center(
                  child: Text("select location manuallyss",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.w500),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
    // print(TAG + " new position "+ _lastMapPosition.longitude.toString());
  }

  void _onCameraIdle() {
    setState(() {
      isSearching = true;
    });
    _getLocation(_lastMapPosition);
  }
  void findPlace(String placeName) async {
    //  print(TAG + " place name " + placeName);
    if (placeName.length > 1) {
      String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=" +
              sessiontoken.toString();

      final client = Client();
      final response = await client.get(Uri.parse(autoCompleteUrl));
      // var res = await RequestAssistant.getRequest(autoCompleteUrl);

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'OK') {
          // compose suggestions in a list
          //   print(result['predictions'].map<Suggestion>((p) => Suggestion(p['place_id'], p['description'])).toList());
          setState(() {
            placeList =
                result['predictions'].map<Suggestion>((p) => Suggestion(p['place_id'], p['description'])).toList();
          });
          return result['predictions'].map<Suggestion>((p) => Suggestion(p['place_id'], p['description'])).toList();
        }
        if (result['status'] == 'ZERO_RESULTS') {
          // return [];
        }
        throw Exception(result['error_message']);
      } else {
        throw Exception('Failed to fetch suggestion');
      }
    }

    // print(TAG + " result res " + res.toString());
    // if (res == "failed") {
    //   print(TAG + " result failed ");
    //   return;
    // }

    // if (res["status"] == "OK") {
    //   print(TAG + " result OK  ");
    //   var predictions = res["predictions"];

    //   var placesList = (predictions as List).map((e) => PlacePredictions.fromJson(e)).toList();

    //   setState(() {
    //    // placeAddress = placeName;
    //     placePredictionList = placesList;
    //   });
  }

  _getLocation(LatLng point) async {
    // final coordinates = new Coordinates(point.latitude, point.longitude);

    addresses = await geocoding.placemarkFromCoordinates(point.latitude, point.longitude);
    // var addresses =await Geocoder.local.findAddressesFromCoordinates(coordinates);
    _lastMapPosition = LatLng(point.latitude, point.longitude);

    var first = addresses.first;
      print(" new address "+ "${first.name} : ${first.locality}");
      print(addresses);

    setState(() {
      isSearching = false;
      _title = first.thoroughfare!;
      _detail = first.subLocality!;

     // _lane1.text = _title + "   " + _detail + "    " + first.locality!;
    });
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

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);

      setState(() {
        // _lane1.text =  _currentAddress!;
      });
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {

    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];



      setState(() {
        debugPrint(place.toString());
         addresses = placemarks;
        LatLng latLng = LatLng( _currentPosition!.latitude, _currentPosition!.longitude);
        _lastMapPosition = latLng;
         _googleMapController.moveCamera(CameraUpdate.newLatLng(latLng));
       /* app_user_lattitude = _currentPosition!.latitude.toString();
        app_user_longitude = _currentPosition!.longitude.toString();*/
        print("-------->>> ${place.subAdministrativeArea},${place.locality},${place.country} ${place.postalCode}");
      //  print(app_user_longitude);
        // point = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
       app_user_addresses = '${place.subAdministrativeArea},${place.locality},${place.country} ${place.postalCode}';
       // print(app_user_addresses);
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }


  /*Future<void> getPlaceDirection(LatLng pickUpLatLng, LatLng dropOffLatLng) async
  {
    print(TAG + " getPlaceDirection:");

    var details = await AssistantMethods.obtainPlaceDirectionDetails(pickUpLatLng, dropOffLatLng);

    //Navigator.pop(context);


    print(TAG +  details.encodedPoints.toString());

    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolyLinePointsResult = polylinePoints.decodePolyline(details.encodedPoints!);

    polylineCorOrdinates.clear();

    if(decodedPolyLinePointsResult.isNotEmpty)
    {
      decodedPolyLinePointsResult.forEach((PointLatLng pointLatLng) {
        polylineCorOrdinates.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    polyLineSet.clear();

    setState(() {
      Polyline polyline = Polyline(
        color: Colors.pink,
        polylineId: PolylineId("PolylineID"),
        jointType: JointType.round,
        points: polylineCorOrdinates,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );

      polyLineSet.add(polyline);
    });

    LatLngBounds latLngBounds;
    if(pickUpLatLng.latitude > dropOffLatLng.latitude  &&  pickUpLatLng.longitude > dropOffLatLng.longitude)
    {
      latLngBounds = LatLngBounds(southwest: dropOffLatLng, northeast: pickUpLatLng);
    }
    else if(pickUpLatLng.longitude > dropOffLatLng.longitude)
    {
      latLngBounds = LatLngBounds(southwest: LatLng(pickUpLatLng.latitude, dropOffLatLng.longitude), northeast: LatLng(dropOffLatLng.latitude, pickUpLatLng.longitude));
    }
    else if(pickUpLatLng.latitude > dropOffLatLng.latitude)
    {
      latLngBounds = LatLngBounds(southwest: LatLng(dropOffLatLng.latitude, pickUpLatLng.longitude), northeast: LatLng(pickUpLatLng.latitude, dropOffLatLng.longitude));
    }
    else
    {
      latLngBounds = LatLngBounds(southwest: pickUpLatLng, northeast: dropOffLatLng);
    }

    newRideGoogleMapController.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));

    Marker pickUpLocMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      position: pickUpLatLng,
      markerId: MarkerId("pickUpId"),
    );

    Marker dropOffLocMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: dropOffLatLng,
      markerId: MarkerId("dropOffId"),
    );

    setState(() {
      markersSet.add(pickUpLocMarker);
      markersSet.add(dropOffLocMarker);
    });

    Circle pickUpLocCircle = Circle(
      fillColor: Colors.blueAccent,
      center: pickUpLatLng,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.blueAccent,
      circleId: CircleId("pickUpId"),
    );

    Circle dropOffLocCircle = Circle(
      fillColor: Colors.deepPurple,
      center: dropOffLatLng,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.deepPurple,
      circleId: CircleId("dropOffId"),
    );

    setState(() {
      circleSet.add(pickUpLocCircle);
      circleSet.add(dropOffLocCircle);
    });
  }*/

}

class Suggestion {
  final String placeId;
  final String description;

  Suggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}