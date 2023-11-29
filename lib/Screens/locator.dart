import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class Locator {
  late GoogleMapController mapController;
  Position? position;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final StreamController<Set<Marker>> _streamController =
      StreamController<Set<Marker>>();
  Stream<Set<Marker>> get markerStream => _streamController.stream;

  Future<void> _determinePosition() async {
    bool serviceEnabled;

    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    //return await Geolocator.getCurrentPosition();
    Position position = await Geolocator.getCurrentPosition();
    this.position = position;
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 15)));
    markerCreate();
    _streamController.add(markers.values.toSet());
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void markerCreate() {
    final marker = Marker(
      markerId: MarkerId('currentLocation'),
      position: LatLng(position!.latitude, position!.longitude),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: 'My location', snippet: '$position'),
    );
    markers[MarkerId('place name')] = marker;

    double markerLatitude = -8.049776712513152;
    double markerLongitude = -34.88282349944875;

    final restaurantMarker = Marker(
      markerId: MarkerId('restaurantLocation'),
      position: LatLng(markerLatitude, markerLongitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      infoWindow: InfoWindow(
        title: 'Restaurante',
        snippet: 'Clique para obter mais informações',
      ),
      onTap: () {
        _launchURL(
            'https://www.google.com/maps/place/Delegacia+da+Mulher/@-8.0500587,-34.8920407,16.06z/data=!4m10!1m2!2m1!1sdelegacia+da+mulher+em+recife!3m6!1s0x7ab18931ec711af:0x2f81f4225deb324b!8m2!3d-8.0499813!4d-34.8828561!15sCh1kZWxlZ2FjaWEgZGEgbXVsaGVyIGVtIHJlY2lmZZIBEXBvbGljZV9kZXBhcnRtZW504AEA!16s%2Fg%2F1yg4fhylc?entry=ttu');
      },
    );

    markers[MarkerId('restaurant')] = restaurantMarker;
  }

  void onMarkerTapped(MarkerId markerId) async {
    if (markerId.value == 'restaurantLocation') {
      String url =
          'https://www.google.com/maps/place/Delegacia+da+Mulher/@-8.0500587,-34.8920407,16.06z/data=!4m10!1m2!2m1!1sdelegacia+da+mulher+em+recife!3m6!1s0x7ab18931ec711af:0x2f81f4225deb324b!8m2!3d-8.0499813!4d-34.8828561!15sCh1kZWxlZ2FjaWEgZGEgbXVsaGVyIGVtIHJlY2lmZZIBEXBvbGljZV9kZXBhcnRtZW504AEA!16s%2Fg%2F1yg4fhylc?entry=ttu';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Não foi possível abrir o link.';
      }
    }
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _determinePosition();
    if (position != null) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(position!.latitude, position!.longitude),
              zoom: 15),
        ),
      );
      markerCreate();
      _streamController.add(markers.values.toSet());
    }
  }
}
