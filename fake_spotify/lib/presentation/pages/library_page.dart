import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LibraryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LibraryPageState();
}

const MethodChannel methodChannel = MethodChannel('com.spotify.channel');

class LibraryPageState extends State<LibraryPage> {
  @override
  void initState() {
    super.initState();
    getAllPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          "Library",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _getDocuments() async {
    List<dynamic> documentList = [""];
    try {
      documentList = await methodChannel.invokeMethod("songs");
    } on PlatformException catch (e) {
      print("exceptiong $e");
    }
    documentList.forEach((song) {
      print("Document: $song"); // seach in Logcat "Document"
    });
  }

  void getAllPhotos() async {
    // 1
    // gridHeight = getKeyboardHeight();
    // 2
    final results = await methodChannel.invokeMethod<List>('getPhotos', 1000);
    if (results != null && results.isNotEmpty) {
      debugPrint('channel has data');
      setState(() {
        // images = results.cast<String>();
        // 3
        // showGrid = images.isNotEmpty;
        // 4
        // focus.unfocus();
      });
    }
  }
}
