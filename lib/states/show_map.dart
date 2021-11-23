import 'dart:math';
import 'package:findfault/models/current_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMap extends StatefulWidget {
  final CurrentModel currentModle;
  const ShowMap({Key? key, required this.currentModle}) : super(key: key);

  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  double? lat;
  double? long;
  Map<MarkerId, Marker> markers = {};
  CurrentModel? currentModle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentModle = widget.currentModle;
    addMarker(currentModle!.lat, currentModle!.long);

    findlatlong();
  }

  void addMarker(double lat, double long) {
    int i = Random().nextInt(1000);
    String id = 'id$i';
    print('### id ที่สุ่มได้ ==> $id');
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
        markerId: markerId,
        position: LatLng(lat, long),
        infoWindow: InfoWindow(
            title: 'จุดเกิดFault at Current ${currentModle!.current}',
            snippet:
                'รายละเอียด ที่ lat = ${currentModle!.lat} lng = ${currentModle!.long}') //โชว์ point
        );
    if (markers.length != 0) {
      markers.clear();
    }
    setState(() {
      markers[markerId] = marker;
    });
  }

  Future<Null> findlatlong() async {
    Position? position = await findpisition();
    if (position != null) {
      setState(() {
        lat = position.latitude;
        long = position.longitude;
      });
      print('##findlatlong working lat =$lat, lng =$long');
    }
  }

  Future<Position?> findpisition() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition();
    } catch (e) {
      position = null;
    }
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('แสดงแผ่นที่'),),
      body: SafeArea(
        child: lat == null
            ? CircularProgressIndicator()
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(currentModle!.lat, currentModle!.long),
                  zoom: 16, //zoomแผนที่ focus
                ),
                onMapCreated: (controller) {},
                myLocationEnabled: true,
                onTap: (argument) {
                  print(
                      '### lat = ${argument.latitude}, lng = ${argument.longitude}');
                  // addMarker(argument.latitude, argument.longitude);
                },
                markers: Set<Marker>.of(markers.values),
              ),
      ),
    );
  }
}
