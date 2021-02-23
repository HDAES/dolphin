import 'package:dio/dio.dart';
import 'package:dolphin/common/utils/storage.dart';

class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  static Dio dio;

  HttpUtil._internal() {
    BaseOptions options = new BaseOptions(
      baseUrl: '',
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {},
      contentType: 'application/json;charset=utf-8',
      responseType: ResponseType.json,
    );
    //加载配置
    dio = new Dio(options);
    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options;
    }, onResponse: (Response response) {
      if(response.statusCode==200&&response.data['code']==200){
        return response.data;
      }
    }, onError: (DioError e){

    }));
  }

  /// 添加头部信息
  Map<String, dynamic> getAuthorizationHeader() {
    var headers;
    String token = StorageUtil().getJSON("TOKEN");
    //print(token);
    if (token != null) {
      headers = {
        'Authorization': 'Bearer $token',
      };
    }
    return headers;
  }

   //get请求
  Future get ( 
    String path,{
      dynamic params,
      Options options,
    }
  ) async {
    Options requestOptions = options?? Options();
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if(_authorization != null) requestOptions = requestOptions.merge(headers: _authorization);
    
    Response response = await dio.get(path,
      queryParameters: params,
      options:requestOptions
    );
    
    return response.data;
  }
}

//错误处理
ErrorEntity createErrorEntity(DioError error) {
  switch (error.type) {
    case DioErrorType.CANCEL:
      {
        return ErrorEntity(code: -1, message: "请求取消");
      }
      break;
    case DioErrorType.CONNECT_TIMEOUT:
      {
        return ErrorEntity(code: -1, message: "连接超时");
      }
      break;
    case DioErrorType.SEND_TIMEOUT:
      {
        return ErrorEntity(code: -1, message: "请求超时");
      }
      break;
    case DioErrorType.RECEIVE_TIMEOUT:
      {
        return ErrorEntity(code: -1, message: "响应超时");
      }
      break;
    case DioErrorType.RESPONSE:
      {
        try {
          int errCode = error.response.statusCode;
          print(errCode);
          // String errMsg = error.response.statusMessage;
          // return ErrorEntity(code: errCode, message: errMsg);
          switch (errCode) {
            case 400:
              {
                return ErrorEntity(code: errCode, message: "请求语法错误");
              }
              break;
            case 401:
              {
                return ErrorEntity(code: errCode, message: "没有权限");
              }
              break;
            case 403:
              {
                return ErrorEntity(code: errCode, message: "服务器拒绝执行");
              }
              break;
            case 404:
              {
                return ErrorEntity(code: errCode, message: "无法连接服务器");
              }
              break;
            case 405:
              {
                return ErrorEntity(code: errCode, message: "请求方法被禁止");
              }
              break;
            case 500:
              {
                return ErrorEntity(code: errCode, message: "服务器内部错误");
              }
              break;
            case 502:
              {
                return ErrorEntity(code: errCode, message: "无效的请求");
              }
              break;
            case 503:
              {
                return ErrorEntity(code: errCode, message: "服务器挂了");
              }
              break;
            case 505:
              {
                return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
              }
              break;
            default:
              {
                // return ErrorEntity(code: errCode, message: "未知错误");
                return ErrorEntity(
                    code: errCode, message: error.response.statusMessage);
              }
          }
        } on Exception catch (_) {
          return ErrorEntity(code: -1, message: "未知错误");
        }
      }
      break;
    default:
      {
        return ErrorEntity(code: -1, message: error.message);
      }
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int code;
  String message;
  ErrorEntity({this.code, this.message});

  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}
