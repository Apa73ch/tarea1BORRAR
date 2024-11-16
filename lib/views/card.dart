import 'package:clase_widgets/views/likes_counter.dart';
import 'package:clase_widgets/views/skill.dart';
import 'package:clase_widgets/views/social_icon.dart';
import 'package:flutter/material.dart';

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

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 480,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.imageUrl),
              ),
              const SizedBox(height: 8),
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Text(
                user.role,
                style: TextStyle(
                  fontSize: 16,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
          const LikesCounter(likes: 0),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            alignment: WrapAlignment.center,
            children: user.skills.map((skill) => Skill(skill: skill)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: user.socialMedia
                .map((socialMedia) => SocialIcon(icon: socialMedia))
                .toList(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Contacting ${user.name}')),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.mail),
                    SizedBox(width: 4),
                    Text('Contact'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Downloading ${user.name}\' resume')),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.download),
                    SizedBox(width: 4),
                    Text('Resume'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    user.projects.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Projects',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    user.followers.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Followers',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    user.rating.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Rating',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
