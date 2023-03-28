import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:nuri_app/model/data_model_quran.dart';
import 'package:nuri_app/response/request_quran.dart';

class QuranController extends GetxController {
  RxBool loading = false.obs;
  RxList<DataQuran> dataQuran = <DataQuran>[].obs;
  String year = DateFormat('yyyy').format(DateTime.now());
  String month = DateFormat('MM').format(DateTime.now());
  String day = DateFormat('dd').format(DateTime.now());

  @override
  void onInit() {
    super.onInit();
    readJadwal();
  }

  void readJadwal() async {
    RequestQuran request = RequestQuran(url: 'surah');
    request.get().then((response) {
      if (response.statusCode == 200) {
        // print(response.body);
        List jsonResponse = jsonDecode(response.body)['data'];
        dataQuran.value = jsonResponse.map((e) => DataQuran.fromJson(e)).toList();
        var b = jsonDecode(response.body)['data']['number'];
        print(b);
      } else {
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }
}
