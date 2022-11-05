// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.items,

  });

  List<Item> items;


  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),

  };
}

class Item {
  Item({
    required this.id,
    required this.title,
    required this.fullTitle,
    required this.year,
    required this.releaseState,
    required this.image,
    this.runtimeMins,
    this.runtimeStr,
    this.plot,
    this.contentRating,
    this.imDbRating,
    this.imDbRatingCount,
    this.metacriticRating,
    required this.genres,
    required this.genreList,
    this.directors,
    required this.directorList,
    required this.stars,
    required this.starList,
  });

  String id;
  String title;
  String fullTitle;
  String year;
  String releaseState;
  String image;
  dynamic runtimeMins;
  dynamic runtimeStr;
  dynamic plot;
  dynamic contentRating;
  dynamic imDbRating;
  dynamic imDbRatingCount;
  dynamic metacriticRating;
  String genres;
  List<GenreList> genreList;
  dynamic directors;
  List<dynamic> directorList;
  String stars;
  List<StarList> starList;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    title: json["title"],
    fullTitle: json["fullTitle"],
    year: json["year"],
    releaseState: json["releaseState"],
    image: json["image"],
    runtimeMins: json["runtimeMins"],
    runtimeStr: json["runtimeStr"],
    plot: json["plot"],
    contentRating: json["contentRating"],
    imDbRating: json["imDbRating"],
    imDbRatingCount: json["imDbRatingCount"],
    metacriticRating: json["metacriticRating"],
    genres: json["genres"],
    genreList: List<GenreList>.from(json["genreList"].map((x) => GenreList.fromJson(x))),
    directors: json["directors"],
    directorList: List<dynamic>.from(json["directorList"].map((x) => x)),
    stars: json["stars"],
    starList: List<StarList>.from(json["starList"].map((x) => StarList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "fullTitle": fullTitle,
    "year": year,
    "releaseState": releaseState,
    "image": image,
    "runtimeMins": runtimeMins,
    "runtimeStr": runtimeStr,
    "plot": plot,
    "contentRating": contentRating,
    "imDbRating": imDbRating,
    "imDbRatingCount": imDbRatingCount,
    "metacriticRating": metacriticRating,
    "genres": genres,
    "genreList": List<dynamic>.from(genreList.map((x) => x.toJson())),
    "directors": directors,
    "directorList": List<dynamic>.from(directorList.map((x) => x)),
    "stars": stars,
    "starList": List<dynamic>.from(starList.map((x) => x.toJson())),
  };
}

class GenreList {
  GenreList({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}

class StarList {
  StarList({
    this.id,
    required this.name,
  });

  dynamic id;
  String name;

  factory StarList.fromJson(Map<String, dynamic> json) => StarList(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
