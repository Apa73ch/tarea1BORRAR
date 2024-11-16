class User {
  final String name;
  final String role;
  final String imageUrl;
  final List<String> skills;
  final List<String> socialMedia;
  final int projects;
  final double followers;
  final double rating;

  User({
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.skills,
    required this.socialMedia,
    required this.projects,
    required this.followers,
    required this.rating,
  });
}
