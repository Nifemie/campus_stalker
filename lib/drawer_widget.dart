import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
// Import the dotted_border package

// Assume your SVG assets are located in 'assets/svg_icons/'
// Make sure to add this path to your pubspec.yaml under 'flutter: assets:'
// Example:
// flutter:
//   assets:
//     - assets/svg_icons/
//     - assets/SvgPicture/ # Assuming you use this for your logout.svg etc.
//     - assets/images/     # For your bby.png

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Row(
        children: [
          // Sidebar Container
          Container(
            width: 280, // fixed width like in the screenshot
            color: Colors.white,
            child: SafeArea(
              // Wrap the Column with SingleChildScrollView
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileSection(),
                    // --- Dotted Line (Top) - RETAINED ---
                    const SizedBox(height: 20), // Space above the dotted line
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(0),
                      padding: EdgeInsets.zero,
                      dashPattern: const [6, 4],
                      strokeWidth: 2,
                      color: const Color(0xffDBDBDB), // Light grey color for the dashes
                      child: const SizedBox(
                        width: double.infinity,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 20), // Space below the dotted line
                    // --- End Dotted Line (Top) ---

                    const SizedBox(height: 32), // Existing spacing
                    _buildNavigationMenu(),

                    // --- SVG Stroke Line Insertion Start (Middle) ---
                    const SizedBox(height: 20), // Space after My Preferences
                    SvgPicture.asset(
                      'assets/SvgPicture/stroke.svg', // Your SVG path for the stroke
                      width: double.infinity, // Make it span the full width
                      height: 1, // Or adjust based on your SVG's intrinsic height if it's significant
                      // If your stroke.svg needs to be tinted, use colorFilter:
                      // colorFilter: const ColorFilter.mode(Color(0xffDBDBDB), BlendMode.srcIn),
                      fit: BoxFit.fill, // Ensures it stretches to the full width
                    ),
                    const SizedBox(height: 25), // Space before My Cases
                    // --- SVG Stroke Line Insertion End (Middle) ---

                    _buildMyCasesSection(),
                    const SizedBox(height: 82),
                    _buildFeedbackSection(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),

          // Placeholder for main content
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              child: const Center(
                child: Text(
                  'Main Content Goes Here',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white60,
          child: Image.asset(
            'assets/images/bby.png',
            width: 32,
            height: 32,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adeyemi Timon',
                style: TextStyle(
                  fontSize: 17.994,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontFamily: "RedHatDisplay",
                ),
              ),
              SizedBox(height: 2),
              Text(
                'oguntimon@gmail.com',
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.grey,
                  fontFamily: "RedHatDisplay",
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(5.746),
            border: Border.all(
              color: const Color(0xFFF1F1F1),
              width: 0.479,
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/SvgPicture/logout.svg',
            width: 21,
            height: 21,
            colorFilter: const ColorFilter.mode(Color(0xFF787486), BlendMode.srcIn),
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationMenu() {
    final menuItems = [
      {'svgPath': 'assets/SvgPicture/dash.svg', 'title': 'Dashboard'},
      {'svgPath': 'assets/SvgPicture/rep.svg', 'title': 'My Reports'},
      {'svgPath': 'assets/SvgPicture/learn.svg', 'title': 'Learning Hub'},
      {'svgPath': 'assets/SvgPicture/peer.svg', 'title': 'Peer Support'},
      {'svgPath': 'assets/SvgPicture/my.svg', 'title': 'My Preferences'},
    ];

    return Column(
      children: menuItems
          .map(
            (item) => _buildMenuItem(
          svgPath: item['svgPath'] as String,
          title: item['title'] as String,
        ),
      )
          .toList(),
    );
  }

  Widget _buildMenuItem({required String svgPath, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          SvgPicture.asset(
            svgPath,
            width: 22,
            height: 22,
            colorFilter: ColorFilter.mode(Colors.grey.shade600, BlendMode.srcIn),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: "RedHatDisplay",
              color: Color(0xFF787486),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyCasesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '🗂️ MY CASES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
                letterSpacing: 0.5,
                fontFamily: "RedHatDisplay",
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: SvgPicture.asset(
                'assets/SvgPicture/plus.svg',
                width: 21,
                height: 21,
                colorFilter: const ColorFilter.mode(Color(0xFF787486), BlendMode.srcIn),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(72, 148, 254, 0.08),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                    color: Color(0XFF7AC555),
                    shape: BoxShape.circle
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Ongoing Reports',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF0D062D),
                    fontWeight: FontWeight.bold,
                    fontFamily: "RedHatDisplay",
                  ),
                ),
              ),
              const Text(
                '...',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff0D062D),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildCaseItem(color: const Color(0XFFFFA500), title: 'Matching Folders'),
        const SizedBox(height: 16),
        _buildCaseItem(color: const Color(0XFFE4CCFD), title: 'Closed Cases'),
        const SizedBox(height: 16),
        _buildCaseItem(color: const Color(0XFF76A5EA), title: 'Pending Cases'),
      ],
    );
  }

  Widget _buildCaseItem({
    required Color color,
    required String title,
    bool hasMenu = false,
  }) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF787486),
              fontWeight: FontWeight.w500,
              fontFamily: "RedHatDisplay",
            ),
          ),
        ),
        if (hasMenu)
          Text(
            '...',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
      ],
    );
  }

  Widget _buildFeedbackSection() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Main card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0), // Light grey background to match image
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              const Text(
                'Have Something to Say?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'No updates yet. Want to share a thought or speak up anonymously?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                  height: 1.5,
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Submit a Note',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Overlapping circles with green gradient effect
        Positioned(
          top: -40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer light green circle (largest)
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF7AC555).withOpacity(0.1), // Very light green
                  shape: BoxShape.circle,
                ),
              ),
              // Middle green circle
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF7AC555).withOpacity(0.3), // Medium green
                  shape: BoxShape.circle,
                ),
              ),
              // Inner dark green circle with icon
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFF7AC555), // Solid green
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/SvgPicture/light.svg', // Your lightbulb icon
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.white, // White icon on green background
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}