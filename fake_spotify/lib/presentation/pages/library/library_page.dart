import 'dart:convert';
import 'dart:io';

import 'package:fake_spotify/data/model/song_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LibraryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LibraryPageState();
}

const MethodChannel methodChannel = MethodChannel('com.spotify.channel');

class LibraryPageState extends State<LibraryPage> {
  List listSong = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    getAllAudios();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: FutureBuilder(
        future: getAllAudios(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("nothing here"),
            );
          } else {
            return ListView.builder(
                itemCount: (snapshot.data as List<SongModel>).length,
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child:
                                Image.asset("assets/image/ic_audio_media.png"),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                "${(snapshot.data as List<SongModel>)[index].aName}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${(snapshot.data as List<SongModel>)[index].aArtist}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }));
          }
        },
      ),
    );
  }

  Future<List<SongModel>> getAllAudios() async {
    if (Platform.isIOS) return List<SongModel>.empty();
    try {
      final results = await methodChannel.invokeMethod<String>('getAudios');
      if (results != null && results.isNotEmpty) {
        debugPrint('channel has data: $results');
        Iterable iterable = json.decode(results);
        List<SongModel> songs =
            List<SongModel>.from(iterable.map((e) => SongModel.fromJson(e)));
        return songs;
      }
    } on PlatformException catch (e) {
      debugPrint("error: $e");
    }
    return List<SongModel>.empty();
  }
}
