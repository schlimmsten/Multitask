import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:multitask/internet/database/lesson_write.dart';
import 'package:xml/xml.dart' as xml;

void fetchData() async {
  var response = await http.get(Uri.parse('https://www.voenmeh.ru/templates/jd_atlanta/js/TimetableGroup46.xml'));

  if (response.statusCode == 200) {

    List<int> bodyBytes = response.bodyBytes;

    String decodedBody;

    try {
      decodedBody = decodeUtf16Le(bodyBytes);
      try {
        var document = xml.XmlDocument.parse(decodedBody);
        //saveLesson(document);
        var model = LessonWrite();
        model.saveLesson(document);
      } catch (e) {
        throw Exception("Ошибка парсинга XML: $e");
      }
    } catch (e) {
        throw Exception("Ошибка декодирования: $e");
    }
  } else {
    throw Exception("Ошибка получения: ${response.statusCode}");
  }
}

String decodeUtf16Le(List<int> bytes) {
  // Удаляем BOM (если есть) и декодируем UTF-16 LE
  if (bytes.length >= 2 && bytes[0] == 0xFF && bytes[1] == 0xFE) {
    bytes = bytes.sublist(2);
  }
  return String.fromCharCodes(Uint16List.view(Uint8List.fromList(bytes).buffer));
}
