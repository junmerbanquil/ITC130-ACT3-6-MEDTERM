import 'dart:io';
import 'dart:async';

void main() {
  stdout.write('Please enter the file name: ');
  String? fileName = stdin.readLineSync();

  // If a file name is provided, attempt to read the file
  if (fileName != null && fileName.isNotEmpty) {
    readFile(fileName).catchError((e) {
      // Handle any errors that occur during file reading
      print('An error occurred: $e');
    });
  } else {
    print('No file name was entered. Please try again.');
  }
}

Future<void> readFile(String fileName) async {
  try {
    // Read the file as a string
    String fileContents = await File(fileName).readAsString();
    print('File contents:\n$fileContents');
  } on FileSystemException catch (e) {
    print('Could not read the file: ${e.message}');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}
