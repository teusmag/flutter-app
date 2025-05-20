import 'package:flutter/material.dart';
import 'menu.dart';

class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre a Empresa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildInfoCard('📌 Missão', 'Facilitar e fazer com que o empreendedor se preocupe com as estratégias do seu negócio e não com a parte burocrática.'),
            _buildInfoCard('🎯 Visão', 'Ser a melhor empresa para se trabalhar e a melhor empresa do ramo contábil da região.'),
            _buildInfoCard('💡 Valores', 'Transparência, dedicação, agilidade, respeito ao cliente e aos seus valores.'),
            _buildInfoCard('🏢 Ramo de Atividade', 'Contabilidade do terceiro setor, contabilidade para construção civil, comércio e serviços.'),
            _buildInfoCard('👥 Clientes Atendidos', '100 clientes próprios + 100 clientes no processo de terceirização fiscal.'),
            _buildInfoCard('🧑‍💼 Colaboradores', 'Equipe com 5 especialistas.'),
            _buildInfoCard(
                '📖 História',
                'Fundada em 2020 pela Julia, a TH Gestão Contábil especializou-se em serviços para o terceiro setor e construção civil, '
                'áreas com normas específicas e poucas contabilidades especializadas. Expandiu a carteira de clientes e, em 2022, '
                'iniciou a terceirização fiscal, aumentando sua atuação para 200 empresas atendidas mensalmente.'),
          ],
        ),
      ),
      bottomNavigationBar: const CustomMenuBar(currentIndex: 1),
    );
  }

  Widget _buildInfoCard(String title, String description) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}
