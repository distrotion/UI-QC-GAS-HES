import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/03-01-HGHMV001.dart';
import '../../bloc/BlocEvent/03-02-TrickHGHMV001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W2MULTISHOT/MULTISHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HGHMV001var.dart';

class MICROVICKER_HGHMV001main extends StatelessWidget {
  MICROVICKER_HGHMV001main({Key? key, this.data}) : super(key: key);
  HGHMV001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HGHMV001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HGHMV001_BlocBuffer extends StatelessWidget {
  _TRICKER_HGHMV001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HGHMV001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HGHMV001_Bloc(),
        child: BlocBuilder<TRICKER_HGHMV001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HGHMV001body(data: data);
          },
        ));
  }
}

class ROCKWELL_HGHMV001body extends StatefulWidget {
  ROCKWELL_HGHMV001body({Key? key, this.data}) : super(key: key);
  HGHMV001SCHEMA? data;

  @override
  State<ROCKWELL_HGHMV001body> createState() => _ROCKWELL_HGHMV001bodyState();
}

class _ROCKWELL_HGHMV001bodyState extends State<ROCKWELL_HGHMV001body> {
  @override
  void initState() {
    super.initState();
    context.read<HGHMV001_Bloc>().add(HGHMV001_READ());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HGHMV001var.PO = widget.data?.PO ?? '';
        HGHMV001var.CP = widget.data?.CP ?? '';
        HGHMV001var.QTY = widget.data?.QTY ?? '';
        HGHMV001var.PROCESS = widget.data?.PROCESS ?? '';
        HGHMV001var.CUSLOT = widget.data?.CUSLOT ?? '';
        HGHMV001var.TPKLOT = widget.data?.TPKLOT ?? '';
        HGHMV001var.FG = widget.data?.FG ?? '';
        HGHMV001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HGHMV001var.PART = widget.data?.PART ?? '';
        HGHMV001var.PARTNAME = widget.data?.PARTNAME ?? '';
        HGHMV001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HGHMV001var.ItemPick = widget.data?.ItemPick ?? [''];
        HGHMV001var.PCS = widget.data?.PCS ?? '';
        // HGHMV001var.PCS = '10';
        HGHMV001var.PCSleft = widget.data?.PCSleft ?? '';
        // HGHMV001var.PCSleft = '10';
        HGHMV001var.POINTs = widget.data?.POINTs ?? '';
        // HGHMV001var.POINTs = '10';
        // if (HGHMV001var.ItemPickSELECT != "") {
        //   //
        //   if (HGHMV001var.POINTs == "") {
        //     //
        //     HGHMV001var.POINTs == "0";
        //   }
        // }
        HGHMV001var.UNIT = widget.data?.UNIT ?? '';
        // HGHMV001var.UNIT = 'pcs/lots';
        HGHMV001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HGHMV001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HGHMV001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HGHMV001var.GAP = widget.data?.GAP ?? '';
        HGHMV001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HGHMV001var.preview = widget.data?.preview ?? [];
        HGHMV001var.confirmdata = widget.data?.confirmdata ?? [];
        HGHMV001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HGHMV001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];
        //

        HGHMV001var.PICs = widget.data?.Pic ?? '';

        if (HGHMV001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HGHMV001_Bloc>().add(HGHMV001_READ());
      });
      HGHMV001var.DHtimer = timer;
    }
    return MULTISHOTmain(
      //------ Left
      LABEL: "HI-HMV-001",
      PO: HGHMV001var.PO,
      CP: HGHMV001var.CP,
      QTY: HGHMV001var.QTY,
      PROCESS: HGHMV001var.PROCESS,
      CUSLOT: HGHMV001var.CUSLOT,
      TPKLOT: HGHMV001var.TPKLOT,
      FG: HGHMV001var.FG,
      CUSTOMER: HGHMV001var.CUSTOMER,
      PART: HGHMV001var.PART,
      PARTNAME: HGHMV001var.PARTNAME,
      MATERIAL: HGHMV001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HGHMV001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HGHMV001_Bloc>()
            .add(TRICKER_HGHMV001geteachITEM());
      },
      ItemPick: HGHMV001var.ItemPick,
      PCS: HGHMV001var.PCS,
      PCSleft: HGHMV001var.PCSleft,
      POINTs: HGHMV001var.POINTs,
      UNIT: HGHMV001var.UNIT,
      INTERSEC: HGHMV001var.INTERSEC,
      RESULTFORMAT: HGHMV001var.RESULTFORMAT,
      Ghtype: HGHMV001var.GRAPHTYPE,
      GAP: HGHMV001var.GAP,
      GAPnameList: HGHMV001var.GAPnameList,
      GAPname: HGHMV001var.GAPname,
      GAPnamePick: (v) {
        HGHMV001var.GAPname = v;
        context
            .read<TRICKER_HGHMV001_Bloc>()
            .add(TRICKER_HGHMV001geteachGRAPH());
      },
      //------- Bottom
      DATA1: (v) {
        context
            .read<TRICKER_HGHMV001_Bloc>()
            .add(TRICKER_HGHMV001confirmdata1());
      },
      DATA2: (v) {
        context
            .read<TRICKER_HGHMV001_Bloc>()
            .add(TRICKER_HGHMV001confirmdata2());
      },
      DATA3: (v) {
        print("----");
        context
            .read<TRICKER_HGHMV001_Bloc>()
            .add(TRICKER_HGHMV001confirmdata3());
      },
      FINISH: (v) {
        if (HGHMV001var.PCS != '' &&
            HGHMV001var.POINTs != '' &&
            HGHMV001var.ItemPickSELECT != '') {
          if (int.parse(HGHMV001var.POINTs) == HGHMV001var.confirmdata.length) {
            if (int.parse(HGHMV001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HGHMV001_Bloc>()
                  .add(TRICKER_HGHMV001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HGHMV001var.preview,
      confirmdata: HGHMV001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HGHMV001_Bloc>().add(TRICKER_HGHMV001CLEAR());
      },
      BACKPAGE: (v) {
        HGHMV001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HGHMV001var.ItemPickSELECT = '';
        context.read<TRICKER_HGHMV001_Bloc>().add(TRICKER_HGHMV001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HGHMV001_Bloc>().add(TRICKER_HGHMV001RESETVALUE());
      },
      ITEMleftUNIT: HGHMV001var.ITEMleftUNIT,
      ITEMleftVALUE: HGHMV001var.ITEMleftVALUE,
      //
      PICB64: HGHMV001var.PICs,
    );
  }
}
