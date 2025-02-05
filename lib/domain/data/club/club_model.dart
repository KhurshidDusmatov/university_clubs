import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'club_model.g.dart';

@HiveType(typeId: 0)
class ClubModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String phone;

  ClubModel({required this.title, required this.description, required this.phone}) : id = const Uuid().v4();
}
