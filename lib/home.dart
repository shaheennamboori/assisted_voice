import 'package:assisted_voice/add_category.dart';
import 'package:assisted_voice/second_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Models/category.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Box<Category> categories;
  List<String> entries = <String>[];

  @override
  void initState() {
    super.initState();
    categories = Hive.box<Category>('categories'); // Access the opened box
  }

  // Add an entry to the box
  void _addEntry(Category category) {
    categories.add(category); // Add entry to the box
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assisted Voice'),
      ),

      // body: ListView.builder(
      //     padding: const EdgeInsets.all(8),
      //     itemCount: entries.length,
      //     itemBuilder: _itemBuilder),

      body: ValueListenableBuilder(
        valueListenable: categories.listenable(), // Listens for changes in the box
        builder: (context, Box<Category> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text("No entries yet"));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final entry = box.getAt(index); // Retrieve entry at index
              return ListTile(
                title: Text(entry?.name ?? 'No entry'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    box.deleteAt(index); // Delete entry at index
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondRoute(
                        name: entry?.name ?? 'No entry',
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddCategory(addCategory: (myValue) {
                        _addEntry(Category('1', myValue));
                        // setState(() {
                        //   entries.add(myValue);
                        //   print("my value list $myValue");
                        // });
                      })));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
