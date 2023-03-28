class DataJadwal {
  String? status;
  Request? request;
  List<Data>? data;

  DataJadwal({this.status, this.request, this.data});

  DataJadwal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    request = json['request'] != null ? new Request.fromJson(json['request']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.request != null) {
      data['request'] = this.request!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Request {
  String? lat;
  String? long;
  String? tahun;
  String? bulan;
  String? tanggal;

  Request({this.lat, this.long, this.tahun, this.bulan, this.tanggal});

  Request.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    tahun = json['tahun'];
    bulan = json['bulan'];
    tanggal = json['tanggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['tahun'] = this.tahun;
    data['bulan'] = this.bulan;
    data['tanggal'] = this.tanggal;
    return data;
  }
}

class Data {
  String? tanggal;
  Jadwal? jadwal;

  Data({this.tanggal, this.jadwal});

  Data.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    jadwal = json['jadwal'] != null ? new Jadwal.fromJson(json['jadwal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal'] = this.tanggal;
    if (this.jadwal != null) {
      data['jadwal'] = this.jadwal!.toJson();
    }
    return data;
  }
}

class Jadwal {
  String? subuh;
  String? terbit;
  String? duhur;
  String? ashar;
  String? terbenam;
  String? maghrib;
  String? isya;
  String? imsak;
  String? tengahMalam;

  Jadwal(
      {this.subuh,
      this.terbit,
      this.duhur,
      this.ashar,
      this.terbenam,
      this.maghrib,
      this.isya,
      this.imsak,
      this.tengahMalam});

  Jadwal.fromJson(Map<String, dynamic> json) {
    subuh = json['Subuh'];
    terbit = json['Terbit'];
    duhur = json['Duhur'];
    ashar = json['Ashar'];
    terbenam = json['Terbenam'];
    maghrib = json['Maghrib'];
    isya = json['Isya'];
    imsak = json['Imsak'];
    tengahMalam = json['TengahMalam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Subuh'] = this.subuh;
    data['Terbit'] = this.terbit;
    data['Duhur'] = this.duhur;
    data['Ashar'] = this.ashar;
    data['Terbenam'] = this.terbenam;
    data['Maghrib'] = this.maghrib;
    data['Isya'] = this.isya;
    data['Imsak'] = this.imsak;
    data['TengahMalam'] = this.tengahMalam;
    return data;
  }
}
