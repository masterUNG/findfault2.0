import 'dart:convert';

class CurrentModel {
  final int current;
  final double lat;
  final double long;
  CurrentModel({
    required this.current,
    required this.lat,
    required this.long,
  });
  

  CurrentModel copyWith({
    int? current,
    double? lat,
    double? long,
  }) {
    return CurrentModel(
      current: current ?? this.current,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

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

  @override
  String toString() => 'CurrentModel(current: $current, lat: $lat, long: $long)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CurrentModel &&
      other.current == current &&
      other.lat == lat &&
      other.long == long;
  }

  @override
  int get hashCode => current.hashCode ^ lat.hashCode ^ long.hashCode;
}
