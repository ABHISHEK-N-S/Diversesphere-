import 'package:diversesphere/core/app_router.dart';
import 'package:flutter/material.dart';

class LetsStartPage extends StatelessWidget {
  const LetsStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.shade50,
              Colors.yellow.shade50,
              Colors.blue.shade50,
              Colors.pink.shade50,
            ],
            stops: const [0.0, 0.3, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Flexible(
                flex: 6,
                child: Stack(
                  children: [
                    // Floating decorative elements
                    Positioned(
                      top: 20,
                      left: 60,
                      child: _buildFloatingIcon(
                        Icons.timer_outlined,
                        Colors.grey.shade400,
                        40,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 100,
                      child: _buildFloatingDot(Colors.blue.shade300, 8),
                    ),
                    Positioned(
                      top: 60,
                      right: 40,
                      child: _buildFloatingIcon(
                        Icons.calendar_today_outlined,
                        Colors.blue.shade300,
                        35,
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: 140,
                      child: _buildFloatingIcon(
                        Icons.emoji_emotions_outlined,
                        Colors.pink.shade200,
                        38,
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      left: 30,
                      child: _buildFloatingIcon(
                        Icons.attractions_outlined,
                        Colors.cyan.shade300,
                        40,
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      right: 60,
                      child: _buildFloatingIcon(
                        Icons.description_outlined,
                        Colors.grey.shade300,
                        45,
                      ),
                    ),
                    Positioned(
                      bottom: 60,
                      left: 80,
                      child: _buildFloatingIcon(
                        Icons.sports_basketball_outlined,
                        Colors.orange.shade300,
                        38,
                      ),
                    ),
                    Positioned(
                      bottom: 150,
                      right: 40,
                      child: _buildFloatingDot(Colors.pink.shade200, 10),
                    ),
                    Positioned(
                      bottom: 80,
                      right: 25,
                      child: _buildFloatingDot(Colors.yellow.shade400, 12),
                    ),
                    
                    // Central illustration
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.width * 0.6,
                        constraints: const BoxConstraints(
                          maxWidth: 250,
                          maxHeight: 250,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          'https://img.freepik.com/free-photo/3d-render-little-boy-sitting-with-laptop_1048-5857.jpg',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.child_care,
                                    size: 80,
                                    color: Colors.orange.shade300,
                                  ),
                                  const SizedBox(height: 15),
                                  const Icon(
                                    Icons.laptop_chromebook,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Task Management &',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'To-Do List',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'This productive tool is designed to help',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'you better manage your task',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'project-wise conveniently!',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () =>
                                Navigator.pushReplacementNamed(context, AppRouter.home),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6C3FF5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Let's Start",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingIcon(IconData icon, Color color, double size) {
    return Container(
      padding: EdgeInsets.all(size * 0.2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: size * 0.6,
        color: color,
      ),
    );
  }

  Widget _buildFloatingDot(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.6),
        shape: BoxShape.circle,
      ),
    );
  }
}