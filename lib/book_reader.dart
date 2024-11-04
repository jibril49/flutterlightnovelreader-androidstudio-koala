import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class BookReader extends StatefulWidget {
  final String bookName;

  const BookReader({Key? key, required this.bookName}) : super(key: key);

  @override
  _BookReaderState createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
  late PDFDocument document; // Declare the PDF document
  bool isLoading = true; // State to track loading status
  bool hasError = false;  // State to track if an error occurred

  @override
  void initState() {
    super.initState();
    _loadPdf(); // Load the PDF document when the widget is initialized
  }

  Future<void> _loadPdf() async {
    try {
      // Load the PDF document from assets
      document = await PDFDocument.fromAsset('assets/${widget.bookName}.pdf');
      setState(() {
        isLoading = false; // Update loading state
        hasError = false;  // Reset error state if loading succeeds
      });
    } catch (e) {
      print("Error loading PDF: $e");
      setState(() {
        isLoading = false; // Update loading state
        hasError = true;   // Set error state if an exception is thrown
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.bookName)), // App bar with book name
      backgroundColor: Colors.black, // Set background color to black
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : hasError
          ? Center(
        child: Text(
          "PDF not found or failed to load.",
          style: TextStyle(color: Colors.white), // Error message in white
        ),
      )
          : PDFViewer(
        document: document, // Display the loaded PDF document
        indicatorBackground: Colors.redAccent, // Customize the indicator background color
        showIndicator: true, // Show indicator for PDF pages
        showPicker: false,   // Disable the page picker
      ),
    );
  }
}
