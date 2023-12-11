import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatelessWidget {
  Future<Position> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print("Error getting location: $e");
      return Position(latitude: 0.0, longitude: 0.0);
    }
  }

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<Map<String, dynamic>> getCurrentUserData() async {
  try {
    // Get the current user
    User? user = _auth.currentUser;

    if (user != null) {
      // Reference to the user document
      DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(user.uid).get();

      // Check if the document exists
      if (userSnapshot.exists) {
        // Access user data using userSnapshot.data()
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

        // Return the user data
        return userData;
      } else {
        print('User not found');
        return {}; // Return an empty map if the user is not found
      }
    } else {
      print('No user is currently signed in');
      return {}; // Return an empty map if no user is signed in
    }
  } catch (error) {
    print('Error retrieving user data: $error');
    return {}; // Return an empty map in case of an error
  }
}

Map<String, dynamic> userData = await getCurrentUserData();

if (userData.isNotEmpty) {
  String nome = userData['nome'] ?? ''; // Replace 'nome' with your field name
  String email = userData['email'] ?? ''; // Replace 'email' with your field name
  String cpf = userData['cpf'] ?? ''; // Replace 'cpf' with your field name
  String telefone = userData['telefone'] ?? ''; // Replace 'telefone' with your field name

  // Do something with the individual data fields
  print('Name: $nome');
  print('Email: $email');
  print('CPF: $cpf');
  print('Phone: $telefone');
} else {
  print('User data is empty');
}

void sendWhatsapp() async {
  Position currentLocation = await getCurrentLocation();

  final link = WhatsAppUnilink(
          phoneNumber: '+5581996801299',
          text: "Olá, esta mensagem é automatica, me chamo $nome, meu CPF é $cpf e estou em uma situação de perigo, por isso me comunico através do app Nyx e ppeço socorro na minha localização: ",
          location: WhatsAppLocation(
                latitude: currentLocation.latitude,
                longitude: currentLocation.longitude,
              ),
        );
  await launchUrl('$link' as Uri);
}
void main() => runApp(const GestureDetectorExampleApp());

class GestureDetectorExampleApp extends StatelessWidget {
  const GestureDetectorExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GestureDetectorExample(),
    );
  }
}

class GestureDetectorExample extends StatefulWidget {
  const GestureDetectorExample({super.key});

  @override
  State<GestureDetectorExample> createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onDoubleTap: () {
          Navigator.pushNamed(context, '/new');
        },
        onLongPress: () {
          sendWhatsapp();
        },
        child: FloatingActionButton(
          onPressed: () {},
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
        height: 50,
        child: Container(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white),
                iconSize: 30.0,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                iconSize: 30.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/map');
                },
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
