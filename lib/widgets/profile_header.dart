import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String nim;
  final String prodi;
  final String description;
  final String bannerAsset;
  final String profileAsset;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.nim,
    required this.prodi,
    required this.description,
    required this.bannerAsset,
    required this.profileAsset,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final secondaryTextColor = theme.colorScheme.primary.withOpacity(0.8);
    final fadedTextColor = theme.colorScheme.onSurface.withOpacity(0.6);
    // Colors for borders
    final borderColor = Colors.white.withOpacity(0.25);
    final profileBorderColor = Colors.white.withOpacity(0.7);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.18),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              bannerAsset,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 160,
                color: Colors.black,
                child: const Center(
                  child: Icon(Icons.broken_image, color: Colors.white54),
                ),
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
                border: Border.all(color: profileBorderColor, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      255,
                      35,
                      135,
                      205,
                    ).withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
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
                    color: Colors.black,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: profileBorderColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Nomor Induk Mahasiswa: $nim',
                    style: TextStyle(color: secondaryTextColor),
                  ),
                  Text(
                    'Program Studi: $prodi',
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
