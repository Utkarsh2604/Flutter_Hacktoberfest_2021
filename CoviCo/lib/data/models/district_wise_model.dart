class DistrictWiseModel {
  String state;
  List<DistrictData> districtData;

  DistrictWiseModel({this.state, this.districtData});

  DistrictWiseModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    if (json['districtData'] != null) {
      districtData = new List<DistrictData>();
      json['districtData'].forEach((v) {
        districtData.add(new DistrictData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    if (this.districtData != null) {
      data['districtData'] = this.districtData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DistrictData {
  String district;
  int confirmed;
  String lastupdatedtime;
  Delta delta;

  DistrictData(
      {this.district, this.confirmed, this.lastupdatedtime, this.delta});

  DistrictData.fromJson(Map<String, dynamic> json) {
    district = json['district'];
    confirmed = json['confirmed'];
    lastupdatedtime = json['lastupdatedtime'];
    delta = json['delta'] != null ? new Delta.fromJson(json['delta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['district'] = this.district;
    data['confirmed'] = this.confirmed;
    data['lastupdatedtime'] = this.lastupdatedtime;
    if (this.delta != null) {
      data['delta'] = this.delta.toJson();
    }
    return data;
  }
}

class Delta {
  int confirmed;

  Delta({this.confirmed});

  Delta.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    return data;
  }
}
