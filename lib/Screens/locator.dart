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

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

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
    if (position != null) {
      final marker = Marker(
        markerId: MarkerId('currentLocation'),
        position: LatLng(position!.latitude, position!.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: 'My location', snippet: '$position'),
      );
      markers[MarkerId('currentLocation')] = marker;

      addMarker(
        'Santo Amaro',
        -8.049776712513152,
        -34.88282349944875,
        'https://www.google.com/maps/place/Delegacia+da+Mulher/@-8.0500587,-34.8920407,16.06z/data=!4m10!1m2!2m1!1sdelegacia+da+mulher+em+recife!3m6!1s0x7ab18931ec711af:0x2f81f4225deb324b!8m2!3d-8.0499813!4d-34.8828561!15sCh1kZWxlZ2FjaWEgZGEgbXVsaGVyIGVtIHJlY2lmZZIBEXBvbGljZV9kZXBhcnRtZW504AEA!16s%2Fg%2F1yg4fhylc?entry=ttu',
      );
      addMarker('Recife Antigo', -8.061293859757267, -34.870989012917335,
          'https://maps.app.goo.gl/amvsoyDGjNv3Kdye7');
      addMarker('Prazeres', -8.14833991877608, -34.92128142619059,
          "https://www.google.com/maps/place/2%C2%B0+Delegacia+de+Pol%C3%ADcia+da+Mulher+-+Prazeres+-+2+DEMUL/@-8.1535227,-34.9971558,13z/data=!4m10!1m2!2m1!1sdelegacia+da+mulher+em+camaragibe!3m6!1s0x7aae1db3ae3e163:0xdd22b6318c36b020!8m2!3d-8.1535227!4d-34.9209381!15sCiFkZWxlZ2FjaWEgZGEgbXVsaGVyIGVtIGNhbWFyYWdpYmWSAQ5wb2xpY2Vfc3RhdGlvbuABAA!16s%2Fg%2F1ptzwqxzf?entry=ttu");

      addMarker('paulista', -8.153299663730497, -34.920895189205794,
          'https://www.google.com/maps/place/5%C2%AA+Delegacia+de+Pol%C3%ADcia+-+Especializada+da+Mulher/@-7.9392195,-34.8833438,16.63z/data=!4m6!3m5!1s0x7ab16130452d87b:0xd6f6c2d7a3acf8a2!8m2!3d-7.9396452!4d-34.8829228!16s%2Fg%2F11b6j8b5t0?entry=ttu');

      addMarker('Jaboatão', -8.153299663730497, -34.920895189205794,
          'https://www.google.com/maps/place/2%C2%B0+Delegacia+de+Pol%C3%ADcia+da+Mulher+-+Prazeres+-+2+DEMUL/@-8.1535174,-34.923513,17z/data=!3m1!4b1!4m6!3m5!1s0x7aae1db3ae3e163:0xdd22b6318c36b020!8m2!3d-8.1535227!4d-34.9209381!16s%2Fg%2F1ptzwqxzf?entry=ttu');

      addMarker('Cabo', -8.225321417072605, -34.970381624464466,
          'https://www.google.com/maps/place/14%C2%B0+Delegacia+da+Mulher/@-8.226808,-35.0081471,14z/data=!4m10!1m2!2m1!1sdelegacia+da+mulher+em+cabo+de+santo+agostinho!3m6!1s0x7aae413083ffc69:0xad224d38ebc93b95!8m2!3d-8.226808!4d-34.9700383!15sCi5kZWxlZ2FjaWEgZGEgbXVsaGVyIGVtIGNhYm8gZGUgc2FudG8gYWdvc3RpbmhvkgETc2hlcmlmZnNfZGVwYXJ0bWVudOABAA!16s%2Fg%2F11gghp5fyw?entry=ttu');
      addMarker('Cabo 2', -8.281682317639824, -35.03293420967235,
          'https://www.google.com/maps/place/Secretaria+Executiva+da+Mulher+do+Cabo/@-8.2836783,-35.0713005,14z/data=!4m10!1m2!2m1!1sdelegacia+da+mulher+em+cabo+de+santo+agostinho!3m6!1s0x7aaef0bdb741387:0x8bcab0cddb4c24d9!8m2!3d-8.2836783!4d-35.0331917!15sCi5kZWxlZ2FjaWEgZGEgbXVsaGVyIGVtIGNhYm8gZGUgc2FudG8gYWdvc3RpbmhvkgEZd29tZW5zX3Byb3RlY3Rpb25fc2VydmljZeABAA!16s%2Fg%2F11r7yny82d?entry=ttu');
      addMarker('olinda', -7.9827542212229705, -34.83827428416611,
          ' https://www.google.com/maps/place/Delegacia+da+mulher+de+Olinda/@-7.9842842,-34.9910529,12z/data=!4m10!1m2!2m1!1sdelegacia+da+mulher+em+Moreno!3m6!1s0x7ab3d8616010019:0x116e2664195fa57!8m2!3d-7.9842842!4d-34.8386176!15sCh1kZWxlZ2FjaWEgZGEgbXVsaGVyIGVtIE1vcmVub5IBE3NoZXJpZmZzX2RlcGFydG1lbnTgAQA!16s%2Fg%2F11t7f9fs51?entry=ttu');
          addMarker('igarassu', -7.824294372377158,  -34.90887141621114, 'https://www.google.com/maps/place/Vara+de+Viol%C3%AAncia+Dom%C3%A9stica+e+Familiar+contra+a+Mulher+da+Comarca+de+Igarassu/@-7.8626344,-34.9451504,13.31z/data=!4m10!1m2!2m1!1sdelegacia+da+mulher+em+igarassu!3m6!1s0x7ab6b1c4e570d89:0x8508c468b3e7fb0d!8m2!3d-7.826562!4d-34.9095895!15sCh9kZWxlZ2FjaWEgZGEgbXVsaGVyIGVtIGlnYXJhc3N1WiEiH2RlbGVnYWNpYSBkYSBtdWxoZXIgZW0gaWdhcmFzc3WSARl3b21lbnNfcHJvdGVjdGlvbl9zZXJ2aWNlmgEkQ2hkRFNVaE5NRzluUzBWSlEwRm5TVVIxY2w5aFgzZFJSUkFC4AEA!16s%2Fg%2F11b6xdnccl?entry=ttu'
);
    }
  }

  void addMarker(
      String markerName, double latitude, double longitude, String url) {
    final MarkerId markerId = MarkerId(markerName);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(latitude, longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      infoWindow: InfoWindow(
        title: markerName,
        snippet: 'Clique para obter mais informações',
      ),
      onTap: () {
        _launchURL(url);
      },
    );

    markers[markerId] = marker;
    _streamController.add(markers.values.toSet());
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _determinePosition();
    if (position != null) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position!.latitude, position!.longitude),
            zoom: 15,
          ),
        ),
      );
      markerCreate();
    }
  }
}
