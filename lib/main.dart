import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    //informations globale de l'application
    return const MaterialApp(
      //titre app
      title: 'Flutter TikTok',
      //enlever debug label
      debugShowCheckedModeBanner: false,
      //page à afficher, ici notre objet BottomNavigationBarExample
      home: BottomNavigationBarExample(),
    );
  }
}
// barre de navigation objet
class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});


  @override
  State<BottomNavigationBarExample> createState() =>

      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  @override
  void initState() {
   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    //Scaffold = Fenetre entiere classique
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      extendBody: true,
    //body de l'objet
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: const Center(
          child: Text('Post'),
        ),
      ),
      //bottonNavigationBar Paramètres
      bottomNavigationBar: BottomNavigationBar(
        //déclaration des objet de la barre de navigation, liste d'objet avec un icon, label
        items:  <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/addIcon.png',height: 25,),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank_outlined),
            label: 'Comment',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        //parametre de la navigation barre
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        //on montre pas les labels
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        //on met ça pour mettre 5 icones
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF141518),
      ),
    );
  }
}
//barre de navigation fin
