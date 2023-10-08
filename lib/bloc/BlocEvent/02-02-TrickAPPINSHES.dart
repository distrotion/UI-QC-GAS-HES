import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

import '../../page/P2APP-INSHES/APPINSHESvar.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoAPPGASHES extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_APPGASHESgeteachITEM extends TRICKER_Event {}

class TRICKER_APPGASHESconfirmdata extends TRICKER_Event {}

class TRICKER_APPGASHESCLEAR extends TRICKER_Event {}

class TRICKER_APPGASHESRESETVALUE extends TRICKER_Event {}

class TRICKER_APPGASHESSETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_APPGASHESFINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_APPGASHES_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_APPGASHES_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoAPPGASHES>((event, emit) {
      return _TRICKER_GETINtoAPPGASHES('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_APPGASHESgeteachITEM>((event, emit) {
      return _TRICKER_APPGASHESgeteachITEM('', emit);
    });

    on<TRICKER_APPGASHESconfirmdata>((event, emit) {
      return _TRICKER_APPGASHESconfirmdata('', emit);
    });

    on<TRICKER_APPGASHESCLEAR>((event, emit) {
      return _TRICKER_APPGASHESCLEAR('', emit);
    });

    on<TRICKER_APPGASHESRESETVALUE>((event, emit) {
      return _TRICKER_APPGASHESRESETVALUE('', emit);
    });

    on<TRICKER_APPGASHESSETZERO>((event, emit) {
      return _TRICKER_APPGASHESSETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_APPGASHESFINISH>((event, emit) {
      return _TRICKER_APPGASHESFINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoAPPGASHES(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoAPPGASHES',
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

  Future<void> _TRICKER_APPGASHESgeteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPGASHES-geteachITEM',
      data: {
        "ITEMs": APPGASHESvar.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_APPGASHESconfirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPGASHES-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPGASHESCLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPGASHES-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPGASHESRESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPGASHES-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPGASHESSETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPGASHES-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_APPGASHESFINISH

  Future<void> _TRICKER_APPGASHESFINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPGASHES-FINISH-APR',
      data: {
        "APRitem": APPGASHESvar.ItemPickSELECT,
        "APRre": APPGASHESvar.APPEARANCE,
      },
    );
    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
