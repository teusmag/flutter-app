import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String logoUrl = "https://i.imgur.com/TzUn1sa.png";
  final String bannerUrl = "https://i.imgur.com/e34I98M.png";
  final String whatsappNumber = "5547997219442";

  void _openWhatsApp() async {
    final String message = Uri.encodeComponent(
        "Olá! Estou entrando em contato pelo app TH Gestão Contábil. Poderia me passar mais informações?");
    final String url = "https://wa.me/$whatsappNumber?text=$message";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      debugPrint("⚠ Erro ao abrir o WhatsApp!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(logoUrl, height: 40, width: 40),
            const SizedBox(width: 10),
            const Text(
              'TH Gestão Contábil',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
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
                  children: [
                    const Text(
                      '"📊 Contabilidade é a ciência que lhe ensina a usar os números ao seu favor."',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: _openWhatsApp,
                      icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
                      label: const Text("Fale conosco no WhatsApp"),
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
    return Image.network(bannerUrl, width: double.infinity, fit: BoxFit.contain);
  }
}
