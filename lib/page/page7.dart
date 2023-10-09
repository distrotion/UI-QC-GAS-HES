import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/07-01-HGVHT001.dart';
import '../bloc/Cubit/Rebuild.dart';
import '../model/model.dart';
import 'P7HG-VHT-001/HGVHT001main.dart';
import 'P7HG-VHT-001/HGVHT001var.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page7BlocTableBody();
  }
}

class Page7BlocTableBody extends StatelessWidget {
  const Page7BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HGVHT001_Bloc(),
        child: BlocBuilder<HGVHT001_Bloc, HGVHT001SCHEMA>(
          builder: (context, data) {
            return Page7Body(
              data: data,
            );
          },
        ));
  }
}

class Page7Body extends StatelessWidget {
  Page7Body({Key? key, this.data}) : super(key: key);

  HGVHT001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_HGVHT001main(
        data: data,
      ),
    );
  }
}
