import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'sobre.dart';
import 'servicos.dart';
import 'planos.dart';
import 'contato.dart';

class CustomMenuBar extends StatefulWidget {
  final int currentIndex;

  const CustomMenuBar({super.key, required this.currentIndex});

  @override
  CustomMenuBarState createState() => CustomMenuBarState();
}

class CustomMenuBarState extends State<CustomMenuBar> {
  void _onItemTapped(int index) {
    if (index != widget.currentIndex) {
      Widget screen;
      switch (index) {
        case 1:
          screen = const SobreScreen();
          break;
        case 2:
          screen = const ServicosScreen();
          break;
        case 3:
          screen = const PlanosScreen();
          break;
        case 4:
          screen = const ContatoScreen();
          break;
        default:
          screen = const HomeScreen();
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: widget.currentIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Sobre'),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Serviços'),
        BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Planos'),
        BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contato'),
      ],
    );
  }
}
