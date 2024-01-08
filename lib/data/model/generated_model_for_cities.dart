class AllCities {
  List<City>? cities;
  String? message;
  int? statusCode;
  bool? status;
  double? timestamp;

  AllCities(
      {this.cities, this.message, this.statusCode, this.status, this.timestamp});

  AllCities.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      cities = <City>[];
      json['data'].forEach((v) {
        cities!.add(City.fromJson(v));
      });
    }
    message = json['message'];
    statusCode = json['statusCode'];
    status = json['status'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cities != null) {
      data['data'] = cities!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['timestamp'] = timestamp;
    return data;
  }
}

class City {
  String? id;
  String? districtName;
  Division? division;

  City({this.id, this.districtName, this.division});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtName = json['districtName'];
    division = json['division'] != null
        ? Division.fromJson(json['division'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['districtName'] = districtName;
    if (division != null) {
      data['division'] = division!.toJson();
    }
    return data;
  }
}

class Division {
  String? id;
  String? divisionName;

  Division({this.id, this.divisionName});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionName = json['divisionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['divisionName'] = divisionName;
    return data;
  }
}
