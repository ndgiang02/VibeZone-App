import 'package:vibezone/core/common/enums/dialog_type.dart';
import 'package:vibezone/core/common/enums/sheet_type.dart';

abstract class PageCommand {}

class PageCommandShowToast extends PageCommand {
  String msg;

  PageCommandShowToast(this.msg);
}

class PageCommandShowError extends PageCommand {
  String msg;

  PageCommandShowError(this.msg);
}

class PageCommandShowSuccess extends PageCommand {
  String msg;

  PageCommandShowSuccess(this.msg);
}

class PageCommandShowTokenError extends PageCommand {
  PageCommandShowTokenError();
}

class PageCommandShowWarning extends PageCommand {
  PageCommandShowWarning();
}

class PageCommandShowBottomSheet extends PageCommand {
  final SheetType sheetType;
  final dynamic argument;

  PageCommandShowBottomSheet({required this.sheetType, this.argument});
}

class PageCommandNavigatorPage extends PageCommand {
  String? page;
  dynamic argument;

  PageCommandNavigatorPage({this.page, this.argument});
}

class PageCommandDialog extends PageCommand {
  final DialogType type;
  final dynamic argument;

  PageCommandDialog({required this.type, this.argument});
}

/// Using to show snackbar / toast / flushbar
class PageCommandShowAlertError extends PageCommand {
  String msg;

  PageCommandShowAlertError(this.msg);
}
