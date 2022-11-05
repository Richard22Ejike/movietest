import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../models/model.dart';

Future<Welcome> fetchPhotos() async {
  final response = await http.get(Uri.parse('https://imdb-api.com/en/API/ComingSoon/k_tzzpbhi3'));
var data = jsonDecode(response.body.toString());
  // Use the compute function to run parsePhotos in a separate isolate.
if (response.statusCode == 200){
  return Welcome.fromJson(data);
}else{
  return Welcome.fromJson(data);
}
}

