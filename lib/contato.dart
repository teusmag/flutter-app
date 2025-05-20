import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'menu.dart';

class ContatoScreen extends StatefulWidget {
  const ContatoScreen({super.key});

  @override
  ContatoScreenState createState() => ContatoScreenState();
}

class ContatoScreenState extends State<ContatoScreen> {
  final String endereco = "Rua Tijucas, 370, Centro - Joinville/SC";
  final String telefone = "47 99721-9442";
  final String email = "contato.thgestaocontabil@gmail.com";
  
  final List<bool> isHoveredList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contato')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildContactCard(Icons.location_on, 'Endereço 📍', endereco, 0),
            _buildContactCard(Icons.phone, 'Telefone 📞', telefone, 1),
            _buildContactCard(Icons.email, 'E-mail ✉️', email, 2),
            _buildContactCard(Icons.access_time, 'Horário de Atendimento 📆', 'Segunda a Sexta: 9h às 12h | 13h às 18h'),
          ],
        ),
      ),
      bottomNavigationBar: const CustomMenuBar(currentIndex: 4),
    );
  }

  Widget _buildContactCard(IconData icon, String title, String content, [int? index]) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: Colors.blue),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(content),
                  ],
                ),
              ],
            ),
            if (index != null)
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => isHoveredList[index] = true),
                onExit: (_) => setState(() => isHoveredList[index] = false),
                child: GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: content));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$title copiado 📋!')),
                    );
                  },
                  child: Icon(Icons.copy, color: isHoveredList[index] ? Colors.blue : Colors.grey[700]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
