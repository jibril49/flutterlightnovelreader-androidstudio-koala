![Recording 2024-11-04 200120](https://github.com/user-attachments/assets/f0e0e849-3dd1-4f17-8866-1cf88c8b5a90)

![Screenshot 2024-11-04 194526](https://github.com/user-attachments/assets/87caa2f8-1b81-492d-ad98-a5eab5ac03c6)
![Screenshot 2024-11-04 194535](https://github.com/user-attachments/assets/3cc33a54-e15a-47ba-bbcb-dcd7baeb6fa8)
![Screenshot 2024-11-04 194541](https://github.com/user-attachments/assets/3262526c-d208-429d-b0fa-73456ddc916b)


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Light Novel App

A simple Flutter app for browsing and reading books, especially designed for light novels. This app features a searchable library with book ratings, pagination, and image previews.

## Features

- **Grid View with Pagination**: Browse books in a paginated grid layout, supporting multiple columns.
- **Search Functionality**: Filter books using a search bar.
- **Image Previews**: Display images associated with each book.
- **Book Ratings**: Star-based rating system for each book.
- **Clickable Books**: Open books by tapping on them, with the potential to load associated PDF files.
- **Horizontal Scroll**: Added horizontal scroll for easier navigation.
  
## Screens

- **Home Screen**: Shows a list of books in a grid format with search and pagination.
- **Library Screen**: Displays a gallery of book cover images.

## Getting Started

### Prerequisites

Ensure that you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)

### Installation

1. Clone the repository:

    ```bash
    https://github.com/jibril49/flutterlightnovelreader-androidstudio-koala.git
    cd lightnovelapp
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Add your book images to the `assets` folder (e.g., `Book1.jpg`, `Book2.jpg`, etc.) and ensure they are referenced in the `pubspec.yaml` file:

    ```yaml
    assets:
      - assets/Book1.jpg
      - assets/Book2.jpg
      - assets/Book3.jpg
      - assets/header_image.jpg
    ```

### Usage

1. Run the app:

    ```bash
    flutter run
    ```

2. On the **Home Screen**, browse books by scrolling and switching between pages. Use the search bar to filter specific books.
3. Tap on a book to open its content, such as a PDF viewer or a detail page.

### Customization

- **Adding Books**: To add new books, simply add them to the `_allBooks` list in `home_screen.dart` and ensure a corresponding image file exists in the `assets` folder.
- **Modifying Ratings**: Change the values in `_bookRatings` in `home_screen.dart` to set different ratings for each book.

## Folder Structure

```plaintext
lib/
├── main.dart           # Entry point of the application
├── home_screen.dart    # Displays the main book grid and search features
└── library_screen.dart # Displays the book covers in a gallery view
assets/
├── Book1.jpg           # Sample book cover
├── Book2.jpg
└── header_image.jpg    # Header image for the Home Screen


### Summary of the README
This README includes:
1. **Introduction** with a quick overview of the app's features.
2. **Getting Started** instructions for cloning, installing dependencies, and adding images.
3. **Usage** section that explains how to run the app.
4. **Customization** tips for adding more books or changing ratings.
5. **Folder Structure** for easy navigation and code understanding.
