import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/04-01-TPGHMV002.dart';
import 'P4HG-HMV-002/HGHMV002var.dart';
import 'P4HG-HMV-002/HGMV002main.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page4BlocTableBody();
  }
}

class Page4BlocTableBody extends StatelessWidget {
  const Page4BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HGHMV002_Bloc(),
        child: BlocBuilder<HGHMV002_Bloc, HGHMV002SCHEMA>(
          builder: (context, data) {
            return Page4Body(
              data: data,
            );
          },
        ));
  }
}

class Page4Body extends StatelessWidget {
  Page4Body({Key? key, this.data}) : super(key: key);
  HGHMV002SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_HGHMV002main(
        data: data,
      ),
    );
  }
}
