import 'package:game_info/repository/models/genre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  const Store({
    this.id,
    this.store,
  });

  final int? id;
  final Genre? store;

  factory Store.fromJson(Map<String, dynamic> json) =>
  _$StoreFromJson(json);

  Map<String, dynamic> toJson() =>_$StoreToJson(this);
}