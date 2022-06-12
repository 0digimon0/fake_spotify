// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongModel _$SongModelFromJson(Map<String, dynamic> json) => SongModel(
      aName: json['aName'] as String?,
      aAlbum: json['aAlbum'] as String?,
      aArtist: json['aArtist'] as String?,
      aPath: json['aPath'] as String?,
    );

Map<String, dynamic> _$SongModelToJson(SongModel instance) => <String, dynamic>{
      'aPath': instance.aPath,
      'aName': instance.aName,
      'aAlbum': instance.aAlbum,
      'aArtist': instance.aArtist,
    };
