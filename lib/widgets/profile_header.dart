import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String nim;
  final String prodi;
  final String description;
  final String bannerAsset;
  final String profileAsset;

  const ProfileHeader({
    Key? key,
    required this.name,
    required this.nim,
    required this.prodi,
    required this.description,
    required this.bannerAsset,
    required this.profileAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final secondaryTextColor = isDark ? Colors.white70 : Colors.black87;
    final fadedTextColor = isDark ? Colors.white60 : Colors.black54;
    final borderColor = isDark
        ? Colors.white.withOpacity(0.18)
        : Colors.teal.withOpacity(0.5);
    final profileBorderColor = isDark ? Colors.tealAccent : Colors.teal;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              bannerAsset,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 160,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * 0.24,
              height: width * 0.24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: profileBorderColor, width: 3),
              ),
              child: ClipOval(
                child: Image.asset(
                  profileAsset,
                  width: width * 0.24,
                  height: width * 0.24,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: width * 0.24,
                    height: width * 0.24,
                    color: Colors.grey[300],
                    child: const Icon(Icons.person, size: 40),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'NIM: $nim',
                    style: TextStyle(color: secondaryTextColor),
                  ),
                  Text(
                    'Prodi: $prodi',
                    style: TextStyle(color: secondaryTextColor),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: fadedTextColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
