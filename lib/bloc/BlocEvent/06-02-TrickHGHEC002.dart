import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P6HG-HRC-002/HGHRC002var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHGHRC002 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HGHRC002geteachITEM extends TRICKER_Event {}

class TRICKER_HGHRC002geteachGRAPH extends TRICKER_Event {}

class TRICKER_HGHRC002confirmdata extends TRICKER_Event {}

class TRICKER_HGHRC002CLEAR extends TRICKER_Event {}

class TRICKER_HGHRC002RESETVALUE extends TRICKER_Event {}

class TRICKER_HGHRC002SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HGHRC002FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HGHRC002_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HGHRC002_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHGHRC002>((event, emit) {
      return _TRICKER_GETINtoHGHRC002('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HGHRC002geteachITEM>((event, emit) {
      return _TRICKER_HGHRC002geteachITEM('', emit);
    });

    on<TRICKER_HGHRC002geteachGRAPH>((event, emit) {
      return _TRICKER_HGHRC002geteachGRAPH('', emit);
    });

    on<TRICKER_HGHRC002confirmdata>((event, emit) {
      return _TRICKER_HGHRC002confirmdata('', emit);
    });

    on<TRICKER_HGHRC002CLEAR>((event, emit) {
      return _TRICKER_HGHRC002CLEAR('', emit);
    });

    on<TRICKER_HGHRC002RESETVALUE>((event, emit) {
      return _TRICKER_HGHRC002RESETVALUE('', emit);
    });

    on<TRICKER_HGHRC002SETZERO>((event, emit) {
      return _TRICKER_HGHRC002SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HGHRC002FINISH>((event, emit) {
      return _TRICKER_HGHRC002FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHGHRC002(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGHRC002',
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

  Future<void> _TRICKER_HGHRC002geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHRC002-geteachITEM',
      data: {
        "ITEMs": HGHRC002var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HGHRC002geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHRC002-geteachGRAPH',
      data: {
        "GAPname": HGHRC002var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HGHRC002confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHRC002-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHRC002CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHRC002-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHRC002RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHRC002-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHRC002SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHRC002-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HGHRC002FINISH

  Future<void> _TRICKER_HGHRC002FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHRC002-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
