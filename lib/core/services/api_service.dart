import "package:dio/dio.dart";
import "package:get/get.dart" as state;
import "package:just_movie/core/services/api_urls.dart";
import "package:just_movie/core/shared/domain/model/app_config.dart";

class ApiService {
  final Dio _dio = Dio()
    ..options.connectTimeout = const Duration(milliseconds: 7000)
    ..options.receiveTimeout = const Duration(milliseconds: 11000)
    ..options.sendTimeout = const Duration(milliseconds: 7000);

  Future<Response> postRequest({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isAuthRequired = true,
  }) async {
    setBaseConfiguration(isAuthRequired: isAuthRequired);
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
    bool isAuthRequired = true,
  }) async {
    setBaseConfiguration(isAuthRequired: isAuthRequired);
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
    bool isAuthRequired = true,
  }) async {
    setBaseConfiguration(isAuthRequired: isAuthRequired);
    final response = await _dio.put(path, data: data);
    return response;
  }

  Future<Response> patchRequest({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? file,
    bool isAuthRequired = true,
  }) async {
    setBaseConfiguration(isAuthRequired: isAuthRequired);
    _dio.options.validateStatus = (status) => true;

    var formData = FormData();
    final Response response;

    if (file != null && file.isNotEmpty) {
      _dio.options.contentType = Headers.multipartFormDataContentType;
      data?.addAll({
        "profile_picture": await MultipartFile.fromFile(file),
      });
      formData = FormData.fromMap(data!);
      response = await _dio.patch(
        path,
        data: formData,
        queryParameters: queryParameters,
      );
    } else {
      formData = FormData.fromMap(data!);
      response = await _dio.patch(
        path,
        data: formData,
        queryParameters: queryParameters,
      );
    }
    return response;
  }

  Future<Response> deleteRequest({
    required String path,
    Map<String, dynamic>? data,
    bool isAuthRequired = true,
  }) async {
    setBaseConfiguration(isAuthRequired: isAuthRequired);
    final response = await _dio.delete(
      path,
      data: data,
    );
    return response;
  }

  void setBaseConfiguration({bool isAuthRequired = true}) {
    final appConfig = state.Get.find<AppConfig>();
    _dio.options.baseUrl = appConfig.getBaseUrl;
    if (isAuthRequired) {
      // final jwtToken =
      //     state.Get.find<LocalCache>().getString(Preferences.jwtToken);
      const jwtToken = EndPoints.accessToken;
      _dio.options.headers["Authorization"] = "Bearer $jwtToken";
    } else {
      _dio.options.headers = null;
    }
  }
}
