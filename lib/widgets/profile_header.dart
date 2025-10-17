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
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final secondaryTextColor = theme.colorScheme.primary.withOpacity(0.8);
    final fadedTextColor = theme.colorScheme.onSurface.withOpacity(0.6);
    final borderColor = theme.colorScheme.primary.withOpacity(0.3);
    final profileBorderColor = theme.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
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
                color: theme.colorScheme.surface,
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
                boxShadow: [
                  BoxShadow(
                    color: profileBorderColor.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
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
                    color: theme.colorScheme.surface,
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
