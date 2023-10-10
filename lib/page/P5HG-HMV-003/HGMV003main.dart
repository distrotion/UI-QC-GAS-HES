import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/05-01-TPGHMV003.dart';
import '../../bloc/BlocEvent/05-02-TrickTPGHMV003.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HGHMV003var.dart';

class MICROVICKER_HGHMV003main extends StatelessWidget {
  MICROVICKER_HGHMV003main({Key? key, this.data}) : super(key: key);
  HGHMV003SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HGHMV003_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HGHMV003_BlocBuffer extends StatelessWidget {
  _TRICKER_HGHMV003_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HGHMV003SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HGHMV003_Bloc(),
        child: BlocBuilder<TRICKER_HGHMV003_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HGHMV003body(data: data);
          },
        ));
  }
}

class ROCKWELL_HGHMV003body extends StatefulWidget {
  ROCKWELL_HGHMV003body({Key? key, this.data}) : super(key: key);
  HGHMV003SCHEMA? data;

  @override
  State<ROCKWELL_HGHMV003body> createState() => _ROCKWELL_HGHMV003bodyState();
}

class _ROCKWELL_HGHMV003bodyState extends State<ROCKWELL_HGHMV003body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<HGHMV003_Bloc>().add(HGHMV003_READ());
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
    HGHMV003var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HGHMV003var.ItemPickSELECT = '';
    context.read<TRICKER_HGHMV003_Bloc>().add(TRICKER_HGHMV003SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HGHMV003var.PO = widget.data?.PO ?? '';
        HGHMV003var.CP = widget.data?.CP ?? '';
        HGHMV003var.QTY = widget.data?.QTY ?? '';
        HGHMV003var.PROCESS = widget.data?.PROCESS ?? '';
        HGHMV003var.CUSLOT = widget.data?.CUSLOT ?? '';
        HGHMV003var.TPKLOT = widget.data?.TPKLOT ?? '';
        HGHMV003var.FG = widget.data?.FG ?? '';
        HGHMV003var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HGHMV003var.PART = widget.data?.PART ?? '';
        HGHMV003var.PARTNAME = widget.data?.PARTNAME ?? '';
        HGHMV003var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HGHMV003var.ItemPick = widget.data?.ItemPick ?? [''];
        HGHMV003var.PCS = widget.data?.PCS ?? '';
        // HGHMV003var.PCS = '10';
        HGHMV003var.PCSleft = widget.data?.PCSleft ?? '';
        // HGHMV003var.PCSleft = '10';
        HGHMV003var.POINTs = widget.data?.POINTs ?? '';
        // HGHMV003var.POINTs = '10';
        HGHMV003var.UNIT = widget.data?.UNIT ?? '';
        // HGHMV003var.UNIT = 'pcs/lots';
        HGHMV003var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HGHMV003var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HGHMV003var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HGHMV003var.GAP = widget.data?.GAP ?? '';
        HGHMV003var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HGHMV003var.preview = widget.data?.preview ?? [];
        HGHMV003var.confirmdata = widget.data?.confirmdata ?? [];
        HGHMV003var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HGHMV003var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (HGHMV003var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HGHMV003_Bloc>().add(HGHMV003_READ());
      });
      HGHMV003var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "HG-HMV-003",
      PO: HGHMV003var.PO,
      CP: HGHMV003var.CP,
      QTY: HGHMV003var.QTY,
      PROCESS: HGHMV003var.PROCESS,
      CUSLOT: HGHMV003var.CUSLOT,
      TPKLOT: HGHMV003var.TPKLOT,
      FG: HGHMV003var.FG,
      CUSTOMER: HGHMV003var.CUSTOMER,
      PART: HGHMV003var.PART,
      PARTNAME: HGHMV003var.PARTNAME,
      MATERIAL: HGHMV003var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HGHMV003var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HGHMV003_Bloc>()
            .add(TRICKER_HGHMV003geteachITEM());
      },
      ItemPick: HGHMV003var.ItemPick,
      PCS: HGHMV003var.PCS,
      PCSleft: HGHMV003var.PCSleft,
      POINTs: HGHMV003var.POINTs,
      UNIT: HGHMV003var.UNIT,
      INTERSEC: HGHMV003var.INTERSEC,
      RESULTFORMAT: HGHMV003var.RESULTFORMAT,
      Ghtype: HGHMV003var.GRAPHTYPE,
      GAP: HGHMV003var.GAP,
      GAPnameList: HGHMV003var.GAPnameList,
      GAPname: HGHMV003var.GAPname,
      GAPnamePick: (v) {
        HGHMV003var.GAPname = v;
        context
            .read<TRICKER_HGHMV003_Bloc>()
            .add(TRICKER_HGHMV003geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((HGHMV003var.RESULTFORMAT == 'Graph' &&
                HGHMV003var.GAPname != '') ||
            HGHMV003var.RESULTFORMAT != 'Graph') {
          if (HGHMV003var.PCS != '' &&
              HGHMV003var.POINTs != '' &&
              HGHMV003var.ItemPickSELECT != '') {
            if (int.parse(HGHMV003var.POINTs) >
                HGHMV003var.confirmdata.length) {
              context
                  .read<TRICKER_HGHMV003_Bloc>()
                  .add(TRICKER_HGHMV003confirmdata());
            } else {
              WORNINGpop(context, "Have completed POINTs");
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        } else {
          WORNINGpop(context, "Please select GRAPH");
        }
      },
      FINISH: (v) {
        if (HGHMV003var.PCS != '' &&
            HGHMV003var.POINTs != '' &&
            HGHMV003var.ItemPickSELECT != '') {
          if (int.parse(HGHMV003var.POINTs) == HGHMV003var.confirmdata.length) {
            if (int.parse(HGHMV003var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HGHMV003_Bloc>()
                  .add(TRICKER_HGHMV003FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HGHMV003var.preview,
      confirmdata: HGHMV003var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HGHMV003_Bloc>().add(TRICKER_HGHMV003CLEAR());
      },
      BACKPAGE: (v) {
        HGHMV003var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HGHMV003var.ItemPickSELECT = '';
        context.read<TRICKER_HGHMV003_Bloc>().add(TRICKER_HGHMV003SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HGHMV003_Bloc>().add(TRICKER_HGHMV003RESETVALUE());
      },
      ITEMleftUNIT: HGHMV003var.ITEMleftUNIT,
      ITEMleftVALUE: HGHMV003var.ITEMleftVALUE,
    );
  }
}
