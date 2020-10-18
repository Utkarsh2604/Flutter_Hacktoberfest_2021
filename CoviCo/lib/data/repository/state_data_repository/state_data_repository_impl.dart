import 'package:covico/data/db/app_database.dart';
import 'package:covico/data/db/dao/statewise_dao.dart';
import 'package:covico/data/models/district_wise_model.dart';
import 'package:covico/data/models/state_model.dart';
import 'package:covico/data/network/network_service.dart';
import 'package:covico/data/repository/state_data_repository/state_data_repository.dart';
import 'package:covico/data/resource.dart';

class StateDataRepositoryImpl extends StateDataRepository {
  final NetworkService networkService;
  final AppDatabase db;

  StateDataRepositoryImpl(this.networkService, this.db)
      : assert(networkService != null, db != null);

  @override
  Stream<Resource<StateModel>> fetchStateData() async* {
    yield Resource.loading();
    StatewiseDao statewiseDao = await db.statewiseDao;
    StateModel stateModel = await statewiseDao.getStateModel();
    if (stateModel != null) {
      yield Resource.success(data: stateModel);
    }
    Resource<StateModel> res =
        await networkService.stateDataApi.fetchStateData();
    if (res.data != null) {
    await  statewiseDao.setStateModel(res.data);
    yield res;
    }
  }

  @override
  Stream<Resource<List<DistrictWiseModel>>> fetchDistrictData() async* {
    yield Resource.loading();
    StatewiseDao statewiseDao = await db.statewiseDao;
    List<DistrictWiseModel> districtWiseModelList =
        await statewiseDao.getDistrictWiseModel();
    if (districtWiseModelList != null) {
      yield Resource.success(data: districtWiseModelList);
    }
    Resource<List<DistrictWiseModel>> res =
        await networkService.stateDataApi.fetchDistrictData();
    if (districtWiseModelList == null) {
      yield res;
    }
    if (res.data != null) {
    await  statewiseDao.setDistrictWiseModel(res.data);
    yield res;
    }
  }
}
