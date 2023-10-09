import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/08-01-HGMSC001.dart';
import '../../bloc/BlocEvent/08-02-TrickHG-MSC-001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTIMG/SINGLESHOTIMGwidget.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/imgset.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HGMSC001var.dart';

late BuildContext MICROSCOPEHGMSC001_CONTEXT;

class MICROSCOPE_HGMSC001main extends StatelessWidget {
  MICROSCOPE_HGMSC001main({Key? key, this.data}) : super(key: key);
  HGMSC001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HGMSC001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HGMSC001_BlocBuffer extends StatelessWidget {
  _TRICKER_HGMSC001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HGMSC001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HGMSC001_Bloc(),
        child: BlocBuilder<TRICKER_HGMSC001_Bloc, String>(
          builder: (context, trick) {
            return MICROSCOPE_HGMSC001body(data: data);
          },
        ));
  }
}

class MICROSCOPE_HGMSC001body extends StatefulWidget {
  MICROSCOPE_HGMSC001body({Key? key, this.data}) : super(key: key);
  HGMSC001SCHEMA? data;

  @override
  State<MICROSCOPE_HGMSC001body> createState() =>
      _MICROSCOPE_HGMSC001bodyState();
}

class _MICROSCOPE_HGMSC001bodyState extends State<MICROSCOPE_HGMSC001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<HGMSC001_Bloc>().add(HGMSC001_READ());
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
    HGMSC001var.base64pic01 = imgw;
    HGMSC001var.base64pic02 = imgw;
    HGMSC001var.base64pic03 = imgw;
    HGMSC001var.base64pic04 = imgw;
    HGMSC001var.base64pic01data = '';
    HGMSC001var.base64pic02data = '';
    HGMSC001var.base64pic03data = '';
    HGMSC001var.base64pic04data = '';
    // HGMSC001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HGMSC001var.ItemPickSELECT = '';
    context.read<TRICKER_HGMSC001_Bloc>().add(TRICKER_HGMSC001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 6;
    // print(widget.data?.UPDATE);
    MICROSCOPEHGMSC001_CONTEXT = context;

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HGMSC001var.PO = widget.data?.PO ?? '';
        HGMSC001var.CP = widget.data?.CP ?? '';
        HGMSC001var.QTY = widget.data?.QTY ?? '';
        HGMSC001var.PROCESS = widget.data?.PROCESS ?? '';
        HGMSC001var.CUSLOT = widget.data?.CUSLOT ?? '';
        HGMSC001var.TPKLOT = widget.data?.TPKLOT ?? '';
        HGMSC001var.FG = widget.data?.FG ?? '';
        HGMSC001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HGMSC001var.PART = widget.data?.PART ?? '';
        HGMSC001var.PARTNAME = widget.data?.PARTNAME ?? '';
        HGMSC001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HGMSC001var.ItemPick = widget.data?.ItemPick ?? [''];
        HGMSC001var.PCS = widget.data?.PCS ?? '';
        // HGMSC001var.PCS = '10';
        HGMSC001var.PCSleft = widget.data?.PCSleft ?? '';
        // HGMSC001var.PCSleft = '10';
        HGMSC001var.POINTs = widget.data?.POINTs ?? '';
        // HGMSC001var.POINTs = '10';
        HGMSC001var.UNIT = widget.data?.UNIT ?? '';
        // HGMSC001var.UNIT = 'pcs/lots';
        HGMSC001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HGMSC001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HGMSC001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HGMSC001var.GAP = widget.data?.GAP ?? '';
        //
        HGMSC001var.preview = widget.data?.preview ?? [];
        HGMSC001var.confirmdata = widget.data?.confirmdata ?? [];
        HGMSC001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HGMSC001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (HGMSC001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // Timer timer = Timer(const Duration(seconds: 1), () {
      //   context.read<HGMSC001_Bloc>().add(HGMSC001_READ());
      // });
      // HGMSC001var.DHtimer = timer;
    }
    return SINGLESHOTIMGmain(
      //------ Left
      LABEL: "TPG-MCS-001",
      PO: HGMSC001var.PO,
      CP: HGMSC001var.CP,
      QTY: HGMSC001var.QTY,
      PROCESS: HGMSC001var.PROCESS,
      CUSLOT: HGMSC001var.CUSLOT,
      TPKLOT: HGMSC001var.TPKLOT,
      FG: HGMSC001var.FG,
      CUSTOMER: HGMSC001var.CUSTOMER,
      PART: HGMSC001var.PART,
      PARTNAME: HGMSC001var.PARTNAME,
      MATERIAL: HGMSC001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HGMSC001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HGMSC001_Bloc>()
            .add(TRICKER_HGMSC001geteachITEM());
        HGMSC001var.base64pic01 = imgw;
        HGMSC001var.base64pic02 = imgw;
        HGMSC001var.base64pic03 = imgw;
        HGMSC001var.base64pic04 = imgw;
        HGMSC001var.iscontrol = true;
        HGMSC001var.base64pic01data = '';
        HGMSC001var.base64pic02data = '';
        HGMSC001var.base64pic03data = '';
        HGMSC001var.base64pic04data = '';
        context.read<HGMSC001_Bloc>().add(HGMSC001_READ());
      },
      ItemPick: HGMSC001var.ItemPick,
      PCS: HGMSC001var.PCS,
      PCSleft: HGMSC001var.PCSleft,
      POINTs: HGMSC001var.POINTs,
      UNIT: HGMSC001var.UNIT,
      INTERSEC: HGMSC001var.INTERSEC,
      RESULTFORMAT: HGMSC001var.RESULTFORMAT,
      Ghtype: HGMSC001var.GRAPHTYPE,

      //------- Bottom
      ACCEPT: (v) {
        if (HGMSC001var.PCS != '' &&
            HGMSC001var.POINTs != '' &&
            HGMSC001var.ItemPickSELECT != '') {
          onLoadingFAKEintTIME(context, 3);
          if (int.parse(HGMSC001var.PCSleft) > 0) {
            context.read<TRICKER_HGMSC001_Bloc>().add(TRICKER_HGMSC001FINISH());
            Timer(const Duration(seconds: 3), () {
              context.read<HGMSC001_Bloc>().add(HGMSC001_READ());
            });
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      FINISH: (v) {},
      preview: HGMSC001var.preview,
      confirmdata: HGMSC001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {},
      BACKPAGE: (v) {
        HGMSC001var.base64pic01 = imgw;
        HGMSC001var.base64pic02 = imgw;
        HGMSC001var.base64pic03 = imgw;
        HGMSC001var.base64pic04 = imgw;
        HGMSC001var.base64pic01data = '';
        HGMSC001var.base64pic02data = '';
        HGMSC001var.base64pic03data = '';
        HGMSC001var.base64pic04data = '';
        // HGMSC001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HGMSC001var.ItemPickSELECT = '';
        context.read<TRICKER_HGMSC001_Bloc>().add(TRICKER_HGMSC001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {},
      ITEMleftUNIT: HGMSC001var.ITEMleftUNIT,
      ITEMleftVALUE: HGMSC001var.ITEMleftVALUE,
      wchild: Column(
        children: [
          FileUploadButton01(),
          FileUploadButton02(),
          FileUploadButton03(),
          FileUploadButton04(),
        ],
      ),
    );
  }
}

class FileUploadButton01 extends StatefulWidget {
  const FileUploadButton01({Key? key}) : super(key: key);

  @override
  State<FileUploadButton01> createState() => _FileUploadButton01State();
}

class _FileUploadButton01State extends State<FileUploadButton01> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: HGMSC001var.iscontrol,
            fnContr: (input) {
              setState(() {
                HGMSC001var.iscontrol = input;
              });
            },
            sValue: HGMSC001var.base64pic01data,
            returnfunc: (String s) {
              HGMSC001var.base64pic01data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: HGMSC001var.base64pic01,
          ),
          IMGbutton(
            base64pic: HGMSC001var.base64pic01,
            setimg: (img) {
              HGMSC001var.base64pic01 = img;
              context.read<HGMSC001_Bloc>().add(HGMSC001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton02 extends StatefulWidget {
  const FileUploadButton02({Key? key}) : super(key: key);

  @override
  State<FileUploadButton02> createState() => _FileUploadButton02State();
}

class _FileUploadButton02State extends State<FileUploadButton02> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: HGMSC001var.iscontrol,
            fnContr: (input) {
              setState(() {
                HGMSC001var.iscontrol = input;
              });
            },
            sValue: HGMSC001var.base64pic02data,
            returnfunc: (String s) {
              HGMSC001var.base64pic02data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: HGMSC001var.base64pic02,
          ),
          IMGbutton(
            base64pic: HGMSC001var.base64pic02,
            setimg: (img) {
              HGMSC001var.base64pic02 = img;
              context.read<HGMSC001_Bloc>().add(HGMSC001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton03 extends StatefulWidget {
  const FileUploadButton03({Key? key}) : super(key: key);

  @override
  State<FileUploadButton03> createState() => _FileUploadButton03State();
}

class _FileUploadButton03State extends State<FileUploadButton03> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: HGMSC001var.iscontrol,
            fnContr: (input) {
              setState(() {
                HGMSC001var.iscontrol = input;
              });
            },
            sValue: HGMSC001var.base64pic03data,
            returnfunc: (String s) {
              HGMSC001var.base64pic03data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: HGMSC001var.base64pic03,
          ),
          IMGbutton(
            base64pic: HGMSC001var.base64pic03,
            setimg: (img) {
              HGMSC001var.base64pic03 = img;
              context.read<HGMSC001_Bloc>().add(HGMSC001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton04 extends StatefulWidget {
  const FileUploadButton04({Key? key}) : super(key: key);

  @override
  State<FileUploadButton04> createState() => _FileUploadButton04State();
}

class _FileUploadButton04State extends State<FileUploadButton04> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: HGMSC001var.iscontrol,
            fnContr: (input) {
              setState(() {
                HGMSC001var.iscontrol = input;
              });
            },
            sValue: HGMSC001var.base64pic04data,
            returnfunc: (String s) {
              HGMSC001var.base64pic04data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: HGMSC001var.base64pic04,
          ),
          IMGbutton(
            base64pic: HGMSC001var.base64pic04,
            setimg: (img) {
              HGMSC001var.base64pic04 = img;
              context.read<HGMSC001_Bloc>().add(HGMSC001_READ());
            },
          ),
        ],
      ),
    );
  }
}
