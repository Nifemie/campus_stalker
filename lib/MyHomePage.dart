import 'package:flutter/material.dart';
import 'drawer_widget.dart'; // Import the new drawer widget
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFF),

      drawer: SidebarScreen(),
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Campus Stalker Title (not inside a small container)
                  Text(
                    '🗂️ Campus Stalker',
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'RedHatDisplay',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0D1B34),
                    ),
                  ),
                  // Menu icon (Builder for Scaffold.of(context).openDrawer())
                  Builder(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: SvgPicture.asset(
                        'assets/SvgPicture/menu.svg', // Your specified path
                        width: 21,
                        height: 21,
                        color: Color(0xFF1C1D36), // Use ColorFilter instead of color

                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Info Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          // Custom Folder with Lock Icon
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/folder2.png',
                                  width: 32,
                                  height: 32,
                                ),
                                Positioned(
                                  bottom: 2,
                                  right: 2,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF98989A),
                                  height: 1.4,
                                ),
                                children: [
                                  TextSpan(text: 'This folder collect stalking related\n'),
                                  TextSpan(text: 'report to strengthen overall\n'),
                                  TextSpan(text: 'investigation'),
                                ],
                              ),
                            ),
                          ),
                          // Custom Pin Icon
                          Image.asset(
                            'assets/images/pin1.png',
                            width: 32,
                            height: 32,
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 74),

                    // Report Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(19),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF98989A),
                            blurRadius: 0.1,

                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header with status badge
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your Submitted Report',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF0D1B34),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Submitted: April 9, 2024',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF98989A),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFF41D195).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Under Review',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF41D195),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16),

                          // Report content
                          Text(
                            'There is a person in my apartment building who has been following me from my department to my house multiple times. He happened so often that I ve started to feel uneasy. Sometimes they even wait outside my hostel, just standing there. I don\'t know what their intentions are, but it\'s unsettling and has made me feel unsafe and anxious. I\'m speaking up now because this isn\'t normal, and I know I\'m not overreacting.',
                            style: TextStyle(
                              fontFamily: "Roboto Flex",
                              fontSize: 12,
                              color: Color(0xFF98989A),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    // Info Note with external bell
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Bell icon - positioned outside the card
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Image.asset(
                            'assets/images/bell.png',
                            width: 16,
                            height: 16,
                          ),
                        ),

                        SizedBox(width: 12), // Space between bell and card

                        // Green message card
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0xFFBBF7D0).withOpacity(1),
                              borderRadius: BorderRadius.circular(5.53),
                              border: Border.all(
                                color: Colors.green[200]!,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              'Only your matched report is shown here, other users remain private but help strengthen the case anonymously',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF166534),
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 100), // Space for bottom buttons
                  ],
                ),
              ),
            ),

            // Bottom Buttons
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Upload evidence action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Important: Make it transparent
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        // Shape for the border-radius and the border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.023), // Apply the border-radius
                          side: BorderSide(
                            color: Color(0xFFEDF1F3), // Apply the border color
                            width: 1.037, // Apply the border width
                          ),
                        ),
                      ).copyWith(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF1D61E7),
                              Color(0xFF72A1FF),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10.023),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Add your SvgPicture.asset here
                              SvgPicture.asset(
                                'assets/SvgPicture/upload.svg', // Your specified path
                                width: 19, // Adjust width as needed for your icon
                                height: 19, // Adjust height as needed for your icon
                                // Assuming your SVG has 'fill="white"' internally,
                                // if not, you might need colorFilter.
                                // For example, if you want it white regardless of SVG's fill:
                                // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                              SizedBox(width: 8), // Space between the icon and the text
                              Text(
                                'Upload Evidence',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF), // Text color is white
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: null, // Still disabled as per your original code
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFFFFF), // Set background to white (#FFF)
                        padding: EdgeInsets.zero, // Keep padding.zero for custom padding inside
                        // Move the side parameter outside of shape
                        side: const BorderSide(
                          color: Color(0xFFEDF1F3), // Specific border color
                          width: 1.037,             // Specific border width
                        ),
                        // Apply the exact border-radius
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.023), // Specific border-radius
                        ),
                      ),
                      child: Container( // Wrap the Row in a Container to apply padding
                        padding: const EdgeInsets.symmetric(vertical: 16), // Apply padding here
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/SvgPicture/download.svg', // Your specified path
                              width: 19,
                              height: 19,
                              colorFilter: const ColorFilter.mode(
                                Color(0xFFC0C0C0), // Use ColorFilter instead of color
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Withdraw Reports',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFC0C0C0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}