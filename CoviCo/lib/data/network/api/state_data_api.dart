import 'package:covico/data/models/district_wise_model.dart';
import 'package:covico/data/models/state_model.dart';
import 'package:covico/data/network/request_handler.dart';
import 'package:covico/data/resource.dart';

class StateDataApi {
  final RequestHandler _requestHandler;
  StateDataApi(this._requestHandler);

  Future<Resource<StateModel>> fetchStateData() async {
    return _requestHandler.sendRequest(
      method: Method.get,
      path: '/data.json',
      responseMapper: (data) {
        return StateModel.fromJson(data.data);
      },
    );
  }

  Future<Resource<List<DistrictWiseModel>>> fetchDistrictData() async {
    return _requestHandler.sendRequest(
      method: Method.get,
      path: '/v2/state_district_wise.json',
      responseMapper: (data) {
        List<DistrictWiseModel> districtList = [];
        data.data.forEach((v) {
          districtList.add(DistrictWiseModel.fromJson(v));
        });
        return districtList;
      },
    );
  }
}
