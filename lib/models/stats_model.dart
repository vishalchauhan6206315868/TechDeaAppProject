class StatsModel {
  final String services;
  final String projects;
  final String students;
  final String team;

  const StatsModel({
    required this.services,
    required this.projects,
    required this.students,
    required this.team,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      services: json['services']?.toString() ?? '25+',
      projects: json['projects']?.toString() ?? '70+',
      students: json['students']?.toString() ?? '500+',
      team: json['team']?.toString() ?? '16+',
    );
  }

  // Fallback default stats matching TechDea verified statistics
  factory StatsModel.fallback() {
    return const StatsModel(
      services: '25+',
      projects: '70+',
      students: '500+',
      team: '16+',
    );
  }
}

