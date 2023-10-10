import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/06-01-HGHRC002.dart';
import '../../bloc/BlocEvent/06-02-TrickHGHEC002.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HGHRC002var.dart';

class ROCKWELL_HGHRC002main extends StatelessWidget {
  ROCKWELL_HGHRC002main({Key? key, this.data}) : super(key: key);
  HGHRC002SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HGHRC002_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HGHRC002_BlocBuffer extends StatelessWidget {
  _TRICKER_HGHRC002_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HGHRC002SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HGHRC002_Bloc(),
        child: BlocBuilder<TRICKER_HGHRC002_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HGHRC002body(data: data);
          },
        ));
  }
}

class ROCKWELL_HGHRC002body extends StatefulWidget {
  ROCKWELL_HGHRC002body({Key? key, this.data}) : super(key: key);
  HGHRC002SCHEMA? data;

  @override
  State<ROCKWELL_HGHRC002body> createState() => _ROCKWELL_HGHRC002bodyState();
}

class _ROCKWELL_HGHRC002bodyState extends State<ROCKWELL_HGHRC002body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<HGHRC002_Bloc>().add(HGHRC002_READ());
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
    HGHRC002var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HGHRC002var.ItemPickSELECT = '';
    context.read<TRICKER_HGHRC002_Bloc>().add(TRICKER_HGHRC002SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 2;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HGHRC002var.PO = widget.data?.PO ?? '';
        HGHRC002var.CP = widget.data?.CP ?? '';
        HGHRC002var.QTY = widget.data?.QTY ?? '';
        HGHRC002var.PROCESS = widget.data?.PROCESS ?? '';
        HGHRC002var.CUSLOT = widget.data?.CUSLOT ?? '';
        HGHRC002var.TPKLOT = widget.data?.TPKLOT ?? '';
        HGHRC002var.FG = widget.data?.FG ?? '';
        HGHRC002var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HGHRC002var.PART = widget.data?.PART ?? '';
        HGHRC002var.PARTNAME = widget.data?.PARTNAME ?? '';
        HGHRC002var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HGHRC002var.ItemPick = widget.data?.ItemPick ?? [''];
        HGHRC002var.PCS = widget.data?.PCS ?? '';
        // HGHRC002var.PCS = '10';
        HGHRC002var.PCSleft = widget.data?.PCSleft ?? '';
        // HGHRC002var.PCSleft = '10';
        HGHRC002var.POINTs = widget.data?.POINTs ?? '';
        // HGHRC002var.POINTs = '10';
        HGHRC002var.UNIT = widget.data?.UNIT ?? '';
        // HGHRC002var.UNIT = 'pcs/lots';
        HGHRC002var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HGHRC002var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HGHRC002var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HGHRC002var.GAP = widget.data?.GAP ?? '';
        HGHRC002var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HGHRC002var.preview = widget.data?.preview ?? [];
        HGHRC002var.confirmdata = widget.data?.confirmdata ?? [];
        HGHRC002var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HGHRC002var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (HGHRC002var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HGHRC002_Bloc>().add(HGHRC002_READ());
      });
      HGHRC002var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "HG-HRC-002",
      PO: HGHRC002var.PO,
      CP: HGHRC002var.CP,
      QTY: HGHRC002var.QTY,
      PROCESS: HGHRC002var.PROCESS,
      CUSLOT: HGHRC002var.CUSLOT,
      TPKLOT: HGHRC002var.TPKLOT,
      FG: HGHRC002var.FG,
      CUSTOMER: HGHRC002var.CUSTOMER,
      PART: HGHRC002var.PART,
      PARTNAME: HGHRC002var.PARTNAME,
      MATERIAL: HGHRC002var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HGHRC002var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HGHRC002_Bloc>()
            .add(TRICKER_HGHRC002geteachITEM());
      },
      ItemPick: HGHRC002var.ItemPick,
      PCS: HGHRC002var.PCS,
      PCSleft: HGHRC002var.PCSleft,
      POINTs: HGHRC002var.POINTs,
      UNIT: HGHRC002var.UNIT,
      INTERSEC: HGHRC002var.INTERSEC,
      RESULTFORMAT: HGHRC002var.RESULTFORMAT,
      Ghtype: HGHRC002var.GRAPHTYPE,
      GAP: HGHRC002var.GAP,
      GAPnameList: HGHRC002var.GAPnameList,
      GAPname: HGHRC002var.GAPname,
      GAPnamePick: (v) {
        HGHRC002var.GAPname = v;
        context
            .read<TRICKER_HGHRC002_Bloc>()
            .add(TRICKER_HGHRC002geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((HGHRC002var.RESULTFORMAT == 'Graph' &&
                HGHRC002var.GAPname != '') ||
            HGHRC002var.RESULTFORMAT != 'Graph') {
          if (HGHRC002var.PCS != '' &&
              HGHRC002var.POINTs != '' &&
              HGHRC002var.ItemPickSELECT != '') {
            if (int.parse(HGHRC002var.POINTs) >
                HGHRC002var.confirmdata.length) {
              context
                  .read<TRICKER_HGHRC002_Bloc>()
                  .add(TRICKER_HGHRC002confirmdata());
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
        if (HGHRC002var.PCS != '' &&
            HGHRC002var.POINTs != '' &&
            HGHRC002var.ItemPickSELECT != '') {
          if (int.parse(HGHRC002var.POINTs) == HGHRC002var.confirmdata.length) {
            if (int.parse(HGHRC002var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HGHRC002_Bloc>()
                  .add(TRICKER_HGHRC002FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HGHRC002var.preview,
      confirmdata: HGHRC002var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HGHRC002_Bloc>().add(TRICKER_HGHRC002CLEAR());
      },
      BACKPAGE: (v) {
        // HGHRC002var.DHtimer.cancel();
        // FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        // HGHRC002var.ItemPickSELECT = '';
        // context.read<TRICKER_HGHRC002_Bloc>().add(TRICKER_HGHRC002SETZERO());
        // CuPage = Page1();
        // MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
        backpage_fn();
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HGHRC002_Bloc>().add(TRICKER_HGHRC002RESETVALUE());
      },
      ITEMleftUNIT: HGHRC002var.ITEMleftUNIT,
      ITEMleftVALUE: HGHRC002var.ITEMleftVALUE,
    );
  }
}
