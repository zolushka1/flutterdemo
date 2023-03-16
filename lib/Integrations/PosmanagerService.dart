import 'package:itemcount/BusinessObjects/Contract.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:itemcount/Constant.dart';
import 'package:itemcount/Integrations/dio_utils.dart';

class PosManagerService {
  static Future<Contract> getContract(String number) async {
    var result = await DioUtils().client.get(
          'https://prod-service.ontime.mn/customers/contracts?contractNumber=1592634870',
          // options: Options(
          //   headers: <String, String>{
          //     'Content-Type': 'application/json; charset=UTF-8',
          //     'Authorization': 'Bearer ${token}',
          //   },
          // ),
        );

    if (result.statusCode != 200) throw Exception(result.data);
    return Contract.fromJson(result.data);
  }
}
