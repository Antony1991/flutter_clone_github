// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String?,
      json['nick'] as String?,
      json['headurl'] as String?,
      json['decs'] as String?,
      json['gender'] as String?,
      json['followCount'] as String?,
      json['fanCount'] as String?,
      json['ismember'] as int?,
      json['isvertify'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'nick': instance.nick,
      'headurl': instance.headurl,
      'decs': instance.decs,
      'gender': instance.gender,
      'followCount': instance.followCount,
      'fanCount': instance.fanCount,
      'ismember': instance.ismember,
      'isvertify': instance.isvertify,
    };
