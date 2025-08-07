import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/resuscitation_session.dart';

class SessionStorage {
  static Future<void> saveSession(ResuscitationSession session) async {
    final prefs = await SharedPreferences.getInstance();
    final sessions = prefs.getStringList('sessions') ?? [];
    sessions.add(jsonEncode(session.toJson()));
    await prefs.setStringList('sessions', sessions);
  }

  static Future<List<ResuscitationSession>> loadSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final sessions = prefs.getStringList('sessions') ?? [];
    return sessions
        .map((jsonString) => ResuscitationSession.fromJson(
              Map<String, dynamic>.from(
                  jsonDecode(jsonString) as Map<String, dynamic>),
            ))
        .toList();
  }
}