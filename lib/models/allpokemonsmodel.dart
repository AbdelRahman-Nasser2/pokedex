import 'dart:convert';

AllPokemonsModel AllPokemonsModelFromJson(String str) =>
    AllPokemonsModel.fromJson(json.decode(str));

String AllPokemonsModelToJson(AllPokemonsModel data) =>
    json.encode(data.toJson());

class AllPokemonsModel {
  int? count;
  String? next;
  dynamic previous;
  List<Results>? results;

  AllPokemonsModel({this.count, this.next, this.previous, this.results});

  AllPokemonsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  String? url;

  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
