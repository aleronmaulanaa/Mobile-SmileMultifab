import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseBackgroundScaffold extends StatelessWidget {

  final Widget child;
  
  final bool isOnline;

  const BaseBackgroundScaffold({
    super.key,
    required this.child,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {

    final String statusText = isOnline ? "Online" : "Offline";
    
    final Color statusCircleColor =
        isOnline ? const Color(0xFF74FF46) : const Color(0xFFFF4646);
        
    final Color statusTextColor =
        isOnline ? const Color(0xFF65D340) : const Color(0xFFD34040);

    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox.expand(
      child: Stack(
        children: [

          ClipPath(
            clipper: _HeaderCurveClipper(),
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.45,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFAFAFA),
                    Color(0xFFFDE5E3),
                    Color(0xFFFDCBC9),
                  ],
                  stops: [0.31, 0.55, 1.0],
                ),
              ),
            ),
          ),

          child,

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(

              color: const Color(0xFFFAFAFA), 
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Image.asset(
                        'assets/images/common/logo_smile_v2.png',
                        height: 58,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text(
                            "Smile V2",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),

                      Row(
                        children: [

                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ic_notification.svg',
                                width: 24,
                                height: 24,
                              ),
                              Positioned(
                                right: 1,
                                top: 0,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF04241),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            ],
                          ),
                          
                          const SizedBox(width: 16),

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: statusCircleColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFFDBDBDB),
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  statusText,
                                  style: TextStyle(
                                    color: statusTextColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}