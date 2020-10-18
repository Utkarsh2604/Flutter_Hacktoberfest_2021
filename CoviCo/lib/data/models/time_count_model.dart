class TimeCountModel {
  final DateTime time;
  final int count;

  TimeCountModel(this.time, this.count);
}

class DistrictConfirmedModel {
  final String district;
  final int confirmed;

  DistrictConfirmedModel(this.district, this.confirmed);
}

class TotalCountModel {
  final String status;
  final int count;

  TotalCountModel(this.status, this.count);
}
