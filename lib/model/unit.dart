class Unit {
  Unit({
    required this.owner,
    required this.sets,
    required this.timeStamp,
    required this.id,
    required this.name,
  });

  final String owner;
  final int timeStamp;
  final List<String> sets;
  final String id;
  final String name;

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      owner: json['owner'],
      sets: json['sets'].cast<String>(),
      timeStamp: json['timestamp'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    json['owner'] = owner;
    json['sets'] = sets.toList();
    json['timeStamp'] = timeStamp;
    json['id'] = id;
    json['name'] = name;

    return json;
  }

  Unit copyWith({
    String? owner,
    List<String>? sets,
    int? timeStamp,
    String? id,
    String? name,
  }) =>
      Unit(
        name: name ?? this.name,
        owner: owner ?? this.owner,
        sets: sets ?? this.sets,
        timeStamp: timeStamp ?? this.timeStamp,
        id: id ?? this.id,
      );
}
