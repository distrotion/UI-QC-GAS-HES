import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P3HG-HMV-001/HGHMV001var.dart';
import '../../page/P4HG-HMV-002/HGHMV002var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHGHMV002 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HGHMV002geteachITEM extends TRICKER_Event {}

class TRICKER_HGHMV002geteachGRAPH extends TRICKER_Event {}

class TRICKER_HGHMV002confirmdata extends TRICKER_Event {}

class TRICKER_HGHMV002CLEAR extends TRICKER_Event {}

class TRICKER_HGHMV002RESETVALUE extends TRICKER_Event {}

class TRICKER_HGHMV002SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HGHMV002FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HGHMV002_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HGHMV002_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHGHMV002>((event, emit) {
      return _TRICKER_GETINtoHGHMV002('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HGHMV002geteachITEM>((event, emit) {
      return _TRICKER_HGHMV002geteachITEM('', emit);
    });

    on<TRICKER_HGHMV002geteachGRAPH>((event, emit) {
      return _TRICKER_HGHMV002geteachGRAPH('', emit);
    });

    on<TRICKER_HGHMV002confirmdata>((event, emit) {
      return _TRICKER_HGHMV002confirmdata('', emit);
    });

    on<TRICKER_HGHMV002CLEAR>((event, emit) {
      return _TRICKER_HGHMV002CLEAR('', emit);
    });

    on<TRICKER_HGHMV002RESETVALUE>((event, emit) {
      return _TRICKER_HGHMV002RESETVALUE('', emit);
    });

    on<TRICKER_HGHMV002SETZERO>((event, emit) {
      return _TRICKER_HGHMV002SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HGHMV002FINISH>((event, emit) {
      return _TRICKER_HGHMV002FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHGHMV002(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGHMV002',
      data: {
        "PO": FIRSTUI.POACTIVE,
        "CP": FIRSTUI.CPACTIVE,
      },
    );
    String output = '';
    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff.toString() == 'OK') {
        output = 'OK';
      } else {
        output = 'NOK';
      }
    } else {
      //
    }
    emit(output);
  }

  Future<void> _TRICKER_HGHMV002geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV002-geteachITEM',
      data: {
        "ITEMs": HGHMV002var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV002geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV002-geteachGRAPH',
      data: {
        "GAPname": HGHMV002var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV002confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV002-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV002CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV002-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV002RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV002-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV002SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV002-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HGHMV002FINISH

  Future<void> _TRICKER_HGHMV002FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV002-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
