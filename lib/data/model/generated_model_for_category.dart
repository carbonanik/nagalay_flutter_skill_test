class Category {
  String? id;
  String? name;
  String? image;
  bool? active;
  CreatedBy? createdBy;
  UpdatedBy? updatedBy;
  int? createdAt;
  int? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.active,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    active = json['active'];
    createdBy = json['createdBy'] != null ? CreatedBy.fromJson(json['createdBy']) : null;
    updatedBy = json['updatedBy'] != null ? UpdatedBy.fromJson(json['updatedBy']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['active'] = active;
    data['createdBy'] = createdBy;
    if (updatedBy != null) {
      data['updatedBy'] = updatedBy!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
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

class CreatedBy {
  int? userId;
  String? fullName;
  String? primaryPhoneNumber;
  String? email;
  String? profilePicture;
  String? gender;
  String? profileImage;

  CreatedBy(
      {this.userId,
        this.fullName,
        this.primaryPhoneNumber,
        this.email,
        this.profilePicture,
        this.gender,
        this.profileImage});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    primaryPhoneNumber = json['primaryPhoneNumber'];
    email = json['email'];
    profilePicture = json['profilePicture'];
    gender = json['gender'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['fullName'] = fullName;
    data['primaryPhoneNumber'] = primaryPhoneNumber;
    data['email'] = email;
    data['profilePicture'] = profilePicture;
    data['gender'] = gender;
    data['profileImage'] = profileImage;
    return data;
  }
}

