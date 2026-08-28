import 'package:flutter/material.dart';

class TabbarDinamicoPage extends StatefulWidget {
  const TabbarDinamicoPage({super.key});

  @override
  State<TabbarDinamicoPage> createState() => _TabbarDinamicoPageState();
}

class _TabbarDinamicoPageState extends State<TabbarDinamicoPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> titulos = ["Noticias", "Mensajes", "Ajustes", "Perfil"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: titulos.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Bar Dinámico"),
        bottom: TabBar(
          controller: _tabController,
          tabs: titulos.map((e) {
            return Center(child: Text(e));
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: titulos
            .map((e) => Center(child: Text("Vista de $e")))
            .toList(),
      ),
    );
  }
}
