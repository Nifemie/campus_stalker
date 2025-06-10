import 'package:flutter/material.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Sidebar Container
          Container(
            width: 280, // fixed width like in the screenshot
            color: Colors.white,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileSection(),
                    const SizedBox(height: 32),
                    _buildNavigationMenu(),
                    const SizedBox(height: 32),
                    _buildMyCasesSection(),
                    const Spacer(),
                    _buildFeedbackSection(),
                  ],
                ),
              ),
            ),
          ),

          // Placeholder for main content
          Expanded(
            child: Container(
              color: Colors.grey.shade100, // optional background color
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
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'oguntimon@gmail.com',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
    Image.asset(
    'assets/images/download.jpg',
    width: 32,
    height: 32,
    ),
      ],
    );
  }

  Widget _buildNavigationMenu() {
    final menuItems = [
      {'icon': Icons.dashboard_outlined, 'title': 'Dashboard'},
      {'icon': Icons.description_outlined, 'title': 'My Reports'},
      {'icon': Icons.menu_book_outlined, 'title': 'Learning Hub'},
      {'icon': Icons.people_outline, 'title': 'Peer Support'},
      {'icon': Icons.settings_outlined, 'title': 'My Preferences'},
    ];

    return Column(
      children:
      menuItems
          .map(
            (item) => _buildMenuItem(
          icon: item['icon'] as IconData,
          title: item['title'] as String,
        ),
      )
          .toList(),
    );
  }

  Widget _buildMenuItem({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade600, size: 22),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
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
              'MY CASES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
                letterSpacing: 0.5,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4),),
              child: Icon(Icons.add, size: 14, color: Colors.grey.shade500),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildCaseItem(
          color: Colors.green,
          title: 'Ongoing Reports',
          hasMenu: true,
        ),
        const SizedBox(height: 16),
        _buildCaseItem(color: Colors.orange, title: 'Matching Folders'),
        const SizedBox(height: 16),
        _buildCaseItem(color: Colors.grey, title: 'Closed Cases'),
        const SizedBox(height: 16),
        _buildCaseItem(color: Colors.blue, title: 'Pending Cases'),
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
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (hasMenu)
          Icon(Icons.more_horiz, color: Colors.grey.shade500, size: 20),
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
          padding: const EdgeInsets.fromLTRB(24, 36, 24, 24),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              const SizedBox(height: 24), // Space for the overlapping circle
              const Text(
                'Have Something to Say?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'No updates yet. Want to share a thought or speak up anonymously?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                  height: 1.5,
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Overlapping circle with icon
        Positioned(
          top: -30, // Negative value makes it overlap the top border
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.lightbulb,
                color: Colors.green.shade600,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}// ⬇ Your other widget methods remain unchanged (no need to repeat them here)
