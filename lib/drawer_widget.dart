import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Add this import

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // User Profile Header
          Container(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            color: Colors.white,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/bby.png',
                  width: 30,
                  height: 24,
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Adeyemi Timon',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Student ID: 2021/CS/001',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.edit_outlined, size: 20, color: Colors.grey[600]),
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                _buildMenuItem(Icons.dashboard_outlined, 'Dashboard'),
                _buildMenuItem(Icons.description_outlined, 'My Reports'),
                _buildMenuItem(Icons.school_outlined, 'Learning Hub'),
                _buildMenuItem(Icons.people_outline, 'Peer Support'),
                _buildMenuItem(Icons.settings_outlined, 'My Preferences'),

                SizedBox(height: 20),

                // MY CASES Section
                Row(
                  children: [
                    Text(
                      'MY CASES',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                        letterSpacing: 0.5,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.info_outline, size: 16, color: Colors.grey[400]),
                  ],
                ),

                SizedBox(height: 10),

                _buildCaseItem(Colors.green, 'Ongoing Reports'),
                _buildCaseItem(Colors.orange, 'Matching Folders'),
                _buildCaseItem(Colors.grey, 'Closed Cases'),
                _buildCaseItem(Colors.grey, 'Pending Cases'),
              ],
            ),
          ),

          // Bottom Action
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Elliptical background
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.all(Radius.elliptical(30, 20)),
                      ),
                    ),
                    // Icon container
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/light-bulb.svg',
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            Colors.green[700]!,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Have Something to Say?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'No updates yet. Want to share\na thought or speak up\nanonymously?',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Submit a Note',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[600], size: 20),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        dense: true,
        onTap: () {
          // Handle navigation here
        },
      ),
    );
  }

  Widget _buildCaseItem(Color color, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}