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

  ClubModel({required this.title, required this.description, required this.phone, String? id})
      : id = id ?? const Uuid().v4();

  ClubModel copyWith({String? title, String? description, String? phone}) {
    return ClubModel(
      title: title ?? this.title,
      description: description ?? this.description,
      phone: phone ?? this.phone,
      id: id,
    );
  }
}

