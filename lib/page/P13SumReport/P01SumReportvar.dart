class P01SumReportvar {
  static bool iscon01 = false;
  static String MAT = '';
  static String startDATE = '';
  static List<String> startDATElist = [];
  static dateout startDATEout = dateout();
  static String endDATE = '';
  static List<String> endDATElist = [];
  static dateout endDATEout = dateout();
}

class dateout {
  dateout({
    this.year = '',
    this.month = '',
    this.day = '',
  });

  String year;
  String month;
  String day;
}
