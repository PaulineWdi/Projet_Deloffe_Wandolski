
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tpmobile/services/api.dart';

class APIService {
  final API api = API();
  final Dio dio = Dio();

  Future<Response> getData(String path, {Map<String, dynamic>? params})async{
    // on construit l'URL :
    String _url = api.baseURL + path;
    // on construit les paramètres de la requetes :
    //ces paramètres seront presents dnas chaque requêtes
    Map<String, dynamic> query={
      'api_key': api.apiKey,
      'language': 'fr-FR',
    };
    //Si params n'est pas null, on ajoute son contenu à  query
    if(params != null){
      query.addAll(params);
    }

    //on fait l'appel
    final response = await dio.get(_url, queryParameters: query);

  }
}