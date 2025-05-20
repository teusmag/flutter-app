import 'package:flutter/material.dart';
import 'menu.dart';

class ServicosScreen extends StatelessWidget {
  const ServicosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Serviços')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildServiceCard('Departamento Pessoal 👥', 'Gestão de folha, benefícios e consultoria trabalhista.'),
            _buildServiceCard('Departamento Fiscal 🏢', 'Análise de otimização tributária e emissão de impostos.'),
            _buildServiceCard('Abertura e Encerramento de Empresas 📜', 'Registro de CNPJ, regularização e fechamento de empresas.'),
            _buildServiceCard('Contabilidade Completa 📊', 'Balanços, balancetes e controle financeiro empresarial.'),
            _buildServiceCard('Gestão de Recursos Humanos 🤝', 'Gestão da folha de pagamento, benefícios e consultoria trabalhista.'),
            _buildServiceCard('Gestão Financeira 💰', 'Análises de balanços e balancetes para gestão de custos.'),
            _buildServiceCard('Gestão Comercial 📈', 'Otimização na venda de produtos e acompanhamento de receita.'),
            _buildServiceCard('Gestão da Produção 🏭', 'Controle de estoques, custos de produção e ajuste de demanda.'),
          ],
        ),
      ),
      bottomNavigationBar: const CustomMenuBar(currentIndex: 2),
    );
  }

  Widget _buildServiceCard(String title, String description) {
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
