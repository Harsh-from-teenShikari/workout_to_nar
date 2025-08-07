class InterventionStep {
  final String id;
  final DateTime timestamp;
  final String description; // e.g. "Provide warmth", "Start bag-mask ventilation"
  final bool completed;
  final String notes;

  InterventionStep({
    required this.id,
    required this.timestamp,
    required this.description,
    this.completed = false,
    this.notes = "",
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'timestamp': timestamp.toIso8601String(),
    'description': description,
    'completed': completed,
    'notes': notes,
  };

  factory InterventionStep.fromJson(Map<String, dynamic> json) {
    return InterventionStep(
      id: json['id'],
      timestamp: DateTime.parse(json['timestamp']),
      description: json['description'],
      completed: json['completed'] ?? false,
      notes: json['notes'] ?? "",
    );
  }
}
