class RequestResponse {
  final bool success;
  final dynamic data;
  final String? error;

  RequestResponse(this.success, {this.data, this.error});

  factory RequestResponse.fromJson(Map<String, dynamic> json) {
    return RequestResponse(
      json['success'] ?? false,
      data: json['data'],
      error: json['error'],
    );
  }
}
