// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

List<Model> modelFromJson(String str) =>
    List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
  Model({
    this.domains,
    this.alphaTwoCode,
    this.country,
    this.webPages,
    this.name,
    this.stateProvince,
  });

  List<String>? domains;
  String? alphaTwoCode;
  String? country;
  List<String>? webPages;
  String? name;
  String? stateProvince;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        domains: json["domains"] == null
            ? null
            : List<String>.from(json["domains"].map((x) => x)),
        alphaTwoCode:
            json["alpha_two_code"] == null ? null : json["alpha_two_code"],
        country: json["country"] == null ? null : json["country"],
        webPages: json["web_pages"] == null
            ? null
            : List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"] == null ? null : json["name"],
        stateProvince:
            json["state-province"] == null ? null : json["state-province"],
      );

  Map<String, dynamic> toJson() => {
        "domains":
            domains == null ? null : List<dynamic>.from(domains!.map((x) => x)),
        "alpha_two_code": alphaTwoCode == null ? null : alphaTwoCode,
        "country": country == null ? null : country,
        "web_pages": webPages == null
            ? null
            : List<dynamic>.from(webPages!.map((x) => x)),
        "name": name == null ? null : name,
        "state-province": stateProvince == null ? null : stateProvince,
      };
}
