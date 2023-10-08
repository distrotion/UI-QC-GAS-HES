import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/11-01-ReportCSV.dart';
import '../model/model.dart';
import 'P11INDreport/INDreportMAIN.dart';

class Page11 extends StatelessWidget {
  const Page11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page11BlocTableBody();
  }
}

class Page11BlocTableBody extends StatelessWidget {
  const Page11BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ReportCSV_Bloc(),
        child: BlocBuilder<ReportCSV_Bloc, dataoutCSV>(
          builder: (context, dataACT) {
            return Page11Body(
              dataACT: dataACT,
            );
          },
        ));
  }
}

class Page11Body extends StatelessWidget {
  Page11Body({Key? key, this.dataACT}) : super(key: key);

  dataoutCSV? dataACT;

  @override
  Widget build(BuildContext context) {
    return CsvPicker(
      dataACT: dataACT,
    );
  }
}
