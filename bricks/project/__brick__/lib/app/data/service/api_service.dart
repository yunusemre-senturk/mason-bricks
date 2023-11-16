import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:io';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
}