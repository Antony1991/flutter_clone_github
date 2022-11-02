// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WbForward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WbForward _$WbForwardFromJson(Map<String, dynamic> json) => WbForward(
      zfid: json['zfid'] as String,
      fromuid: json['fromuid'] as String,
      fromuname: json['fromuname'] as String,
      fromhead: json['fromhead'] as String,
      fromuserismember: json['fromuserismember'] as int,
      fromuserisvertify: json['fromuserisvertify'] as int,
      content: json['content'] as String,
      createtime: json['createtime'] as int,
    );

Map<String, dynamic> _$WbForwardToJson(WbForward instance) => <String, dynamic>{
      'zfid': instance.zfid,
      'fromuid': instance.fromuid,
      'fromuname': instance.fromuname,
      'fromhead': instance.fromhead,
      'fromuserismember': instance.fromuserismember,
      'fromuserisvertify': instance.fromuserisvertify,
      'content': instance.content,
      'createtime': instance.createtime,
    };
