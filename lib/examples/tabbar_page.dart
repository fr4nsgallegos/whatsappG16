import 'package:flutter/material.dart';

class TabbarPage extends StatelessWidget {
  const TabbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, //número de pestañas
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            // Conjunto de pestañas
            indicatorColor: Colors.blue, //Color de la barra que selecciona
            indicatorWeight: 4, //ancho de la barra
            labelColor: Colors.red, //color del label (tab)
            unselectedLabelColor:
                Colors.purple, //color de los label no seleccionados
            isScrollable:
                false, //si tienes muchas perstañas te ayuda a desplazar

            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.star), text: "Favoritos"),
              Tab(icon: Icon(Icons.person), text: "Perfil"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Casa")),
            Center(child: Text("Favoritos")),
            Center(child: Text("Mi perfil")),
          ],
        ),
      ),
    );
  }
}
