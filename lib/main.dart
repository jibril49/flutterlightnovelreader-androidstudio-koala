import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the HomeScreen widget
import 'library_screen.dart'; // Import the LibraryScreen widget
import 'book_reader.dart'; // Import the BookReader widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // Variable to track the currently selected index
  String? _selectedBook; // Variable to store the currently selected book

  // Function to handle bottom navigation item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
      _selectedBook = null; // Reset the selected book when changing tabs
    });
  }

  // Function to open a book and switch to the reader
  void _openBook(String bookName) {
    setState(() {
      _selectedBook = bookName; // Set the selected book
      _selectedIndex = 2; // Switch to the book reader
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of screens corresponding to each tab
    final List<Widget> _screens = [
      HomeScreen(onBookSelected: _openBook), // Pass the _openBook function to HomeScreen
      LibraryScreen(onBookSelected: _openBook), // Pass the _openBook function to LibraryScreen
      _selectedBook != null
          ? BookReader(bookName: _selectedBook!) // Show BookReader if a book is selected
          : Center(child: Text('No Book Selected', style: TextStyle(color: Colors.white))), // Show message if no book is selected
    ];

    return MaterialApp(
      title: 'Light Novel App',
      theme: ThemeData.dark(), // Use dark theme for the app
      home: Scaffold(
        appBar: AppBar(
          title: Text('Light Novel App'),
          backgroundColor: Colors.black, // Set app bar color
        ),
        body: Container(
          color: Colors.black, // Set the body color
          child: _screens[_selectedIndex], // Display the selected screen
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black, // Set the bottom navigation bar color
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books, color: Colors.white),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Colors.white),
              label: 'Reader',
            ),
          ],
          currentIndex: _selectedIndex, // Set the currently selected index
          selectedItemColor: Colors.blueAccent, // Color for the selected item
          unselectedItemColor: Colors.white54, // Color for unselected items
          onTap: _onItemTapped, // Handle taps on the bottom navigation bar
        ),
      ),
    );
  }
}
