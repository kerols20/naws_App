import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:naws_app/core/api/article_model.dart';
import 'package:naws_app/core/api/constant/Api_constant.dart';
import 'package:naws_app/core/api/source_model.dart';
abstract class Api_network{
 static Future<List<Source>> gatAllSouces(String categryId)async{
    try {
      var queryParameters = {
        /// Query parameters sand Api key
        'apiKey': constant.ApiKey,
        'category': categryId,
      };
      var url = Uri.https(constant.baseUrl, constant.Endpoint,queryParameters);
      /// first call http and type of request
      var data = await http.get(url); /// object i mean map
      log(data.body);
      log(data.request.toString());
      Map<String, dynamic> response =  jsonDecode(data.body);/// jsonDecode convert String to object /// jsonEncode convert object to Stringظظظ
      /// than sand it to the model
     sourcesModel sourcesModelresponse =  sourcesModel.fromJson(response);
     /// return the item i needed from the sources
     return sourcesModelresponse.sources;

    } catch (e) {
      throw Exception(e.toString());
    }
  }
 static Future<List<Article>> gatAllArticels(String sources)async{
   try {
     var queryParameters = {
       /// Query parameters sand Api key
       'apiKey': constant.ApiKey,
       'sources': sources,
     };
     var url = Uri.https(constant.baseUrl, constant.evarything,queryParameters);
     /// first call http and type of request
     var data = await http.get(url); /// object i mean map
     log(data.body);
     log(data.request.toString());
     Map<String, dynamic> response =  jsonDecode(data.body);/// jsonDecode convert String to object /// jsonEncode convert object to Stringظظظ
     /// than sand it to the model
     ArticleModel ArticleModelresponse =  ArticleModel.fromHason(response);
     /// return the item i needed from the sources
     return ArticleModelresponse.articles;
   } catch (e) {
     throw Exception(e.toString());
   }
 }
}