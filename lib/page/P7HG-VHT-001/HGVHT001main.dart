import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/03-01-TPGHMV001.dart';
import '../../bloc/BlocEvent/03-02-TrickTPGHMV001.dart';
import '../../bloc/BlocEvent/07-01-HGVHT001.dart';
import '../../bloc/BlocEvent/07-02-TrickHGVHT001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HGVHT001var.dart';

class MICROVICKER_HGVHT001main extends StatelessWidget {
  MICROVICKER_HGVHT001main({Key? key, this.data}) : super(key: key);
  HGVHT001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HGVHT001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HGVHT001_BlocBuffer extends StatelessWidget {
  _TRICKER_HGVHT001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HGVHT001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HGVHT001_Bloc(),
        child: BlocBuilder<TRICKER_HGVHT001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HGVHT001body(data: data);
          },
        ));
  }
}

class ROCKWELL_HGVHT001body extends StatefulWidget {
  ROCKWELL_HGVHT001body({Key? key, this.data}) : super(key: key);
  HGVHT001SCHEMA? data;

  @override
  State<ROCKWELL_HGVHT001body> createState() => _ROCKWELL_HGVHT001bodyState();
}

class _ROCKWELL_HGVHT001bodyState extends State<ROCKWELL_HGVHT001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<HGVHT001_Bloc>().add(HGVHT001_READ());
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
    HGVHT001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HGVHT001var.ItemPickSELECT = '';
    context.read<TRICKER_HGVHT001_Bloc>().add(TRICKER_HGVHT001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HGVHT001var.PO = widget.data?.PO ?? '';
        HGVHT001var.CP = widget.data?.CP ?? '';
        HGVHT001var.QTY = widget.data?.QTY ?? '';
        HGVHT001var.PROCESS = widget.data?.PROCESS ?? '';
        HGVHT001var.CUSLOT = widget.data?.CUSLOT ?? '';
        HGVHT001var.TPKLOT = widget.data?.TPKLOT ?? '';
        HGVHT001var.FG = widget.data?.FG ?? '';
        HGVHT001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HGVHT001var.PART = widget.data?.PART ?? '';
        HGVHT001var.PARTNAME = widget.data?.PARTNAME ?? '';
        HGVHT001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HGVHT001var.ItemPick = widget.data?.ItemPick ?? [''];
        HGVHT001var.PCS = widget.data?.PCS ?? '';
        // HGVHT001var.PCS = '10';
        HGVHT001var.PCSleft = widget.data?.PCSleft ?? '';
        // HGVHT001var.PCSleft = '10';
        HGVHT001var.POINTs = widget.data?.POINTs ?? '';
        // HGVHT001var.POINTs = '10';
        HGVHT001var.UNIT = widget.data?.UNIT ?? '';
        // HGVHT001var.UNIT = 'pcs/lots';
        HGVHT001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HGVHT001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HGVHT001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HGVHT001var.GAP = widget.data?.GAP ?? '';
        HGVHT001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HGVHT001var.preview = widget.data?.preview ?? [];
        HGVHT001var.confirmdata = widget.data?.confirmdata ?? [];
        HGVHT001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HGVHT001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (HGVHT001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HGVHT001_Bloc>().add(HGVHT001_READ());
      });
      HGVHT001var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "HG-VHT-001",
      PO: HGVHT001var.PO,
      CP: HGVHT001var.CP,
      QTY: HGVHT001var.QTY,
      PROCESS: HGVHT001var.PROCESS,
      CUSLOT: HGVHT001var.CUSLOT,
      TPKLOT: HGVHT001var.TPKLOT,
      FG: HGVHT001var.FG,
      CUSTOMER: HGVHT001var.CUSTOMER,
      PART: HGVHT001var.PART,
      PARTNAME: HGVHT001var.PARTNAME,
      MATERIAL: HGVHT001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HGVHT001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HGVHT001_Bloc>()
            .add(TRICKER_HGVHT001geteachITEM());
      },
      ItemPick: HGVHT001var.ItemPick,
      PCS: HGVHT001var.PCS,
      PCSleft: HGVHT001var.PCSleft,
      POINTs: HGVHT001var.POINTs,
      UNIT: HGVHT001var.UNIT,
      INTERSEC: HGVHT001var.INTERSEC,
      RESULTFORMAT: HGVHT001var.RESULTFORMAT,
      Ghtype: HGVHT001var.GRAPHTYPE,
      GAP: HGVHT001var.GAP,
      GAPnameList: HGVHT001var.GAPnameList,
      GAPname: HGVHT001var.GAPname,
      GAPnamePick: (v) {
        HGVHT001var.GAPname = v;
        context
            .read<TRICKER_HGVHT001_Bloc>()
            .add(TRICKER_HGVHT001geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((HGVHT001var.RESULTFORMAT == 'Graph' &&
                HGVHT001var.GAPname != '') ||
            HGVHT001var.RESULTFORMAT != 'Graph') {
          if (HGVHT001var.PCS != '' &&
              HGVHT001var.POINTs != '' &&
              HGVHT001var.ItemPickSELECT != '') {
            if (int.parse(HGVHT001var.POINTs) >
                HGVHT001var.confirmdata.length) {
              context
                  .read<TRICKER_HGVHT001_Bloc>()
                  .add(TRICKER_HGVHT001confirmdata());
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
        if (HGVHT001var.PCS != '' &&
            HGVHT001var.POINTs != '' &&
            HGVHT001var.ItemPickSELECT != '') {
          if (int.parse(HGVHT001var.POINTs) == HGVHT001var.confirmdata.length) {
            if (int.parse(HGVHT001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HGVHT001_Bloc>()
                  .add(TRICKER_HGVHT001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HGVHT001var.preview,
      confirmdata: HGVHT001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HGVHT001_Bloc>().add(TRICKER_HGVHT001CLEAR());
      },
      BACKPAGE: (v) {
        HGVHT001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HGVHT001var.ItemPickSELECT = '';
        context.read<TRICKER_HGVHT001_Bloc>().add(TRICKER_HGVHT001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HGVHT001_Bloc>().add(TRICKER_HGVHT001RESETVALUE());
      },
      ITEMleftUNIT: HGVHT001var.ITEMleftUNIT,
      ITEMleftVALUE: HGVHT001var.ITEMleftVALUE,
    );
  }
}
