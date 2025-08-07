import 'intervention_step.dart';

class ResuscitationSession {
  final String id;
  final DateTime startTime;
  final List<InterventionStep> steps;
  final String outcome;
  final String notes;

  ResuscitationSession({
    required this.id,
    required this.startTime,
    required this.steps,
    this.outcome = "",
    this.notes = "",
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'startTime': startTime.toIso8601String(),
    'steps': steps.map((s) => s.toJson()).toList(),
    'outcome': outcome,
    'notes': notes,
  };

  factory ResuscitationSession.fromJson(Map<String, dynamic> json) {
    return ResuscitationSession(
      id: json['id'],
      startTime: DateTime.parse(json['startTime']),
      steps: (json['steps'] as List<dynamic>)
          .map((step) => InterventionStep.fromJson(step))
          .toList(),
      outcome: json['outcome'] ?? "",
      notes: json['notes'] ?? "",
    );
  }
}
