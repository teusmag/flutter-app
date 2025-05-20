import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'menu.dart';

class PlanosScreen extends StatefulWidget {
  const PlanosScreen({super.key});

  @override
  PlanosScreenState createState() => PlanosScreenState();
}

class PlanosScreenState extends State<PlanosScreen> {
  final String telefone = "47 99721-9442";
  final List<bool> isHoveredList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planos e Preços')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildPlanCard(
              'Plano MEI 💼',
              'R\$50/mês',
              [
                'Emissão da guia mensal.',
                'Negociações/parcelamentos.',
                'Emissão da guia de parcelamento mensal.',
                'Controle das despesas.',
                'Emissão da declaração anual.',
                'Assessoria na emissão de notas fiscais.',
              ],
              0
            ),
            _buildPlanCard(
              'Plano Micro Empresas 🏢',
              'R\$200/mês',
              [
                'Planejamento tributário.',
                'Emissão dos impostos mensais.',
                'Declarações assessorias mensais e anuais.',
                'Contabilidade completa.',
                'Prolabore ilimitado.',
                'Atendimento personalizado com especialistas.',
              ],
              1
            ),
            _buildPlanCard(
              'Plano Incorporadora/Construtora 🏗️',
              'R\$500/mês',
              [
                'Planejamento tributário.',
                'Emissão dos impostos mensais.',
                'Declarações assessorias mensais e anuais.',
                'Contabilidade completa com centro de custos por obra.',
                'Prolabore ilimitado.',
                'Planejamento e acompanhamento da obra com especialistas.',
              ],
              2
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomMenuBar(currentIndex: 3),
    );
  }

  Widget _buildPlanCard(String title, String price, List<String> features, int index) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(price, style: const TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features.map((feature) => Text('✔ $feature')).toList(),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('📞 Contato: 47 99721-9442', style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(child: Container()),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => isHoveredList[index] = true),
                  onExit: (_) => setState(() => isHoveredList[index] = false),
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: telefone));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Número copiado 📋!')),
                      );
                    },
                    child: Icon(Icons.copy, color: isHoveredList[index] ? Colors.blue : Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
