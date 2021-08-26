import 'package:pdm/data/models/user.dart';

class Message {
  final User? user;
  final String? lastText;
  final DateTime? time;
  final bool? muted;
  final bool? status;
  final bool? online;
  final bool? read;

  Message(
      {required this.status,
      required this.online,
      required this.read,
      required this.user,
      required this.lastText,
      required this.time,
      required this.muted});
}
