import 'package:flutter/material.dart';
import 'menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String logoUrl = "https://i.imgur.com/TzUn1sa.png";
  final String bannerUrl = "https://i.imgur.com/e34I98M.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              logoUrl,
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            const Text('TH Gestão Contábil', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildBanner(),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '"📊 Contabilidade é a ciência que lhe ensina a usar os números ao seu favor."',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomMenuBar(currentIndex: 0),
    );
  }

  Widget _buildBanner() {
    return Image.network(
      bannerUrl,
      width: double.infinity,
      fit: BoxFit.contain,
    );
  }
}
