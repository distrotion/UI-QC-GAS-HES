import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P7HG-VHT-001/HGVHT001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHGVHT001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HGVHT001geteachITEM extends TRICKER_Event {}

class TRICKER_HGVHT001geteachGRAPH extends TRICKER_Event {}

class TRICKER_HGVHT001confirmdata extends TRICKER_Event {}

class TRICKER_HGVHT001CLEAR extends TRICKER_Event {}

class TRICKER_HGVHT001RESETVALUE extends TRICKER_Event {}

class TRICKER_HGVHT001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HGVHT001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HGVHT001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HGVHT001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHGVHT001>((event, emit) {
      return _TRICKER_GETINtoHGVHT001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HGVHT001geteachITEM>((event, emit) {
      return _TRICKER_HGVHT001geteachITEM('', emit);
    });

    on<TRICKER_HGVHT001geteachGRAPH>((event, emit) {
      return _TRICKER_HGVHT001geteachGRAPH('', emit);
    });

    on<TRICKER_HGVHT001confirmdata>((event, emit) {
      return _TRICKER_HGVHT001confirmdata('', emit);
    });

    on<TRICKER_HGVHT001CLEAR>((event, emit) {
      return _TRICKER_HGVHT001CLEAR('', emit);
    });

    on<TRICKER_HGVHT001RESETVALUE>((event, emit) {
      return _TRICKER_HGVHT001RESETVALUE('', emit);
    });

    on<TRICKER_HGVHT001SETZERO>((event, emit) {
      return _TRICKER_HGVHT001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HGVHT001FINISH>((event, emit) {
      return _TRICKER_HGVHT001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHGVHT001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGVHT001',
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

  Future<void> _TRICKER_HGVHT001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGVHT001-geteachITEM',
      data: {
        "ITEMs": HGVHT001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HGVHT001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGVHT001-geteachGRAPH',
      data: {
        "GAPname": HGVHT001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HGVHT001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGVHT001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGVHT001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGVHT001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGVHT001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGVHT001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGVHT001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGVHT001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HGVHT001FINISH

  Future<void> _TRICKER_HGVHT001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGVHT001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
