import 'dart:convert';


import 'package:http/http.dart';

import 'APi_class.dart';
import 'ProductClass/Products.dart';
import 'ProductClass/Produnt1.dart';

// class UserRepository {
//   String userUrl = 'https://dummyjson.com/products';
//
//   Future<List<UserModel>> getUsers() async {
//     Response response = await get(Uri.parse(userUrl));
//
//     if (response.statusCode == 200) {
//       final List result = jsonDecode(response.body.toString());
//       return result.map((e) => UserModel.fromJson(e)).toList();
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }

 class productRepositort{
   Future<List<Products>?> fetchData() async {

     var response = await get(Uri.parse("https://dummyjson.com/products"));
     var jsondata = jsonDecode(response.body.toString());
     var resp = Produnt1.fromJson(jsondata);
     var list = resp.products;
     return list;
   }
 }
