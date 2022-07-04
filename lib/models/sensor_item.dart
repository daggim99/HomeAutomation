import 'package:flutter/painting.dart';

// enum Importance { low, medium, high }

class SensorItem {
  final String id;
  final String name;
  // final Importance importance;
  final Color color;
  // final int quantity;
  final DateTime date;
  final bool isTrigerd;

  SensorItem({
    required this.id,
    required this.name,
    // required this.importance,
    required this.color,
    // required this.quantity,
    required this.date,
    this.isTrigerd = false,
  });

  SensorItem copyWith(
      {String? id,
      String? name,
      // Importance? importance,
      Color? color,
      // int? quantity,
      DateTime? date,
      bool? isTrigerd}) {
    return SensorItem(
      id: id ?? this.id,
      name: name ?? this.name,
      // importance: importance ?? this.importance,
      color: color ?? this.color,
      // quantity: quantity ?? this.quantity,
      date: date ?? this.date,
      isTrigerd: isTrigerd ?? this.isTrigerd,
    );
  }
}
