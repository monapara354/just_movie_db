import "package:dio/dio.dart";
import "package:get/get.dart" as state;
import "package:irisnews/core/shared/domain/model/app_config.dart";

class ApiService {
  final Dio _dio = Dio()
    ..options.connectTimeout = const Duration(milliseconds: 7000)
    ..options.receiveTimeout = const Duration(milliseconds: 11000)
    ..options.sendTimeout = const Duration(milliseconds: 7000);

  Future<Response> postRequest({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? header,
  }) async {
    setBaseUrlPort();
    if (header != null && header.isNotEmpty) {
      _dio.options.headers["Authorization"] = header;
    }
    _dio.options.validateStatus = (status) => true;
    _dio.options.contentType = Headers.jsonContentType;
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? queryParams,
    String? header,
  }) async {
    setBaseUrlPort();
    if (header != null && header.isNotEmpty) {
      _dio.options.headers["Authorization"] = header;
    }
    _dio.options.validateStatus = (status) => true;
    final response = await _dio.get(
      path,
      queryParameters: queryParams,
    );
    return response;
  }

  Future<Response> putRequest({
    required String path,
    Map<String, dynamic>? data,
    String? header,
  }) async {
    setBaseUrlPort();
    if (header != null && header.isNotEmpty) {
      _dio.options.headers["Authorization"] = header;
    }
    final response = await _dio.put(
      path,
      data: data,
    );
    return response;
  }

  Future<Response> patchRequest({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? header,
    String? file,
  }) async {
    setBaseUrlPort();
    if (header != null && header.isNotEmpty) {
      _dio.options.headers["Authorization"] = header;
    }
    _dio.options.validateStatus = (status) => true;

    var formData = FormData();

    if (file != null && file.isNotEmpty) {
      _dio.options.contentType = Headers.multipartFormDataContentType;
      data?.addAll({
        "profile_picture": await MultipartFile.fromFile(file),
      });
      formData = FormData.fromMap(data!);
    } else {
      final List<MapEntry<String, String>> mapEntries = data?.entries
              .map((entry) => MapEntry(entry.key, entry.value.toString()))
              .toList() ??
          [];
      formData.fields.addAll(mapEntries);
    }
    final response = await _dio.patch(
      path,
      data: formData,
      queryParameters: queryParameters,
    );
    return response;
  }

  void setBaseUrlPort() {
    final appConfig = state.Get.find<AppConfig>();
    _dio.options.baseUrl = appConfig.getBaseUrl;
  }
}
