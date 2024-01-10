class AmenityGroup {
  String? id;
  String? title;
  List<Amenities>? amenities;
  CreatedBy? createdBy;
  UpdatedBy? updatedBy;
  int? createdAt;
  int? updatedAt;

  AmenityGroup({this.id, this.title, this.amenities, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt});

  AmenityGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['amenities'] != null) {
      amenities = <Amenities>[];
      json['amenities'].forEach((v) {
        amenities!.add(Amenities.fromJson(v));
      });
    }
    createdBy = json['createdBy'] != null ? CreatedBy.fromJson(json['createdBy']) : null;
    updatedBy = json['updatedBy'] != null ? UpdatedBy.fromJson(json['updatedBy']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (amenities != null) {
      data['amenities'] = amenities!.map((v) => v.toJson()).toList();
    }
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    if (updatedBy != null) {
      data['updatedBy'] = updatedBy!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Amenities {
  String? name;
  String? icon;
  bool? active;

  Amenities({this.name, this.icon, this.active});

  Amenities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['active'] = active;
    return data;
  }
}

class CreatedBy {
  int? userId;
  String? fullName;
  String? primaryPhoneNumber;
  String? email;
  String? profileImage;

  CreatedBy({this.userId, this.fullName, this.primaryPhoneNumber, this.email, this.profileImage});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    primaryPhoneNumber = json['primaryPhoneNumber'];
    email = json['email'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['fullName'] = fullName;
    data['primaryPhoneNumber'] = primaryPhoneNumber;
    data['email'] = email;
    data['profileImage'] = profileImage;
    return data;
  }
}

class UpdatedBy {
  int? userId;
  String? fullName;
  String? primaryPhoneNumber;
  String? email;
  String? profileImage;

  UpdatedBy({this.userId, this.fullName, this.primaryPhoneNumber, this.email, this.profileImage});

  UpdatedBy.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    primaryPhoneNumber = json['primaryPhoneNumber'];
    email = json['email'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['fullName'] = fullName;
    data['primaryPhoneNumber'] = primaryPhoneNumber;
    data['email'] = email;
    data['profileImage'] = profileImage;
    return data;
  }
}
