
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

//Type Id is Model Class ID for another class we have to use typeId: new
@HiveType(typeId: 0)
class NotesModel {

  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  //constructors
  NotesModel({required this.title, required this.description});

}