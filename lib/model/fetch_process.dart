import '../services/network_service_response.dart';

enum ApiType { performOTP, performLogin, getProductInfo }

class FetchProcess<T> {
  ApiType? type;
  bool loading;
  NetworkServiceResponse<T>? response;

  FetchProcess({
    required this.loading,
    this.response,
    this.type,
  });
}
