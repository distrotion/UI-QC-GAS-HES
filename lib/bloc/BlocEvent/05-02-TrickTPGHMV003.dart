import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P5HG-HMV-003/HGHMV003var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHGHMV003 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HGHMV003geteachITEM extends TRICKER_Event {}

class TRICKER_HGHMV003geteachGRAPH extends TRICKER_Event {}

class TRICKER_HGHMV003confirmdata extends TRICKER_Event {}

class TRICKER_HGHMV003CLEAR extends TRICKER_Event {}

class TRICKER_HGHMV003RESETVALUE extends TRICKER_Event {}

class TRICKER_HGHMV003SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HGHMV003FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HGHMV003_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HGHMV003_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHGHMV003>((event, emit) {
      return _TRICKER_GETINtoHGHMV003('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HGHMV003geteachITEM>((event, emit) {
      return _TRICKER_HGHMV003geteachITEM('', emit);
    });

    on<TRICKER_HGHMV003geteachGRAPH>((event, emit) {
      return _TRICKER_HGHMV003geteachGRAPH('', emit);
    });

    on<TRICKER_HGHMV003confirmdata>((event, emit) {
      return _TRICKER_HGHMV003confirmdata('', emit);
    });

    on<TRICKER_HGHMV003CLEAR>((event, emit) {
      return _TRICKER_HGHMV003CLEAR('', emit);
    });

    on<TRICKER_HGHMV003RESETVALUE>((event, emit) {
      return _TRICKER_HGHMV003RESETVALUE('', emit);
    });

    on<TRICKER_HGHMV003SETZERO>((event, emit) {
      return _TRICKER_HGHMV003SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HGHMV003FINISH>((event, emit) {
      return _TRICKER_HGHMV003FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHGHMV003(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGHMV003',
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

  Future<void> _TRICKER_HGHMV003geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV003-geteachITEM',
      data: {
        "ITEMs": HGHMV003var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV003geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV003-geteachGRAPH',
      data: {
        "GAPname": HGHMV003var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV003confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV003-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV003CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV003-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV003RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV003-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV003SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV003-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HGHMV003FINISH

  Future<void> _TRICKER_HGHMV003FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV003-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
