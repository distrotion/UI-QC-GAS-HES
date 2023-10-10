import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-01-TPGHMV002.dart';
import '../../bloc/BlocEvent/04-02-TrickTPGHMV002.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HGHMV002var.dart';

class MICROVICKER_HGHMV002main extends StatelessWidget {
  MICROVICKER_HGHMV002main({Key? key, this.data}) : super(key: key);
  HGHMV002SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HGHMV002_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HGHMV002_BlocBuffer extends StatelessWidget {
  _TRICKER_HGHMV002_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HGHMV002SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HGHMV002_Bloc(),
        child: BlocBuilder<TRICKER_HGHMV002_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HGHMV002body(data: data);
          },
        ));
  }
}

class ROCKWELL_HGHMV002body extends StatefulWidget {
  ROCKWELL_HGHMV002body({Key? key, this.data}) : super(key: key);
  HGHMV002SCHEMA? data;

  @override
  State<ROCKWELL_HGHMV002body> createState() => _ROCKWELL_HGHMV002bodyState();
}

class _ROCKWELL_HGHMV002bodyState extends State<ROCKWELL_HGHMV002body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<HGHMV002_Bloc>().add(HGHMV002_READ());
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
    HGHMV002var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HGHMV002var.ItemPickSELECT = '';
    context.read<TRICKER_HGHMV002_Bloc>().add(TRICKER_HGHMV002SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HGHMV002var.PO = widget.data?.PO ?? '';
        HGHMV002var.CP = widget.data?.CP ?? '';
        HGHMV002var.QTY = widget.data?.QTY ?? '';
        HGHMV002var.PROCESS = widget.data?.PROCESS ?? '';
        HGHMV002var.CUSLOT = widget.data?.CUSLOT ?? '';
        HGHMV002var.TPKLOT = widget.data?.TPKLOT ?? '';
        HGHMV002var.FG = widget.data?.FG ?? '';
        HGHMV002var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HGHMV002var.PART = widget.data?.PART ?? '';
        HGHMV002var.PARTNAME = widget.data?.PARTNAME ?? '';
        HGHMV002var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HGHMV002var.ItemPick = widget.data?.ItemPick ?? [''];
        HGHMV002var.PCS = widget.data?.PCS ?? '';
        // HGHMV002var.PCS = '10';
        HGHMV002var.PCSleft = widget.data?.PCSleft ?? '';
        // HGHMV002var.PCSleft = '10';
        HGHMV002var.POINTs = widget.data?.POINTs ?? '';
        // HGHMV002var.POINTs = '10';
        HGHMV002var.UNIT = widget.data?.UNIT ?? '';
        // HGHMV002var.UNIT = 'pcs/lots';
        HGHMV002var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HGHMV002var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HGHMV002var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HGHMV002var.GAP = widget.data?.GAP ?? '';
        HGHMV002var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HGHMV002var.preview = widget.data?.preview ?? [];
        HGHMV002var.confirmdata = widget.data?.confirmdata ?? [];
        HGHMV002var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HGHMV002var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (HGHMV002var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HGHMV002_Bloc>().add(HGHMV002_READ());
      });
      HGHMV002var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "HG-HMV-002",
      PO: HGHMV002var.PO,
      CP: HGHMV002var.CP,
      QTY: HGHMV002var.QTY,
      PROCESS: HGHMV002var.PROCESS,
      CUSLOT: HGHMV002var.CUSLOT,
      TPKLOT: HGHMV002var.TPKLOT,
      FG: HGHMV002var.FG,
      CUSTOMER: HGHMV002var.CUSTOMER,
      PART: HGHMV002var.PART,
      PARTNAME: HGHMV002var.PARTNAME,
      MATERIAL: HGHMV002var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HGHMV002var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HGHMV002_Bloc>()
            .add(TRICKER_HGHMV002geteachITEM());
      },
      ItemPick: HGHMV002var.ItemPick,
      PCS: HGHMV002var.PCS,
      PCSleft: HGHMV002var.PCSleft,
      POINTs: HGHMV002var.POINTs,
      UNIT: HGHMV002var.UNIT,
      INTERSEC: HGHMV002var.INTERSEC,
      RESULTFORMAT: HGHMV002var.RESULTFORMAT,
      Ghtype: HGHMV002var.GRAPHTYPE,
      GAP: HGHMV002var.GAP,
      GAPnameList: HGHMV002var.GAPnameList,
      GAPname: HGHMV002var.GAPname,
      GAPnamePick: (v) {
        HGHMV002var.GAPname = v;
        context
            .read<TRICKER_HGHMV002_Bloc>()
            .add(TRICKER_HGHMV002geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((HGHMV002var.RESULTFORMAT == 'Graph' &&
                HGHMV002var.GAPname != '') ||
            HGHMV002var.RESULTFORMAT != 'Graph') {
          if (HGHMV002var.PCS != '' &&
              HGHMV002var.POINTs != '' &&
              HGHMV002var.ItemPickSELECT != '') {
            if (int.parse(HGHMV002var.POINTs) >
                HGHMV002var.confirmdata.length) {
              context
                  .read<TRICKER_HGHMV002_Bloc>()
                  .add(TRICKER_HGHMV002confirmdata());
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
        if (HGHMV002var.PCS != '' &&
            HGHMV002var.POINTs != '' &&
            HGHMV002var.ItemPickSELECT != '') {
          if (int.parse(HGHMV002var.POINTs) == HGHMV002var.confirmdata.length) {
            if (int.parse(HGHMV002var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HGHMV002_Bloc>()
                  .add(TRICKER_HGHMV002FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HGHMV002var.preview,
      confirmdata: HGHMV002var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HGHMV002_Bloc>().add(TRICKER_HGHMV002CLEAR());
      },
      BACKPAGE: (v) {
        HGHMV002var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HGHMV002var.ItemPickSELECT = '';
        context.read<TRICKER_HGHMV002_Bloc>().add(TRICKER_HGHMV002SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HGHMV002_Bloc>().add(TRICKER_HGHMV002RESETVALUE());
      },
      ITEMleftUNIT: HGHMV002var.ITEMleftUNIT,
      ITEMleftVALUE: HGHMV002var.ITEMleftVALUE,
    );
  }
}
