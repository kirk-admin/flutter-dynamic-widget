import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widget/screen/NewWidget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> _contatos = List.generate(_count, (int i) => NewWidget());
    return Scaffold(
      appBar: AppBar(title: const Text("Dynamic Widget")),
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Data de nascimento',
                  ),
                ),
                Container(
                  padding: new EdgeInsets.all(20.0),
                ),
                Container(
                  height: 200.0,
                  child: ListView(
                    children: _contatos,
                    scrollDirection: Axis.vertical,
                  ),
                ),
                TextButton(
                  onPressed: _addNewContactRow,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void _addNewContactRow() {
    setState(() {
      _count = _count + 1;
    });
  }
}
