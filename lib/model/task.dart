import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDelete;
  bool? isFavorite;

  Task({required this.title,
      required this.description,
      required this.id,
      required this.date,
      this.isDone,
      this.isDelete,
      this.isFavorite,
      }) {
    isDone = isDone ?? false;
    isDelete = isDelete ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copywith({
    String? title,
    String? description,
    String? id,
    String? date,
    bool? isDone,
    bool? isDelete,
    bool? isFavorite,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": this.title,
      "description": this.description,
      "id": this.id,
      "date": this.date,
      "isDone": this.isDone,
      "isDelete": this.isDelete,
      "isFavorite": this.isFavorite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
        title: json["title"] ?? " ",
        description: json["description"] ?? " ",
        id: json["id"] ?? " ",
        date: json["date"] ?? " ",
        isDone: json["isDone"],
        isDelete: json["isDelete"],
      isFavorite: json["isFavorite"],
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        id,
        date,
        isDone,
        isDelete,
        isFavorite,
      ];
}
