class Selection {
  String? city;
  String? area;
  String? category;
  String? categoryId;
  String? subCategory;

  Selection({
    this.city,
    this.area,
    this.category,
    this.categoryId,
    this.subCategory,
  });

  Selection copyWith({
    String? city,
    String? area,
    String? category,
    String? categoryId,
    String? subCategory,
  }) {
    return Selection(
      city: city ?? this.city,
      area: area ?? this.area,
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      subCategory: subCategory ?? this.subCategory,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Selection &&
        other.city == city &&
        other.area == area &&
        other.category == category &&
        other.subCategory == subCategory &&
        other.subCategory == subCategory;
  }

  @override
  int get hashCode => city.hashCode ^ area.hashCode ^ category.hashCode ^ categoryId.hashCode ^ subCategory.hashCode;
}
