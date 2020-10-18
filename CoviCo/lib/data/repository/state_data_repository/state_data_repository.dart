import 'package:covico/data/models/district_wise_model.dart';
import 'package:covico/data/models/state_model.dart';
import 'package:covico/data/resource.dart';

abstract class StateDataRepository {
  Stream<Resource<StateModel>> fetchStateData();
  Stream<Resource<List<DistrictWiseModel>>> fetchDistrictData();
}
