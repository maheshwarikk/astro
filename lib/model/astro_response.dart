// To parse this JSON data, do
//
//     final astro = astroFromJson(jsonString);

import 'dart:convert';

Astro astroFromJson(String str) => Astro.fromJson(json.decode(str));

String astroToJson(Astro data) => json.encode(data.toJson());

class Astro {
  Astro({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  String? httpStatus;
  int? httpStatusCode;
  dynamic success;
  String? message;
  String? apiName;
  List<Datum>? data;

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.urlSlug,
    this.namePrefix,
    this.firstName,
    this.lastName,
    this.aboutMe,
    this.profliePicUrl,
    this.experience,
    this.languages,
    this.minimumCallDuration,
    this.minimumCallDurationCharges,
    this.additionalPerMinuteCharges,
    this.isAvailable,
    this.rating,
    this.skills,
    this.isOnCall,
    this.freeMinutes,
    this.additionalMinute,
    this.images,
    this.availability,
  });

  int? id;
  String? urlSlug;
  String? namePrefix;
  String? firstName;
  String? lastName;
  String? aboutMe;
  dynamic profliePicUrl;
  dynamic experience;
  List<Language>? languages;
  dynamic minimumCallDuration;
  dynamic minimumCallDurationCharges;
  dynamic additionalPerMinuteCharges;
  bool? isAvailable;
  double? rating;
  List<Skill>? skills;
  bool? isOnCall;
  int? freeMinutes;
  int? additionalMinute;
  Images? images;
  Availability? availability;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        urlSlug: json["urlSlug"],
        namePrefix: json["namePrefix"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        aboutMe: json["aboutMe"],
        profliePicUrl: json["profliePicUrl"],
        experience: json["experience"],
        languages: json["languages"] == null
            ? null
            : List<Language>.from(
                json["languages"].map((x) => Language.fromJson(x))),
        minimumCallDuration: json["minimumCallDuration"],
        minimumCallDurationCharges: json["minimumCallDurationCharges"],
        additionalPerMinuteCharges: json["additionalPerMinuteCharges"],
        isAvailable: json["isAvailable"],
        rating: json["rating"],
        skills: json["skills"] == null
            ? null
            : List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        isOnCall: json["isOnCall"],
        freeMinutes: json["freeMinutes"],
        additionalMinute: json["additionalMinute"],
        images: Images.fromJson(json["images"]),
        availability: json["availability"] == null
            ? null
            : Availability.fromJson(json["availability"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urlSlug": urlSlug,
        "namePrefix": namePrefix,
        "firstName": firstName,
        "lastName": lastName,
        "aboutMe": aboutMe,
        "profliePicUrl": profliePicUrl,
        "experience": experience,
        "languages": languages != null
            ? null
            : List<dynamic>.from(languages!.map((x) => x.toJson())),
        "minimumCallDuration": minimumCallDuration,
        "minimumCallDurationCharges": minimumCallDurationCharges,
        "additionalPerMinuteCharges": additionalPerMinuteCharges,
        "isAvailable": isAvailable,
        "rating": rating?.toDouble(),
        "skills": skills == null
            ? null
            : List<dynamic>.from(skills!.map((x) => x.toJson())),
        "isOnCall": isOnCall,
        "freeMinutes": freeMinutes,
        "additionalMinute": additionalMinute,
        "images": images?.toJson(),
        "availability": availability?.toJson(),
      };
}

class Availability {
  Availability({
    required this.days,
    required this.slot,
  });

  List<String> days;
  Slot slot;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        days: List<String>.from(json["days"].map((x) => x)),
        slot: Slot.fromJson(json["slot"]),
      );

  Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days.map((x) => x)),
        "slot": slot.toJson(),
      };
}

class Slot {
  Slot({
    required this.toFormat,
    required this.fromFormat,
    required this.from,
    required this.to,
  });

  String toFormat;
  String fromFormat;
  String from;
  String to;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        toFormat: json["toFormat"],
        fromFormat: json["toFormat"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "toFormat": toFormat,
        "fromFormat": fromFormat,
        "from": from,
        "to": to,
      };
}

class Images {
  Images({
    required this.small,
    required this.large,
    required this.medium,
  });

  Large small;
  Large large;
  Large medium;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: Large.fromJson(json["small"]),
        large: Large.fromJson(json["large"]),
        medium: Large.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "small": small.toJson(),
        "large": large.toJson(),
        "medium": medium.toJson(),
      };
}

class Large {
  Large({
    required this.imageUrl,
    required this.id,
  });

  String? imageUrl;
  int? id;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "id": id,
      };
}

class Language {
  Language({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Skill {
  Skill({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
