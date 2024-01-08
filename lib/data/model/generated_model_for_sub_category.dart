class SubCategory {
  String? id;
  String? name;
  SubCategoryRest? subCategoryRest;
  String? image;
  bool? active;

  SubCategory({
    this.id,
    this.name,
    this.subCategoryRest,
    this.image,
    this.active,
  });

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subCategoryRest = json['subCategoryRest'] != null ? SubCategoryRest.fromJson(json['subCategoryRest']) : null;
    image = json['image'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (subCategoryRest != null) {
      data['subCategoryRest'] = subCategoryRest!.toJson();
    }
    data['image'] = image;
    data['active'] = active;
    return data;
  }
}

class SubCategoryRest {
  String? id;
  String? name;
  String? image;
  bool? active;

  SubCategoryRest({this.id, this.name, this.image, this.active});

  SubCategoryRest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['active'] = active;
    return data;
  }
}
