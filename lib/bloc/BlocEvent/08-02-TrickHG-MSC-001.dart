import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P8HG-MSC-001/HGMSC001main.dart';
import '../../page/P8HG-MSC-001/HGMSC001var.dart';
import '08-01-HGMSC001.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHGMSC001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HGMSC001geteachITEM extends TRICKER_Event {}

class TRICKER_HGMSC001geteachGRAPH extends TRICKER_Event {}

class TRICKER_HGMSC001confirmdata extends TRICKER_Event {}

class TRICKER_HGMSC001CLEAR extends TRICKER_Event {}

class TRICKER_HGMSC001RESETVALUE extends TRICKER_Event {}

class TRICKER_HGMSC001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HGMSC001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HGMSC001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HGMSC001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHGMSC001>((event, emit) {
      return _TRICKER_GETINtoHGMSC001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HGMSC001geteachITEM>((event, emit) {
      return _TRICKER_HGMSC001geteachITEM('', emit);
    });

    on<TRICKER_HGMSC001confirmdata>((event, emit) {
      return _TRICKER_HGMSC001confirmdata('', emit);
    });

    on<TRICKER_HGMSC001CLEAR>((event, emit) {
      return _TRICKER_HGMSC001CLEAR('', emit);
    });

    on<TRICKER_HGMSC001RESETVALUE>((event, emit) {
      return _TRICKER_HGMSC001RESETVALUE('', emit);
    });

    on<TRICKER_HGMSC001SETZERO>((event, emit) {
      return _TRICKER_HGMSC001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HGMSC001FINISH>((event, emit) {
      return _TRICKER_HGMSC001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHGMSC001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGMSC001',
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
    MICROSCOPEHGMSC001_CONTEXT.read<HGMSC001_Bloc>().add(HGMSC001_READ());
    emit(output);
  }

  Future<void> _TRICKER_HGMSC001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGMSC001-geteachITEM',
      data: {
        "ITEMs": HGMSC001var.ItemPickSELECT,
      },
    );
    MICROSCOPEHGMSC001_CONTEXT.read<HGMSC001_Bloc>().add(HGMSC001_READ());
    emit('');
  }

  Future<void> _TRICKER_HGMSC001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGMSC001-confirmdata',
      data: {},
    );
    MICROSCOPEHGMSC001_CONTEXT.read<HGMSC001_Bloc>().add(HGMSC001_READ());
    emit('');
  }

  Future<void> _TRICKER_HGMSC001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGMSC001-CLEAR',
      data: {},
    );
    MICROSCOPEHGMSC001_CONTEXT.read<HGMSC001_Bloc>().add(HGMSC001_READ());
    emit('');
  }

  Future<void> _TRICKER_HGMSC001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGMSC001-RESETVALUE',
      data: {},
    );
    MICROSCOPEHGMSC001_CONTEXT.read<HGMSC001_Bloc>().add(HGMSC001_READ());
    emit('');
  }

  Future<void> _TRICKER_HGMSC001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGMSC001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HGMSC001FINISH

  Future<void> _TRICKER_HGMSC001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGMSC001-FINISH-IMG',
      data: {
        "IMG01": HGMSC001var.base64pic01,
        "IMG02": HGMSC001var.base64pic02,
        "IMG03": HGMSC001var.base64pic03,
        "IMG04": HGMSC001var.base64pic04,
        "IMG01data": HGMSC001var.base64pic01data,
        "IMG02data": HGMSC001var.base64pic02data,
        "IMG03data": HGMSC001var.base64pic03data,
        "IMG04data": HGMSC001var.base64pic04data,
      },
    );
    if (response.statusCode == 200) {
      MICROSCOPEHGMSC001_CONTEXT.read<HGMSC001_Bloc>().add(HGMSC001_READ());
    }

    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    MICROSCOPEHGMSC001_CONTEXT.read<HGMSC001_Bloc>().add(HGMSC001_READ());
    emit('');
  }
}
