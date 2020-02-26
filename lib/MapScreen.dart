import 'package:flutter_app_registerpage/Utility.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MapScreen> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  GoogleMapController controller;

  List<LatLng> latlngSegment1 = [];
  List<LatLng> latlngSegment2 = List();
  static LatLng _lat1 = LatLng(22.997478160788, 72.666678429086);
  static LatLng _lat2 = LatLng(23.000243448912, 72.65800952955);
  static LatLng _lat3 = LatLng(23.002534644727, 72.651057243784);
  static LatLng _lat4 = LatLng(23.004983811034, 72.637152672251);
  static LatLng _lat5 = LatLng(23.007906951344, 72.627797127207);
  static LatLng _lat6 = LatLng(23.010356020146, 72.620244026621);
  static LatLng _lat7 = LatLng(23.016059149635, 72.607147693852);
  static LatLng _lat8 = LatLng(23.025681440911, 72.603335380991);
  static LatLng _lat9 = LatLng(23.027893213477, 72.586770058115);
  static LatLng _lat10 = LatLng(23.038951531898, 72.58307933851);
  static LatLng _lat11 = LatLng(23.037213856242, 72.567200661142);
  static LatLng _lat12 = LatLng(23.039662392752, 72.562651634653);
  static LatLng _lat13 = LatLng(23.039820361321, 72.554841042002);
  static LatLng _lat14 = LatLng(23.044954238983, 72.543597221811);
  static LatLng _lat15 = LatLng(23.045902010386, 72.533984184702);
  static LatLng _lat16 = LatLng(23.048113451054, 72.524542808969);
  static LatLng _lat17 = LatLng(23.049772007724, 72.517333031137);
  static LatLng _lat18 = LatLng(23.049984591009, 72.505009174565);

  static LatLng _lat19 = LatLng(22.996930363577, 72.537453174809);
  static LatLng _lat20 = LatLng(23.003724997694, 72.53432035468);
  static LatLng _lat21 = LatLng(23.009610770501, 72.534921169499);
  static LatLng _lat22 = LatLng(23.012810311081, 72.546894550542);
  static LatLng _lat23 = LatLng(23.018130861014, 72.561364174326);
  static LatLng _lat24 = LatLng(23.026287049314, 72.568488121469);
  static LatLng _lat25 = LatLng(23.037279677297, 72.567200661142);
  static LatLng _lat26 = LatLng(23.04914017902, 72.564110756357);
  static LatLng _lat27 = LatLng(23.059864081972, 72.561374902834);
  static LatLng _lat28 = LatLng(23.067508236591, 72.563894391114);
  static LatLng _lat29 = LatLng(23.067583420704, 72.576245069613);
  static LatLng _lat30 = LatLng(23.069214428099, 72.585947513799);
  static LatLng _lat31 = LatLng(23.074228738802, 72.592685222844);
  static LatLng _lat32 = LatLng(23.085638560097, 72.591998577336);
  static LatLng _lat33 = LatLng(23.094542186844, 72.595297694261);
  static LatLng _lat34 = LatLng(23.010649641514, 72.617802143795);
  static LatLng _lat35 = LatLng(22.985414257993, 72.53401994727);

  LatLng _lastMapPosition = _lat1;

  @override
  void initState() {
    super.initState();
    //line segment 1

    latlngSegment1.add(_lat1);
    latlngSegment1.add(_lat2);
    latlngSegment1.add(_lat3);
    latlngSegment1.add(_lat4);
    latlngSegment1.add(_lat5);
    latlngSegment1.add(_lat6);
    latlngSegment1.add(_lat7);
    latlngSegment1.add(_lat8);
    latlngSegment1.add(_lat9);
    latlngSegment1.add(_lat10);
    latlngSegment1.add(_lat11);
    latlngSegment1.add(_lat12);
    latlngSegment1.add(_lat13);
    latlngSegment1.add(_lat14);
    latlngSegment1.add(_lat15);
    latlngSegment1.add(_lat16);
    latlngSegment1.add(_lat17);
    latlngSegment1.add(_lat18);

    //line segment 2
    latlngSegment2.add(_lat19);
    latlngSegment2.add(_lat20);
    latlngSegment2.add(_lat21);
    latlngSegment2.add(_lat22);
    latlngSegment2.add(_lat23);
    latlngSegment2.add(_lat24);
    latlngSegment2.add(_lat25);
    latlngSegment2.add(_lat26);
    latlngSegment2.add(_lat27);
    latlngSegment2.add(_lat28);
    latlngSegment2.add(_lat29);
    latlngSegment2.add(_lat30);
    latlngSegment2.add(_lat31);
    latlngSegment2.add(_lat32);
    latlngSegment2.add(_lat33);
    //  latlngSegment2.add(_lat34);
    //latlngSegment2.add(_lat35);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //that needs a list<Polyline>
        polylines: _polyline,
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _lastMapPosition,
          zoom: 11.0,
        ),
        mapType: MapType.normal,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
      _markers.addAll([
        Marker(
          markerId: MarkerId('value'),
          position: new LatLng(22.997478160788, 72.666678429086),
          infoWindow: new InfoWindow(
            title: 'Polyline',
          ),
        ),
        Marker(
          markerId: MarkerId('value2'),
          position: new LatLng(23.049984591009, 72.505009174565),
          infoWindow: new InfoWindow(
            title: 'Polyline',
          ),
        ),
      ]);
//      _markers.add(Marker(
//        // This marker id can be anything that uniquely identifies each marker.
//        markerId: MarkerId(_lastMapPosition.toString()),
//        //_lastMapPosition is any coordinate which should be your default
//        //position when map opens up
//        position: _lastMapPosition,
//        infoWindow: InfoWindow(
//          title: 'Polyline',
//        ),
//      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment1,
        width: 2,
        color: Colors.blue,
      ));

      //different sections of polyline can have different colors
      _polyline.add(Polyline(
        polylineId: PolylineId('line2'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment2,
        width: 2,
        color: Colors.red,
      ));
    });
  }
}
//class _MyAppState extends State<MapScreen> {
//  GoogleMapController mapController;
//
//  final LatLng _center = const LatLng(45.521563, -122.677433);
//
//  void _onMapCreated(GoogleMapController controller) {
//    mapController = controller;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Map'),
//          backgroundColor: Colors.green[700],
//        ),
//        body: GoogleMap(
//          onMapCreated: _onMapCreated,
//          initialCameraPosition: CameraPosition(
//            target: _center,
//            zoom: 0.0,
//          ),
//        ),
//      ),
//    );
//  }
//}
