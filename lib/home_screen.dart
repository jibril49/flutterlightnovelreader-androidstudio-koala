import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Function(String) onBookSelected;

  HomeScreen({required this.onBookSelected});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allBooks = [
    'Book1',
    'Book2',
    'Book3',
  ];

  // Book ratings
  final List<double> _bookRatings = [4.0, 3.5, 5.0];

  List<String> _filteredBooks = [];
  int _currentPage = 0;
  final int _booksPerPage = 4; // Set this to display 4 books per page

  @override
  void initState() {
    super.initState();
    _filteredBooks = _allBooks; // Initially display all books
    _searchController.addListener(_filterBooks);
  }

  void _filterBooks() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredBooks = _allBooks
          .where((book) => book.toLowerCase().contains(query))
          .toList();
      _currentPage = 0; // Reset to first page after filtering
    });
  }

  void _goToNextPage() {
    setState(() {
      if (_currentPage < (_filteredBooks.length / _booksPerPage).ceil() - 1) {
        _currentPage++;
      }
    });
  }

  void _goToPreviousPage() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      Icon starIcon = Icon(
        Icons.star,
        color: i < rating ? Colors.yellow : Colors.grey,
      );
      stars.add(starIcon);
    }
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the start and end index for the current page
    int startIndex = _currentPage * _booksPerPage;
    int endIndex = startIndex + _booksPerPage;
    List<String> currentBooks = _filteredBooks.sublist(
      startIndex,
      endIndex < _filteredBooks.length ? endIndex : _filteredBooks.length,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Books'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Add the image at the top
          Container(
            width: double.infinity,
            height: 200, // Adjust height as needed
            child: Image.asset(
              'assets/header_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16.0), // Space between the image and the search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search books...',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0), // Space between the search bar and the book grid
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Set to 4 columns
                childAspectRatio: 0.6, // Adjust for height and width ratio
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: currentBooks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => widget.onBookSelected(currentBooks[index]), // Call onBookSelected on tap
                  child: Card(
                    color: Colors.grey[800],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/${currentBooks[index]}.jpg', // Ensure these images exist
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8.0), // Space between image and title
                        Text(
                          currentBooks[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        _buildRatingStars(_bookRatings[_allBooks.indexOf(currentBooks[index])]),
                        SizedBox(height: 4.0), // Space between title and rating
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Pagination buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _goToPreviousPage,
                child: Text('Previous'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
              SizedBox(width: 16.0), // Space between buttons
              ElevatedButton(
                onPressed: _goToNextPage,
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0), // Space before buttons
        ],
      ),
    );
  }
}
