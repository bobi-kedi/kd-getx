class GeneralMeta {
  Meta? meta;

  GeneralMeta({this.meta});

  GeneralMeta.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta?.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta?.toJson();
    }
    return data;
  }
}

class Meta {
  bool? error;
  int? statusCode;
  String? message;
  String? path;
  String? timestamp;

  Meta({this.error, this.statusCode, this.message, this.path, this.timestamp});

  Meta.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    statusCode = json['status_code'];
    message = json['message'];
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['error'] = error;
    data['status_code'] = statusCode;
    data['message'] = message;
    data['path'] = path;
    data['timestamp'] = timestamp;
    return data;
  }
}
