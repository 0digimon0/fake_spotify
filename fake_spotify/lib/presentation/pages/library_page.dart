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
    getAllAudios();
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

  void getAllAudios() async {
    try {
      final results = await methodChannel.invokeMethod<String>('getAudios');
      if (results != null && results.isNotEmpty) {
        debugPrint('channel has data: $results');
      }
    } on PlatformException catch (e) {
      debugPrint("error: $e");
    }
  }
}
