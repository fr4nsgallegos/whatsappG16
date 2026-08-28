import 'package:flutter/material.dart';

class TabbarManualPage extends StatefulWidget {
  const TabbarManualPage({super.key});

  @override
  State<TabbarManualPage> createState() => _TabbarManualPageState();
}

class _TabbarManualPageState extends State<TabbarManualPage>
    with SingleTickerProviderStateMixin {
  late TabController
  _tabController; //prometo que esta variable tenrá un calor antes de que se intente usar

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      // Vsync ->  ayuda al rendimiento, flutter necesita sincronizar animaciones
      //analogíA-> es como el director de la orquesta que coordina todo
      vsync: this,
    );
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
        title: Text("TabBar Manual Page"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Uno"),
            Tab(text: "Dos"),
            Tab(text: "Tres"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("1")),
          Center(child: Text("2")),
          Center(child: Text("3")),
        ],
      ),
    );
  }
}
