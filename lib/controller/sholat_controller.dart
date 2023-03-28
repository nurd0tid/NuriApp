import 'package:get/get.dart';
import 'package:nuri_app/model/data_model_jadwal.dart';
import 'package:nuri_app/utils/request_jadwal.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class SholatController extends GetxController {
  RxBool loading = false.obs;
  RxList<DataJadwal> dataJadwal = <DataJadwal>[].obs;
  String year = DateFormat('yyyy').format(DateTime.now());
  String month = DateFormat('MM').format(DateTime.now());
  String day = DateFormat('dd').format(DateTime.now());

  @override
  void onInit() {
    super.onInit();
    readJadwal();
  }

  void readJadwal() async {
    RequestJadwal request = RequestJadwal(url: '?lat=-6.1953184&long=106.792654&tahun=2020&bulan=2&tanggal=2');
    request.get().then((response) {
      if (response.statusCode == 200) {
        // print(response.body);
        List jsonResponse = jsonDecode(response.body)['data'];
        dataJadwal.value = jsonResponse.map((e) => DataJadwal.fromJson(e)).toList();
        // print(dataJadwal.map((e) => e.data![0].tanggal));
        // return dataJadwal;
        // var dataJadwal = jsonDecode(response.body);
        // Iterable it = jsonDecode(response.body)['data'];
        // List<DataJadwal> dataJadwal = it.map((e) => DataJadwal.fromJson(e)).toList();
        // return dataJadwal;
        // print(dataJadwal);
      } else {
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }
}
