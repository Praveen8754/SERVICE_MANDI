import 'package:dio/dio.dart';

import '../model/base_response.dart';


class DioErrorUtil {
  static BaseResponse handleErrors(dynamic error) {
    //CodeSnippet.instance.showMsg(error);
    print(error);
    BaseResponse response = BaseResponse();
    try {
      if (error is DioError) {
        DioError dioError = error;
        if (error.type == DioErrorType.connectionTimeout) {
          response.status = 0;
          response.errorMessage = 'Network Error';
        } else if (dioError.response != null &&
            dioError.response!.data != null) {
          response.errorMessage ="Server is Not Responding";
        } else {
          response.status = 0;
          response.errorMessage = dioError.message;
        }
      } else {
        response.status = 0;
        response.errorMessage = error.message;
      }
    } catch (exception) {
      response.status = 0;
      response.errorMessage ="Server is Not Responding";
    }

    return response;
  }
}
