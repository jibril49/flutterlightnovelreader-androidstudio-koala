import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  final Function(String) onBookSelected;

  LibraryScreen({required this.onBookSelected});

  final List<String> _books = [
    'Book1',
    'Book2',
    'Book3',
    // Add more book names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 0.7, // Aspect ratio for each item
        ),
        itemCount: _books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onBookSelected(_books[index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/${_books[index]}.jpg', // Load image based on book name
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
