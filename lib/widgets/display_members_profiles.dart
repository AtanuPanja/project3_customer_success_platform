import 'package:flutter/material.dart';

import '../utils/images.dart';

// show circles with avatar images, according to the number of members
// showing project name with the number of project members
// 0 members: No members
// 1 member: 1 profile is shown
// 2 members: 2 profiles are shown
// 3 members: 3 profiles are shown
// > 3 members: 3 profiles, alongwith a plus and total members - 3
class DisplayMembersProfiles extends StatelessWidget {
  final int members;
  final double screenWidth;

  const DisplayMembersProfiles({
    super.key,
    required this.members,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return switch (members) {
      0 => const Text('No members'),
      1 => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Image.asset(AppImages.defaultProfileAvatar),
            onTap: () {},
          ),
        ),
      2 => Container(
          width: screenWidth / 3,
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Stack(
            children: [
              Positioned(
                left: 20.0,
                child: InkWell(
                  child: Image.asset(AppImages.defaultProfileAvatar),
                  onTap: () {},
                ),
              ),
              Positioned(
                child: InkWell(
                  child: Image.asset(AppImages.defaultProfileAvatar),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      3 => Container(
          width: screenWidth / 3,
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Stack(
            children: [
              Positioned(
                left: 50,
                child: InkWell(
                  child: Image.asset(AppImages.defaultProfileAvatar),
                  onTap: () {},
                ),
              ),
              Positioned(
                left: 25.0,
                child: InkWell(
                  child: Image.asset(AppImages.defaultProfileAvatar),
                  onTap: () {},
                ),
              ),
              Positioned(
                child: InkWell(
                  child: Image.asset(AppImages.defaultProfileAvatar),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      _ => Container(
          width: screenWidth / 3,
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Stack(
            children: [
              Positioned(
                left: 40,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 35.0,
                    right: 5.0,
                    top: 6.0,
                    bottom: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    '+ ${members - 3}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                child: InkWell(
                  child: Image.asset(AppImages.defaultProfileAvatar),
                  onTap: () {},
                ),
              ),
              Positioned(
                left: 20.0,
                child: InkWell(
                  child: Image.asset(AppImages.defaultProfileAvatar),
                  onTap: () {},
                ),
              ),
              Positioned(
                child: InkWell(
                  child: Image.asset(AppImages.defaultProfileAvatar),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
    };
  }
}
