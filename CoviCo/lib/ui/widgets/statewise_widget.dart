import 'package:covico/blocs/state_data_bloc/state_data_bloc.dart';
import 'package:covico/blocs/state_data_bloc/state_data_event.dart';
import 'package:covico/data/models/district_wise_model.dart';
import 'package:covico/data/models/state_model.dart';
import 'package:covico/data/resource.dart';
import 'package:covico/ui/widgets/primary_error_widget.dart';
import 'package:covico/ui/widgets/stream_task_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class StateWiseWidget extends StatelessWidget {
  final List<Statewise> statewise;

  const StateWiseWidget({Key key, this.statewise})
      : assert(statewise != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    StateDataBloc stateDataBloc = Provider.of<StateDataBloc>(context);
    return StreamTaskBuilder<List<DistrictWiseModel>>(
      stream: stateDataBloc.districtWiseObservable,
      successBuilder: (
        context,
        List<DistrictWiseModel> data,
        Resource<List<DistrictWiseModel>> res,
      ) {
        return _buildStateWiseList(context, res.data);
      },
      failureBuilder: (
        context,
        List<DistrictWiseModel> data,
        Resource<List<DistrictWiseModel>> res,
      ) =>
          PrimaryErrorWidget.networkErrorOrNot(
        context: context,
        isNetworkError: res.isNetworkError,
        message: 'Something went wrong.',
        onRetry: () {
          stateDataBloc.dispatch(GetDistrictDataEvent());
        },
      ),
      loadingBuilder: (
        context,
        List<DistrictWiseModel> data,
        Resource<List<DistrictWiseModel>> res,
      ) =>
          SpinKitChasingDots(
        color: Theme.of(context).accentColor,
      ),
    );
  }

  Widget _buildStateWiseList(
      BuildContext context, List<DistrictWiseModel> districtWiseList) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(children: [
            TableRow(children: [
              Text(
                'Active',
                style: Theme.of(context).textTheme.caption,
              ),
              Text('Confirmed', style: Theme.of(context).textTheme.caption),
              Text(
                'Recovered',
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                'Deaths',
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                'State',
                style: Theme.of(context).textTheme.caption,
              ),
            ])
          ]),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: statewise.length,
            itemBuilder: (context, index) {
              int districtIndex = districtWiseList.indexWhere(
                  (element) => element.state == statewise[index].state);
              if (districtIndex == -1) {
                return _BuildStatewiseItem(
                  statewise: statewise[index],
                );
              }
              return _BuildStatewiseItem(
                statewise: statewise[index],
                districtWise: districtWiseList[districtIndex],
              );
            },
            primary: true,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}

class _BuildStatewiseItem extends StatelessWidget {
  final Statewise statewise;
  final DistrictWiseModel districtWise;
  const _BuildStatewiseItem({Key key, this.statewise, this.districtWise})
      : assert(statewise != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () {
        print(districtWise);
        if (districtWise != null) {
          Navigator.pushNamed(context, '/extract', arguments: {
            "districtWise": districtWise,
            "confirmed": statewise.confirmed
          });
        }
      },
      child: Card(
        elevation: 2.0,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            children: [
              TableRow(
                children: <Widget>[
                  Text(
                    '${statewise.active}',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  Text('${statewise.confirmed}'),
                  Text('${statewise.recovered}'),
                  Text(
                    '${statewise.deaths}',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    '${statewise.state}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
