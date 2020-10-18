import 'package:covico/data/models/district_wise_model.dart';
import 'package:covico/ui/widgets/build_district_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DistrictWisePage extends StatelessWidget {
  final DistrictWiseModel districtWiseModel;

  const DistrictWisePage({Key key, this.districtWiseModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${districtWiseModel.state}',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BuildDistrictList(
      districtDataList: districtWiseModel.districtData,
    );
  }
}
