import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P3HI-HMV-001/HGHMV001var.dart';

//-------------------------------------------------
String server = GLOserver;
String serverAUTO = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHGHMV001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HGHMV001geteachITEM extends TRICKER_Event {}

class TRICKER_HGHMV001geteachGRAPH extends TRICKER_Event {}

class TRICKER_HGHMV001confirmdata extends TRICKER_Event {}

class TRICKER_HGHMV001confirmdata1 extends TRICKER_Event {}

class TRICKER_HGHMV001confirmdata2 extends TRICKER_Event {}

class TRICKER_HGHMV001confirmdata3 extends TRICKER_Event {}

class TRICKER_HGHMV001CLEAR extends TRICKER_Event {}

class TRICKER_HGHMV001RESETVALUE extends TRICKER_Event {}

class TRICKER_HGHMV001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HGHMV001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HGHMV001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HGHMV001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHGHMV001>((event, emit) {
      return _TRICKER_GETINtoHGHMV001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HGHMV001geteachITEM>((event, emit) {
      return _TRICKER_HGHMV001geteachITEM('', emit);
    });

    on<TRICKER_HGHMV001geteachGRAPH>((event, emit) {
      return _TRICKER_HGHMV001geteachGRAPH('', emit);
    });

    on<TRICKER_HGHMV001confirmdata>((event, emit) {
      return _TRICKER_HGHMV001confirmdata('', emit);
    });

    on<TRICKER_HGHMV001confirmdata1>((event, emit) {
      return _TRICKER_HGHMV001confirmdata1('', emit);
    });

    on<TRICKER_HGHMV001confirmdata2>((event, emit) {
      return _TRICKER_HGHMV001confirmdata2('', emit);
    });

    on<TRICKER_HGHMV001confirmdata3>((event, emit) {
      return _TRICKER_HGHMV001confirmdata3('', emit);
    });

    on<TRICKER_HGHMV001CLEAR>((event, emit) {
      return _TRICKER_HGHMV001CLEAR('', emit);
    });

    on<TRICKER_HGHMV001RESETVALUE>((event, emit) {
      return _TRICKER_HGHMV001RESETVALUE('', emit);
    });

    on<TRICKER_HGHMV001SETZERO>((event, emit) {
      return _TRICKER_HGHMV001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HGHMV001FINISH>((event, emit) {
      return _TRICKER_HGHMV001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHGHMV001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGHMV001',
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

  Future<void> _TRICKER_HGHMV001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV001-geteachITEM',
      data: {
        "ITEMs": HGHMV001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV001-geteachGRAPH',
      data: {
        "GAPname": HGHMV001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV001confirmdata1(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.20.30.46:1880/' + 'hardness202',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV001confirmdata2(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.20.30.46:1880/' + 'Compound202',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV001confirmdata3(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.20.30.46:1880/' + 'PR202',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HGHMV001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HGHMV001FINISH

  Future<void> _TRICKER_HGHMV001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HGHMV001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
