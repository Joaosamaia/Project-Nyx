import 'dart:async';
import 'package:flutter/material.dart';
import '../Screens/home_page.dart';
import '../Screens/locator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Screens/landing_page.dart';
import '../Screens/news.dart';
import '../Screens/splash_page.dart';
//import '../Screens/login_page.dart';
//import '../Screens/register_page.dart';
import '../Screens/Tutorial/tutorial_1.dart';
import '../Screens/Tutorial/tutorial_2.dart';
import '../Screens/Tutorial/tutorial_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // home: news(),

      navigatorObservers: const [],
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        // '/login': (context) => const LoginPage(),
        // '/register': (context) => const RegisterPage(),
        '/main': (context) => const MainPage(),
        '/tutorial1': (context) => const Tutorial1(),
        '/tutorial2': (context) => const Tutorial2(),
        '/tutorial3': (context) => const Tutorial3(),
        '/home': (context) => Home(),
        '/map': (context) => const MapSample(),
        '/new': (context) => News_page(),
      },
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  final Locator locator = Locator();

  static const CameraPosition _UzhNU = CameraPosition(
    target: LatLng(48.6075588, 22.2641117),
    zoom: 15,
  );

  MapType _currentMapType = MapType.normal;

  void _onMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nyx Delivery',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Caladea',
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(170, 52, 225, 0.965),
      ),
      body: Stack(
        children: [
          StreamBuilder<Set<Marker>>(
              stream: locator.markerStream,
              builder: (context, snapshot) {
                return GoogleMap(
                  mapType: _currentMapType,
                  initialCameraPosition: _UzhNU,
                  onMapCreated: locator.onMapCreated,
                  markers: snapshot.data ?? {},
                  padding: const EdgeInsets.only(bottom: 60.0),
                );
              }),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: _onMapType,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: const Color.fromRGBO(170, 52, 225, 0.965),
                child: const Icon(Icons.map, size: 36),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: ClipOval(
          child: Image.asset(
            "assets/images/logoR.png",
            width: 1500.0,
            height: 1500.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        clipBehavior: Clip.antiAlias,
        color: Colors.black,
        elevation: 0, // Adicione esta linha para remover a sombra

        height: 50,
        child: Container(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.grey),
                iconSize: 30.0,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/home1',
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                iconSize: 35.0,
                onPressed: () {},
              ),
              const SizedBox(width: 24.0),
              IconButton(
                icon: const Icon(
                  Icons.library_books,
                  color: Colors.grey,
                ),
                iconSize: 30.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/new');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
