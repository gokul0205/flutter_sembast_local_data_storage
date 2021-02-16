class JsonStringMap {
  final int id;
  final String uniqueIdentifier;
  final String jsonString;

  JsonStringMap({this.id, this.uniqueIdentifier, this.jsonString});

  Map<String, dynamic> toMap() {
    return {
      'uniqueIdentifier': this.uniqueIdentifier,
      'jsonString': this.jsonString
    };
  }

  factory JsonStringMap.fromMap(int id, Map<String, dynamic> map) {
    return JsonStringMap(
      id: id,
      uniqueIdentifier: map['uniqueIdentifier'],
      jsonString: map['jsonString'],
    );
  }

  JsonStringMap copyWith({int id, String uniqueIdentifier, String jsonString}){
    return JsonStringMap(
      id: id ?? this.id,
      uniqueIdentifier: uniqueIdentifier ?? this.uniqueIdentifier,
      jsonString: jsonString ?? this.jsonString,
    );
  }
}
