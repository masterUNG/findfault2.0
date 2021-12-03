import 'dart:convert';

class CurrentModel {
  final double current;
  final double lat;
  final double long;
  CurrentModel({
    required this.current,
    required this.lat,
    required this.long,
  });

  Map<String, dynamic> toMap() {
    return {
      'current': current,
      'lat': lat,
      'long': long,
    };
  }

  factory CurrentModel.fromMap(Map<String, dynamic> map) {
    return CurrentModel(
      current: map['current'],
      lat: map['lat'],
      long: map['long'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentModel.fromJson(String source) => CurrentModel.fromMap(json.decode(source));
}
