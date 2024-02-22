import 'package:dio/dio.dart';
import 'package:flash/constants/response_constants.dart';
import 'package:flash/data/remote/services/apis/apis_status.dart';

class NetworkClients {
  static final Dio _dio = Dio();

  static String _makeUri(
      String host, String path, Map<String, dynamic>? parameters) {
    final uri = Uri.https(host);
    final u = uri.replace(path: path, queryParameters: parameters);
    return u.toString();
  }

  static Future<Object> get(
    String host,
    String path,
    Function(String json) parser, {
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
  }) async {
    final url = _makeUri(host, path, parameters);
    final response = await _dio.get(url,
        queryParameters: parameters, options: Options(headers: headers));
    return await _handleResponse(response, parser);
  }

  static Future<Object> post(
    String host,
    String path,
    Function(String json) parser, {
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
    Object? body,
  }) async {
    final url = _makeUri(host, path, parameters);
    final response = await _dio.post(url,
        queryParameters: parameters,
        data: body,
        options: Options(headers: headers));
    return await _handleResponse(response, parser);
  }

  static Future<Object> postData(
    String host,
    String path,
    Function(String json) parser,
    MultipartFile file, {
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
    Map<String, String>? body,
  }) async {
    final url = _makeUri(host, path, parameters);
    FormData formData = FormData.fromMap({...body ?? {}, "file": file});

    final response = await _dio.post(
      url.toString(),
      data: formData,
      options: Options(headers: headers),
    );
    return await _handleResponse(response, parser);
  }

  static Future<Object> put(
    String host,
    String path,
    Function(String json) parser, {
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
    Object? body,
  }) async {
    final url = _makeUri(host, path, parameters);
    final response = await _dio.put(url,
        queryParameters: parameters,
        data: body,
        options: Options(headers: headers));
    return await _handleResponse(response, parser);
  }

  static Future<Object> _handleResponse(
      Response<dynamic> response, Function(String json) parser) async {
    try {
      if (response.statusCode == 200) {
        return Success(response: parser(response.data.toString()));
      }
      return Failure(code: 100, errorResponse: ResponseConstants.error100);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return Failure(code: 101, errorResponse: ResponseConstants.error101);
      } else if (e.type == DioExceptionType.unknown) {
        return Failure(code: 103, errorResponse: ResponseConstants.error103);
      } else {
        return Failure(code: 102, errorResponse: ResponseConstants.error102);
      }
    } catch (e) {
      return Failure(code: 104, errorResponse: e.toString());
    }
  }
}
