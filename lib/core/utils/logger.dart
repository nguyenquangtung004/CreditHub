import 'dart:convert';

import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(printer: SimpleLogPrinter(className));
}

class SimpleLogPrinter extends LogPrinter {
  final String className;

  SimpleLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    String data = "";
    try {
      Map jsonMapped = json.decode(json.encode(event.message));
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      data = encoder.convert(jsonMapped);
    } catch (e) {
      data = event.message;
    }
    return ['-------------$className-------------', data];
  }
}