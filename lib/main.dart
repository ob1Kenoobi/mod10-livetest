import 'package:flutter/material.dart';
import 'package:mod10_livetest/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(itemList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemList[index]),
            tileColor: isSelected[index] ? Colors.purpleAccent : null,
            onTap: () {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSelectedItemsDialog();
        },
        child: Icon(Icons.check),
      ),
    );
  }

  void _showSelectedItemsDialog() {
    int selectedCount = isSelected.where((element) => element).length;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selected Items'),
          content: Text('Number of selected items: $selectedCount'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Deselect all items
                setState(() {
                  isSelected = List.generate(itemList.length, (index) => false);
                });
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
