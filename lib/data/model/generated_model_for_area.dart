class AllArea {
  List<String>? data;
  String? message;
  int? statusCode;
  bool? status;
  double? timestamp;

  AllArea({
    this.data,
    this.message,
    this.statusCode,
    this.status,
    this.timestamp,
  });

  AllArea.fromJson(Map<String, dynamic> json) {
    data = json['data'].cast<String>();
    message = json['message'];
    statusCode = json['statusCode'];
    status = json['status'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['message'] = message;
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['timestamp'] = timestamp;
    return data;
  }
}
