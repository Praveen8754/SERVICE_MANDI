
import 'dart:io';

import '../model/base_response.dart';

class ExceptionErrorUtil {
  static BaseResponse handleErrors(dynamic error) {
    BaseResponse response = BaseResponse();
    try {
      if (error is FormatException) {
        response.status = 0;
        response.errorMessage = "Check your input format.";
      } else if (error is IOException) {
        response.status = 0;
        response.errorMessage = "Check your input format.";
      } else if (error is ArgumentError) {
        response.status = 0;
        //response.errorMessage = "No data Found";
        response.errorMessage = "Invalid argument provided.";
      }else{
        response.status = 0;
        response.errorMessage = "Unable to connect server.";
      }
    } catch (exception) {
      response.status = 0;
      response.errorMessage = "Please check your internet and try again later.";
    }

    return response;
  }
}
