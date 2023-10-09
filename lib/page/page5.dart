import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/05-01-TPGHMV003.dart';
import 'P5HG-HMV-003/HGHMV003var.dart';
import 'P5HG-HMV-003/HGMV003main.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5BlocTableBody();
  }
}

class Page5BlocTableBody extends StatelessWidget {
  const Page5BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HGHMV003_Bloc(),
        child: BlocBuilder<HGHMV003_Bloc, HGHMV003SCHEMA>(
          builder: (context, data) {
            return Page5Body(
              data: data,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({Key? key, this.data}) : super(key: key);
  HGHMV003SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_HGHMV003main(
        data: data,
      ),
    );
  }
}
