import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/02-01-APPGASHES.dart';

import '../../bloc/BlocEvent/02-02-TrickAPPINSHES.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTAPR/SINGLESHOTAPRwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'APPINSHESvar.dart';

class APPEARANCE_APPGASHESmain extends StatelessWidget {
  APPEARANCE_APPGASHESmain({Key? key, this.data}) : super(key: key);
  APPGASHESSCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_APPGASHES_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_APPGASHES_BlocBuffer extends StatelessWidget {
  _TRICKER_APPGASHES_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  APPGASHESSCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_APPGASHES_Bloc(),
        child: BlocBuilder<TRICKER_APPGASHES_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_APPGASHESbody(data: data, trick: trick);
          },
        ));
  }
}

class ROCKWELL_APPGASHESbody extends StatefulWidget {
  ROCKWELL_APPGASHESbody({Key? key, this.data, this.trick}) : super(key: key);
  APPGASHESSCHEMA? data;
  String? trick;

  @override
  State<ROCKWELL_APPGASHESbody> createState() => _ROCKWELL_APPGASHESbodyState();
}

class _ROCKWELL_APPGASHESbodyState extends State<ROCKWELL_APPGASHESbody> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<APPGASHES_Bloc>().add(APPGASHES_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    APPGASHESvar.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    APPGASHESvar.ItemPickSELECT = '';
    context.read<TRICKER_APPGASHES_Bloc>().add(TRICKER_APPGASHESSETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 8;
    // print(widget.data?.UPDATE);

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        APPGASHESvar.PO = widget.data?.PO ?? '';
        APPGASHESvar.CP = widget.data?.CP ?? '';
        APPGASHESvar.QTY = widget.data?.QTY ?? '';
        APPGASHESvar.PROCESS = widget.data?.PROCESS ?? '';
        APPGASHESvar.CUSLOT = widget.data?.CUSLOT ?? '';
        APPGASHESvar.TPKLOT = widget.data?.TPKLOT ?? '';
        APPGASHESvar.FG = widget.data?.FG ?? '';
        APPGASHESvar.CUSTOMER = widget.data?.CUSTOMER ?? '';
        APPGASHESvar.PART = widget.data?.PART ?? '';
        APPGASHESvar.PARTNAME = widget.data?.PARTNAME ?? '';
        APPGASHESvar.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        APPGASHESvar.ItemPick = widget.data?.ItemPick ?? [''];
        APPGASHESvar.PCS = widget.data?.PCS ?? '';
        // APPGASHESvar.PCS = '10';
        APPGASHESvar.PCSleft = widget.data?.PCSleft ?? '';
        // APPGASHESvar.PCSleft = '10';
        APPGASHESvar.POINTs = widget.data?.POINTs ?? '';
        // APPGASHESvar.POINTs = '10';
        // if (APPGASHESvar.ItemPickSELECT != "") {
        //   //
        //   if (APPGASHESvar.POINTs == "") {
        //     //
        //     APPGASHESvar.POINTs == "0";
        //   }
        // }
        APPGASHESvar.UNIT = widget.data?.UNIT ?? '';
        // APPGASHESvar.UNIT = 'pcs/lots';
        APPGASHESvar.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        APPGASHESvar.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        APPGASHESvar.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        APPGASHESvar.GAP = widget.data?.GAP ?? '';
        //
        APPGASHESvar.preview = widget.data?.preview ?? [];
        APPGASHESvar.confirmdata = widget.data?.confirmdata ?? [];
        APPGASHESvar.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        APPGASHESvar.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        APPGASHESvar.PICs = widget.data?.Pic ?? '';

        if (APPGASHESvar.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // if (widget.trick == 'OK' &&
      //     APPGASHESvar.PCSleft != '0' &&
      //     APPGASHESvar.PCS != '' &&
      //     APPGASHESvar.PCSleft != '' &&
      //     (int.parse(APPGASHESvar.PCSleft) < int.parse(APPGASHESvar.PCS))) {
      //   widget.trick = '';
      //   context.read<TRICKER_APPGASHES_Bloc>().add(TRICKER_APPGASHESFINISH());
      // }

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<APPGASHES_Bloc>().add(APPGASHES_READ());
      });
      APPGASHESvar.DHtimer = timer;
    }
    return SINGLESHOTAPRmain(
      //------ Left
      LABEL: "APP-GASHES",
      PO: APPGASHESvar.PO,
      CP: APPGASHESvar.CP,
      QTY: APPGASHESvar.QTY,
      PROCESS: APPGASHESvar.PROCESS,
      CUSLOT: APPGASHESvar.CUSLOT,
      TPKLOT: APPGASHESvar.TPKLOT,
      FG: APPGASHESvar.FG,
      CUSTOMER: APPGASHESvar.CUSTOMER,
      PART: APPGASHESvar.PART,
      PARTNAME: APPGASHESvar.PARTNAME,
      MATERIAL: APPGASHESvar.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        APPGASHESvar.ItemPickSELECT = v;

        context
            .read<TRICKER_APPGASHES_Bloc>()
            .add(TRICKER_APPGASHESgeteachITEM());
      },
      ItemPick: APPGASHESvar.ItemPick,
      PCS: APPGASHESvar.PCS,
      PCSleft: APPGASHESvar.PCSleft,
      POINTs: APPGASHESvar.POINTs,
      UNIT: APPGASHESvar.UNIT,
      INTERSEC: APPGASHESvar.INTERSEC,
      RESULTFORMAT: APPGASHESvar.RESULTFORMAT,
      Ghtype: APPGASHESvar.GRAPHTYPE,
      //------- Bottom
      GOOD: (v) {
        if (APPGASHESvar.PCS != '') {
          APPGASHESvar.APPEARANCE = 'Good';
          if (APPGASHESvar.PCS != '' &&
              APPGASHESvar.POINTs != '' &&
              APPGASHESvar.ItemPickSELECT != '') {
            if (int.parse(APPGASHESvar.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_APPGASHES_Bloc>()
                  .add(TRICKER_APPGASHESFINISH());
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      NOGOOD: (v) {
        if (APPGASHESvar.PCS != '') {
          if (APPGASHESvar.PCS != '' &&
              APPGASHESvar.POINTs != '' &&
              APPGASHESvar.ItemPickSELECT != '') {
            if (int.parse(APPGASHESvar.PCSleft) > 0) {
              APPGASHESvar.APPEARANCE = 'no Good';
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      preview: APPGASHESvar.preview,
      confirmdata: APPGASHESvar.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_APPGASHES_Bloc>().add(TRICKER_APPGASHESCLEAR());
      },
      BACKPAGE: (v) {
        APPGASHESvar.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        APPGASHESvar.ItemPickSELECT = '';
        context.read<TRICKER_APPGASHES_Bloc>().add(TRICKER_APPGASHESSETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_APPGASHES_Bloc>()
            .add(TRICKER_APPGASHESRESETVALUE());
      },
      ITEMleftUNIT: APPGASHESvar.ITEMleftUNIT,
      ITEMleftVALUE: APPGASHESvar.ITEMleftVALUE,
      PICB64: APPGASHESvar.PICs,
    );
  }
}
