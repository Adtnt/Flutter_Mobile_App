import '../screenutil/screenutil.dart';

// Dùng để định nghĩa extension
extension SizeExtension on num {
  double get w => ScreenUtil().setWidth(this);
  double get h => ScreenUtil().setWidth(this);
  double get sp => ScreenUtil().setHeight(this);
}
