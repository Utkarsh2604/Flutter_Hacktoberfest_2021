import 'package:covico/data/db/dao/statewise_dao.dart';
import 'package:covico/data/models/district_wise_model.dart';
import 'package:covico/data/models/state_model.dart';
import 'package:sembast/sembast.dart';

const String STATE_WISE_MODEL_FOLDER = "state_wise_model_folder";
const String DISTRICT_WISE_MODEL_FOLDER = "district_wise_model_folder";

class StatewiseDaoImpl implements StatewiseDao {
  final Database _db;
  final _statewiseFolder = intMapStoreFactory.store(STATE_WISE_MODEL_FOLDER);
  final _districtwiseFolder =
      intMapStoreFactory.store(DISTRICT_WISE_MODEL_FOLDER);

  StatewiseDaoImpl(this._db);

  @override
  Future<StateModel> getStateModel() async {
    final List<RecordSnapshot> recordSnapshot =
        await _statewiseFolder.find(_db);
    List<StateModel> stateModelList = recordSnapshot.map((snapshot) {
      return StateModel.fromJson(snapshot.value);
    }).toList();
    if (stateModelList.length > 0) {
      return stateModelList[0];
    }
  }

  @override
  Future setStateModel(StateModel stateModel) async {
    int ans =  await _statewiseFolder.update(_db, stateModel.toJson());
  }

  @override
  Future<List<DistrictWiseModel>> getDistrictWiseModel() async {
    final List<RecordSnapshot> recordSnapshot =
        await _districtwiseFolder.find(_db);
    List<List<DistrictWiseModel>> districtwiseModelList =
        recordSnapshot.map((data) {
      print(data.value['districtWiseModel']);
      List<DistrictWiseModel> list = [];
      data.value['districtWiseModel']
          ?.forEach((e) => list.add(DistrictWiseModel.fromJson(e)));
      return list;
    }).toList();
    if (districtwiseModelList.length > 0) {
      return districtwiseModelList[0];
    }
  }

  @override
  Future setDistrictWiseModel(List<DistrictWiseModel> districtWiseModelList) async{
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (districtWiseModelList != null) {
      data['districtWiseModel'] =
          districtWiseModelList.map((v) => v.toJson()).toList();
    }
   await _districtwiseFolder.update(_db, data);
  }
}
