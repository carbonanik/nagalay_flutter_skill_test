class AllAdvertisements {
  List<Advertisement>? content;
  Pageable? pageable;
  int? totalPages;
  int? totalElements;
  bool? last;
  int? size;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  bool? empty;

  AllAdvertisements(
      {this.content,
        this.pageable,
        this.totalPages,
        this.totalElements,
        this.last,
        this.size,
        this.number,
        this.sort,
        this.numberOfElements,
        this.first,
        this.empty});

  AllAdvertisements.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Advertisement>[];
      json['content'].forEach((v) {
        content!.add(Advertisement.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? Pageable.fromJson(json['pageable'])
        : null;
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['totalPages'] = totalPages;
    data['totalElements'] = totalElements;
    data['last'] = last;
    data['size'] = size;
    data['number'] = number;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['numberOfElements'] = numberOfElements;
    data['first'] = first;
    data['empty'] = empty;
    return data;
  }
}

class Pageable {
  Sort? sort;
  int? offset;
  int? pageNumber;
  int? pageSize;
  bool? unpaged;
  bool? paged;

  Pageable(
      {this.sort,
        this.offset,
        this.pageNumber,
        this.pageSize,
        this.unpaged,
        this.paged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    unpaged = json['unpaged'];
    paged = json['paged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['offset'] = offset;
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['unpaged'] = unpaged;
    data['paged'] = paged;
    return data;
  }
}

class Sort {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empty'] = empty;
    data['sorted'] = sorted;
    data['unsorted'] = unsorted;
    return data;
  }
}


class Advertisement {
  String? id;
  String? title;
  String? slug;
  String? primaryCategory;
  SubCategory? subCategory;
  NicheCategory? nicheCategory;
  Address? address;
  String? lastSavedStep;
  String? advertisementStatus;
  String? description;
  String? providerType;
  String? serviceProviderType;
  bool? isWorkInWeekends;
  int? studentCapacity;
  int? classPerWeek;
  int? hoursPerWeek;
  List<ShiftingTimes>? shiftingTimes;
  List<AmenityGroups>? amenityGroups;
  List<String>? weekDays;
  List<String>? offDays;
  String? propertyRulesAndPolicy;
  Price? price;
  Price? overallSpecialPrice;
  MinBooking? minBooking;
  List<Discounts>? discounts;
  List<String>? specialPrices;
  List<AdditionalFees>? additionalFees;
  List<String>? cancellationPenalties;
  List<String>? photos;
  List<GalleryUploads>? galleryUploads;
  double? avgRating;
  int? totalReview;
  double? revenue;
  bool? verified;
  bool? disabled;
  bool? paid;
  bool? publishable;
  String? phone;
  String? email;
  String? contactInfo;
  List<AdvStatusHistory>? advStatusHistory;
  CreatedBy? createdBy;
  UpdatedBy? updatedBy;
  int? createdAt;
  int? updatedAt;

  Advertisement(
      {this.id,
      this.title,
      this.slug,
      this.primaryCategory,
      this.subCategory,
      this.nicheCategory,
      this.address,
      this.lastSavedStep,
      this.advertisementStatus,
      this.description,
      this.providerType,
      this.serviceProviderType,
      this.isWorkInWeekends,
      this.studentCapacity,
      this.classPerWeek,
      this.hoursPerWeek,
      this.shiftingTimes,
      this.amenityGroups,
      this.weekDays,
      this.offDays,
      this.propertyRulesAndPolicy,
      this.price,
      this.overallSpecialPrice,
      this.minBooking,
      this.discounts,
      this.specialPrices,
      this.additionalFees,
      this.cancellationPenalties,
      this.photos,
      this.galleryUploads,
      this.avgRating,
      this.totalReview,
      this.revenue,
      this.verified,
      this.disabled,
      this.paid,
      this.publishable,
      this.phone,
      this.email,
      this.contactInfo,
      this.advStatusHistory,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  Advertisement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    primaryCategory = json['primaryCategory'];
    subCategory = json['subCategory'] != null ? SubCategory.fromJson(json['subCategory']) : null;
    nicheCategory = json['nicheCategory'] != null ? NicheCategory.fromJson(json['nicheCategory']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    lastSavedStep = json['lastSavedStep'];
    advertisementStatus = json['advertisementStatus'];
    description = json['description'];
    providerType = json['providerType'];
    serviceProviderType = json['serviceProviderType'];
    isWorkInWeekends = json['isWorkInWeekends'];
    studentCapacity = json['studentCapacity'];
    classPerWeek = json['classPerWeek'];
    hoursPerWeek = json['hoursPerWeek'];
    if (json['shiftingTimes'] != null) {
      shiftingTimes = <ShiftingTimes>[];
      json['shiftingTimes'].forEach((v) {
        shiftingTimes!.add(ShiftingTimes.fromJson(v));
      });
    }
    if (json['amenityGroups'] != null) {
      amenityGroups = <AmenityGroups>[];
      json['amenityGroups'].forEach((v) {
        amenityGroups!.add(AmenityGroups.fromJson(v));
      });
    }
    weekDays = json['weekDays'].cast<String>();
    offDays = json['offDays'].cast<String>();
    propertyRulesAndPolicy = json['propertyRulesAndPolicy'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    overallSpecialPrice = json['overallSpecialPrice'] != null ? Price.fromJson(json['overallSpecialPrice']) : null;
    minBooking = json['minBooking'] != null ? MinBooking.fromJson(json['minBooking']) : null;
    if (json['discounts'] != null) {
      discounts = <Discounts>[];
      json['discounts'].forEach((v) {
        discounts!.add(Discounts.fromJson(v));
      });
    }
    if (json['specialPrices'] != null) {
      specialPrices = <String>[];
      json['specialPrices'].forEach((v) {
        specialPrices!.add(v);
      });
    }
    if (json['additionalFees'] != null) {
      additionalFees = <AdditionalFees>[];
      json['additionalFees'].forEach((v) {
        additionalFees!.add(AdditionalFees.fromJson(v));
      });
    }
    if (json['cancellationPenalties'] != null) {
      cancellationPenalties = <String>[];
      json['cancellationPenalties'].forEach((v) {
        cancellationPenalties!.add(v);
      });
    }
    if (json['photos'] != null) {
      photos = <String>[];
      json['photos'].forEach((v) {
        photos!.add(v);
      });
    }
    if (json['galleryUploads'] != null) {
      galleryUploads = <GalleryUploads>[];
      json['galleryUploads'].forEach((v) {
        galleryUploads!.add(GalleryUploads.fromJson(v));
      });
    }
    avgRating = json['avgRating'];
    totalReview = json['totalReview'];
    revenue = json['revenue'];
    verified = json['verified'];
    disabled = json['disabled'];
    paid = json['paid'];
    publishable = json['publishable'];
    phone = json['phone'];
    email = json['email'];
    contactInfo = json['contactInfo'];
    if (json['advStatusHistory'] != null) {
      advStatusHistory = <AdvStatusHistory>[];
      json['advStatusHistory'].forEach((v) {
        advStatusHistory!.add(AdvStatusHistory.fromJson(v));
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
    data['slug'] = slug;
    data['primaryCategory'] = primaryCategory;
    if (subCategory != null) {
      data['subCategory'] = subCategory!.toJson();
    }
    if (nicheCategory != null) {
      data['nicheCategory'] = nicheCategory!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['lastSavedStep'] = lastSavedStep;
    data['advertisementStatus'] = advertisementStatus;
    data['description'] = description;
    data['providerType'] = providerType;
    data['serviceProviderType'] = serviceProviderType;
    data['isWorkInWeekends'] = isWorkInWeekends;
    data['studentCapacity'] = studentCapacity;
    data['classPerWeek'] = classPerWeek;
    data['hoursPerWeek'] = hoursPerWeek;
    if (shiftingTimes != null) {
      data['shiftingTimes'] = shiftingTimes!.map((v) => v.toJson()).toList();
    }
    if (amenityGroups != null) {
      data['amenityGroups'] = amenityGroups!.map((v) => v.toJson()).toList();
    }
    data['weekDays'] = weekDays;
    data['offDays'] = offDays;
    data['propertyRulesAndPolicy'] = propertyRulesAndPolicy;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    if (overallSpecialPrice != null) {
      data['overallSpecialPrice'] = overallSpecialPrice!.toJson();
    }
    if (minBooking != null) {
      data['minBooking'] = minBooking!.toJson();
    }
    if (discounts != null) {
      data['discounts'] = discounts!.map((v) => v.toJson()).toList();
    }
    if (specialPrices != null) {
      data['specialPrices'] = specialPrices;
    }
    if (additionalFees != null) {
      data['additionalFees'] = additionalFees!.map((v) => v.toJson()).toList();
    }
    if (cancellationPenalties != null) {
      data['cancellationPenalties'] = cancellationPenalties;
    }
    if (photos != null) {
      data['photos'] = photos;
    }
    if (galleryUploads != null) {
      data['galleryUploads'] = galleryUploads!.map((v) => v.toJson()).toList();
    }
    data['avgRating'] = avgRating;
    data['totalReview'] = totalReview;
    data['revenue'] = revenue;
    data['verified'] = verified;
    data['disabled'] = disabled;
    data['paid'] = paid;
    data['publishable'] = publishable;
    data['phone'] = phone;
    data['email'] = email;
    data['contactInfo'] = contactInfo;
    if (advStatusHistory != null) {
      data['advStatusHistory'] = advStatusHistory!.map((v) => v.toJson()).toList();
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

class SubCategory {
  String? name;
  String? image;
  bool? active;

  SubCategory({this.name, this.image, this.active});

  SubCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['active'] = active;
    return data;
  }
}

class NicheCategory {
  String? name;
  String? subCategoryId;
  String? image;
  bool? active;

  NicheCategory({this.name, this.subCategoryId, this.image, this.active});

  NicheCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subCategoryId = json['subCategoryId'];
    image = json['image'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['subCategoryId'] = subCategoryId;
    data['image'] = image;
    data['active'] = active;
    return data;
  }
}

class Address {
  Division? division;
  District? district;
  PoliceStation? policeStation;
  String? streetAddress;
  String? city;
  String? area;
  int? zipCode;
  String? country;
  Location? location;

  Address(
      {this.division,
      this.district,
      this.policeStation,
      this.streetAddress,
      this.city,
      this.area,
      this.zipCode,
      this.country,
      this.location});

  Address.fromJson(Map<String, dynamic> json) {
    division = json['division'] != null ? Division.fromJson(json['division']) : null;
    district = json['district'] != null ? District.fromJson(json['district']) : null;
    policeStation = json['policeStation'] != null ? PoliceStation.fromJson(json['policeStation']) : null;
    streetAddress = json['streetAddress'];
    city = json['city'];
    area = json['area'];
    zipCode = json['zipCode'];
    country = json['country'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (division != null) {
      data['division'] = division!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (policeStation != null) {
      data['policeStation'] = policeStation!.toJson();
    }
    data['streetAddress'] = streetAddress;
    data['city'] = city;
    data['area'] = area;
    data['zipCode'] = zipCode;
    data['country'] = country;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class Division {
  String? divisionName;

  Division({this.divisionName});

  Division.fromJson(Map<String, dynamic> json) {
    divisionName = json['divisionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['divisionName'] = divisionName;
    return data;
  }
}

class District {
  String? districtName;

  District({this.districtName});

  District.fromJson(Map<String, dynamic> json) {
    districtName = json['districtName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['districtName'] = districtName;
    return data;
  }
}

class PoliceStation {
  String? policeStationName;

  PoliceStation({this.policeStationName});

  PoliceStation.fromJson(Map<String, dynamic> json) {
    policeStationName = json['policeStationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['policeStationName'] = policeStationName;
    return data;
  }
}

class Location {
  String? addressText;
  double? longitude;
  double? latitude;

  Location({this.addressText, this.longitude, this.latitude});

  Location.fromJson(Map<String, dynamic> json) {
    addressText = json['addressText'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressText'] = addressText;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}

class ShiftingTimes {
  String? shiftFrom;
  String? shiftTo;

  ShiftingTimes({this.shiftFrom, this.shiftTo});

  ShiftingTimes.fromJson(Map<String, dynamic> json) {
    shiftFrom = json['shiftFrom'];
    shiftTo = json['shiftTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shiftFrom'] = shiftFrom;
    data['shiftTo'] = shiftTo;
    return data;
  }
}

class AmenityGroups {
  String? title;
  List<Amenities>? amenities;
  bool? active;

  AmenityGroups({this.title, this.amenities, this.active});

  AmenityGroups.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['amenities'] != null) {
      amenities = <Amenities>[];
      json['amenities'].forEach((v) {
        amenities!.add(Amenities.fromJson(v));
      });
    }
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (amenities != null) {
      data['amenities'] = amenities!.map((v) => v.toJson()).toList();
    }
    data['active'] = active;
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

class Price {
  double? hourly;
  double? daily;
  double? weekend;
  double? weekly;
  double? monthly;

  Price({this.hourly, this.daily, this.weekend, this.weekly, this.monthly});

  Price.fromJson(Map<String, dynamic> json) {
    hourly = json['hourly'];
    daily = json['daily'];
    weekend = json['weekend'];
    weekly = json['weekly'];
    monthly = json['monthly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hourly'] = hourly;
    data['daily'] = daily;
    data['weekend'] = weekend;
    data['weekly'] = weekly;
    data['monthly'] = monthly;
    return data;
  }
}

class MinBooking {
  String? bookingType;
  int? minBookingTime;

  MinBooking({this.bookingType, this.minBookingTime});

  MinBooking.fromJson(Map<String, dynamic> json) {
    bookingType = json['bookingType'];
    minBookingTime = json['minBookingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bookingType'] = bookingType;
    data['minBookingTime'] = minBookingTime;
    return data;
  }
}

class Discounts {
  String? discountType;
  String? bookingType;
  double? flatPrice;
  int? percent;
  int? minBookingTime;

  Discounts({this.discountType, this.bookingType, this.flatPrice, this.percent, this.minBookingTime});

  Discounts.fromJson(Map<String, dynamic> json) {
    discountType = json['discountType'];
    bookingType = json['bookingType'];
    flatPrice = json['flatPrice'];
    percent = json['percent'];
    minBookingTime = json['minBookingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['discountType'] = discountType;
    data['bookingType'] = bookingType;
    data['flatPrice'] = flatPrice;
    data['percent'] = percent;
    data['minBookingTime'] = minBookingTime;
    return data;
  }
}

class AdditionalFees {
  String? name;
  double? amount;

  AdditionalFees({this.name, this.amount});

  AdditionalFees.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['amount'] = amount;
    return data;
  }
}

class GalleryUploads {
  String? type;
  String? category;
  String? path;

  GalleryUploads({this.type, this.category, this.path});

  GalleryUploads.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    category = json['category'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['category'] = category;
    data['path'] = path;
    return data;
  }
}

class AdvStatusHistory {
  String? advStatus;
  CreatedBy? createdBy;
  int? createdAt;

  AdvStatusHistory({this.advStatus, this.createdBy, this.createdAt});

  AdvStatusHistory.fromJson(Map<String, dynamic> json) {
    advStatus = json['advStatus'];
    createdBy = json['createdBy'] != null ? CreatedBy.fromJson(json['createdBy']) : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['advStatus'] = advStatus;
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    data['createdAt'] = createdAt;
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
