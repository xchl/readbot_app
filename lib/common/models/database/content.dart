import 'package:isar/isar.dart';

//TODO Content Name duplicate
@collection
class ContentT {
  Id id = Isar.autoIncrement;
  bool? isFocus;
  bool? isSeen;
  String? title;
  String? cover;
  String? link;
  String? publishTime;
  List<String>? authors;
  List<String>? tags;
  String? category;
  String? summary;
  String? summaryAlgo;
  DateTime? createTime;
  String? md5;
}
