import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/06-01-HGHRC002.dart';
import 'P6HG-HRC-002/HGHRC002main.dart';
import 'P6HG-HRC-002/HGHRC002var.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page6BlocTableBody();
  }
}

class Page6BlocTableBody extends StatelessWidget {
  const Page6BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HGHRC002_Bloc(),
        child: BlocBuilder<HGHRC002_Bloc, HGHRC002SCHEMA>(
          builder: (context, data) {
            return Page6Body(
              data: data,
            );
          },
        ));
  }
}

class Page6Body extends StatelessWidget {
  Page6Body({Key? key, this.data}) : super(key: key);
  HGHRC002SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ROCKWELL_HGHRC002main(
        data: data,
      ),
    );
  }
}
