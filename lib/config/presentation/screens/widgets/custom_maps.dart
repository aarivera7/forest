import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:socio_bosques/config/responsive.dart';

class CustomMaps extends StatefulWidget {
  const CustomMaps({super.key});

  @override
  State<CustomMaps> createState() => _nameState();
}

class _nameState extends State<CustomMaps> {
  late GoogleMapController mapController;
  LatLng center = LatLng(0.0, 0.0);
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }
  

  void _onMapCreated(GoogleMapController controller) {
   
    mapController = controller;
  }
   
   
   Future <LatLng> getCurrentLocation() async {
    final location = loc.Location();
    try {
      var currentLocation = await location.getLocation();
      setState(() {
        center = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _loading = false;
      });
      return center;
    } catch (e) {
      print('Error obteniendo la ubicación: $e');
      return LatLng(0.0, 0.0);
    }
  }
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         SizedBox(
          width: responsive.wp(75),
          height: responsive.hp(30),
          child: _loading
              ? Center(child: CircularProgressIndicator())
              : GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: center,
                    zoom: 15.0,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('currentLocation'),
                      position: center,
                    ),
                  },
                ),
        ),
      ],
    );
  }
}