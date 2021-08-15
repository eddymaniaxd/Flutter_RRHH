import 'package:flutter/material.dart';
import 'package:rrhh/services/boletas_service.dart';

import 'package:rrhh/Drawer/widget_drawer.dart';
import 'package:rrhh/models/boletas.dart';

class BoletaVista extends StatefulWidget {
  @override
  _BoletaVistaState createState() => _BoletaVistaState();
}

class _BoletaVistaState extends State<BoletaVista> {
  @override
  void didUpdateWidget(BoletaVista oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Mi Boleta'),
      ),
      drawer: MenuLateral(),
      body: FutureBuilder<List<Boleta>>(
        future: BoletasService().getBoletas(),
        builder: (BuildContext context, AsyncSnapshot<List<Boleta>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Boleta item = snapshot.data![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (DismissDirection direction) {
                    // ClientDatabaseProvider.db.deleteClientWithId(item.id);
                  },
                  child: ListTile(
                    title: Text(item.nombres),
                    subtitle: Text(item.liquidoPagable),
                    leading: CircleAvatar(
                      child: Text(item.cargo),
                    ),
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => AddEditClientPage(
                      //       true,
                      //       client: item,
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
////patrikiiii