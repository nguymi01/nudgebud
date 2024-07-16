import 'package:flutter/material.dart';

class NudgeObject {
  final Widget widget; // Replace dynamic with the actual type of your widget, e.g., NudgeCard
  final String type;

  NudgeObject({required this.widget, required this.type});
}
class InvitedFriend {
  final String name;
  final String status;

  InvitedFriend(this.name, this.status);
}