import 'package:json_annotation/json_annotation.dart';
part 'song_item_model.g.dart';

@JsonSerializable()
class SongModel {
  String? aPath;
  String? aName;
  String? aAlbum;
  String? aArtist;

  SongModel({this.aName, this.aAlbum, this.aArtist, this.aPath});

  factory SongModel.fromJson(Map<String, dynamic> data) =>
      _$SongModelFromJson(data);

  Map<String, dynamic> toJson() => _$SongModelToJson(this);
}
