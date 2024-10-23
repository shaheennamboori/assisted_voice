import 'package:flutter/material.dart';

// class AddCategory extends StatelessWidget {
//   const AddCategory({super.key, required this.addCategory});
//   final ValueSetter<String> addCategory;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TextField(
//             onChanged: (value) {
//               addCategory(value);
//               print("my value $value");
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

class AddCategory extends StatefulWidget {
  const AddCategory({super.key, required this.addCategory});
  final ValueSetter<String> addCategory;

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Category"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when back button is pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: "Category"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String category = _controller.text;
                if (category.isNotEmpty) {
                  widget.addCategory(category); // Call addCategory only on Save
                  Navigator.pop(context); // Go back after saving
                } else {
                  print("Category cannot be empty");
                }
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
