import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/03-01-HGHMV001.dart';
import 'P3HI-HMV-001/HGHMV001main.dart';
import 'P3HI-HMV-001/HGHMV001var.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3BlocTableBody();
  }
}

class Page3BlocTableBody extends StatelessWidget {
  const Page3BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HGHMV001_Bloc(),
        child: BlocBuilder<HGHMV001_Bloc, HGHMV001SCHEMA>(
          builder: (context, data) {
            return Page3Body(
              data: data,
            );
          },
        ));
  }
}

class Page3Body extends StatelessWidget {
  Page3Body({Key? key, this.data}) : super(key: key);
  HGHMV001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_HGHMV001main(
        data: data,
      ),
    );
  }
}
