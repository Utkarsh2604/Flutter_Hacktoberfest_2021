import 'package:covico/blocs/state_data_bloc/state_data_bloc.dart';
import 'package:covico/blocs/state_data_bloc/state_data_event.dart';
import 'package:covico/constants/spaces.dart';
import 'package:covico/data/models/district_wise_model.dart';
import 'package:covico/data/models/state_model.dart';
import 'package:covico/data/models/time_count_model.dart';
import 'package:covico/data/resource.dart';
import 'package:covico/ui/widgets/cases_time_series.dart';
import 'package:covico/ui/widgets/chart_widget.dart';
import 'package:covico/ui/widgets/primary_error_widget.dart';
import 'package:covico/ui/widgets/search_widget.dart';
import 'package:covico/ui/widgets/statewise_widget.dart';
import 'package:covico/ui/widgets/stream_task_builder.dart';
import 'package:covico/ui/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  StateDataBloc stateDataBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    stateDataBloc = Provider.of<StateDataBloc>(context);
    stateDataBloc.dispatch(StateDataEvent());
    stateDataBloc.dispatch(GetDistrictDataEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CoviCo"),
        actions: <Widget>[
          IconButton(
              icon: ThemeSwitcher.of(context).isDarkModeOn
                  ? Icon(Icons.wb_sunny)
                  : Icon(
                      Icons.brightness_3,
                      color: Colors.grey,
                    ),
              onPressed: () {
                _selectedIndex = 0;
                ThemeSwitcher.of(context).switchDarkMode();
              }),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return StreamTaskBuilder(
      stream: stateDataBloc.stateDataObservable,
      successBuilder: (BuildContext context, StateModel data,
          Resource<StateModel> resource) {
        List<CasesTimeSeries> cases = data.casesTimeSeries;
        List<Statewise> statewise = data.statewise;
        if (_selectedIndex == 0) {
          return _buildHome(statewise[statewise.length - 1]);
        }
        if (_selectedIndex == 2) {
          return CasesTimeSeriesWidget(
            casesTimeSeries: cases,
          );
        }
        if (_selectedIndex == 1) {
          return StateWiseWidget(
            statewise: statewise,
          );
        }
        if (_selectedIndex == 3) {
          return StreamBuilder<List<charts.Series<TimeCountModel, DateTime>>>(
              stream: stateDataBloc.chartSeriesDataObservable,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return ChartWidget(series: snapshot.data);
                } else {
                  return SpinKitChasingDots(
                    color: Theme.of(context).accentColor,
                  );
                }
              });
        }
        return Container();
      },
      loadingBuilder:
          (BuildContext context, StateModel data, Resource resource) =>
              SpinKitChasingDots(
        color: Theme.of(context).accentColor,
      ),
      failureBuilder:
          (BuildContext context, StateModel data, Resource resource) {
        return PrimaryErrorWidget.networkErrorOrNot(
          context: context,
          isNetworkError: resource.isNetworkError,
          message: 'Something went wrong.',
          onRetry: () {
            stateDataBloc.dispatch(StateDataEvent());
          },
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          title: Text('State Data'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.open_in_browser),
          title: Text("CasesTimeSeries"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          title: Text('Chart'),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        if (_selectedIndex != index) {
          print('selectedindex$index');

          setState(() {
            _selectedIndex = index;
          });
        }
      },
      unselectedItemColor: Colors.grey,
      selectedItemColor: Theme.of(context).accentColor,
    );
  }

//  Widget _buildDistrictData() {
//    return StreamTaskBuilder(
//        stream: stateDataBloc.districtWiseObservable,
//        successBuilder: (BuildContext context,
//            List<DistrictWiseModel> districtData,
//            Resource<List<DistrictWiseModel>> resource) {
//          return DistrictWiseWidget(districtWiseData: districtData);
//        },
//        loadingBuilder: (BuildContext context, List<DistrictWiseModel> data,
//                Resource resource) =>
//            SpinKitChasingDots(
//              color: Theme.of(context).accentColor,
//            ),
//        failureBuilder: (BuildContext context, List<DistrictWiseModel> data,
//            Resource<List<DistrictWiseModel>> resource) {
//          return PrimaryErrorWidget.networkErrorOrNot(
//            context: context,
//            isNetworkError: resource.isNetworkError,
//            message: 'Something went wrong.',
//            onRetry: () {
//              stateDataBloc.dispatch(GetDistrictDataEvent());
//            },
//          );
//        });
//  }

  Widget _buildHome(Statewise statewise) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        _buildSearchWidget(),
        _buildLastUpdateTime(statewise),
        _buildActiveStatus(statewise),
        _buildAllStatus(statewise),
        _buildQuotes(),
      ],
    );
  }

  Widget _buildActiveStatus(Statewise statewise) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.brightness_1,
              color: Colors.green,
            ),
            Spaces.w12,
            Expanded(
              child: Text(
                'Active',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Text(
              '${statewise.active}',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLastUpdateTime(Statewise statewise) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'India',
            style: Theme.of(context).textTheme.headline5,
          ),
          Center(child: Text('Updated On')),
          Center(
            child: Text(
              '${statewise.lastupdatedtime}',
              style:
                  Theme.of(context).textTheme.caption.copyWith(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllStatus(Statewise statewise) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  '${statewise.confirmed}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Spaces.h8,
                Text(
                  'Confirmed',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '${statewise.recovered}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Spaces.h8,
                Text(
                  'Recovered',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '${statewise.deaths}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Spaces.h8,
                Text(
                  'Deaths',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuotes() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              ),
              Spaces.w16,
              Flexible(
                child: Text(
                  'Cover your nose and mouth with a disposable tissue or flexed elbow when you cough or sneeze Avoid close contact (1 meter or 3 feet) with people who are unwell.',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(letterSpacing: 2.0, wordSpacing: 2.0),
                ),
              ),
            ],
          ),
          Spaces.h16,
          Row(
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              ),
              Spaces.w16,
              Flexible(
                child: Text(
                  'Wash your hands regularly for 20 seconds, with soap and water or alcohol-based hand rub.',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        letterSpacing: 2.0,
                      ),
                ),
              ),
            ],
          ),
          Spaces.h16,
          Row(
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              ),
              Spaces.w16,
              Flexible(
                child: Text(
                  'Stay home and self-isolate from others in the household if you feel unwell.',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        letterSpacing: 2.0,
                      ),
                ),
              ),
            ],
          ),
          Spaces.h32,
          Align(
              alignment: Alignment.bottomRight,
              child: Text("Source: covid19india.org")),
        ],
      ),
    );
  }

  Widget _buildSearchWidget() {
    return StreamTaskBuilder<List<DistrictWiseModel>>(
      stream: stateDataBloc.districtWiseObservable,
      successBuilder: (
        context,
        List<DistrictWiseModel> data,
        Resource<List<DistrictWiseModel>> res,
      ) {
        return SearchWidget<DistrictWiseModel>(
          dataList: res.data,
          hideSearchBoxWhenItemSelected: false,
          listContainerHeight: MediaQuery.of(context).size.height / 2,
          queryBuilder: (query, list) {
            return list.where((item) {
              print(item.state);
              print(item.state.toLowerCase().contains(query.toLowerCase()));
              return item.state.toLowerCase().contains(query.toLowerCase());
            }).toList();
          },
          popupListItemBuilder: (item) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(item.state),
            );
          },
          selectedItemBuilder: (selectedItem, deleteSelectedItem) {
            return Container();
          },
          onItemSelected: (districtWiseModel) {
            if (districtWiseModel != null) {
              Navigator.pushNamed(context, '/extract', arguments: {
                "districtWise": districtWiseModel,
              });
            }
          },
        );
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
      ) =>Container(),
    );
  }
}