import 'package:flutter/material.dart';

class ProfileHeaderCard extends StatelessWidget {
  final bool isOnline;
  final String imageUrl;
  final VoidCallback? onQrTap;

  const ProfileHeaderCard({
    super.key,
    required this.isOnline,
    required this.imageUrl,
    this.onQrTap,
  });

  final String qrCodeUrl =
      "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=83493";

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Container(
        width: double.infinity,
        height: 115,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 7),
              blurRadius: 7,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 21),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF87072),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(11),
                      bottomRight: Radius.circular(11),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 73,
                        height: 73,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: ClipOval(
                          child: _buildProfileImage(),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'M. Richie Sugestiana.',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '83493',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 11),
                            const Text(
                              'IT Network & Infrastruktur',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: Color(0xFF393939),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: onQrTap,
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 110,
                  height: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        width: 57,
                        height: 57,
                        child: Image.network(
                          qrCodeUrl,

                          key: ValueKey(isOnline),

                          fit: BoxFit.contain,

                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Color(0xFFFA0007),
                              ),
                            );
                          },

                          errorBuilder: (context, error, stackTrace) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                Opacity(
                                  opacity: 0.1,
                                  child: Image.asset(
                                    'assets/images/profile/qr_code.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Icon(
                                  Icons.cloud_off_rounded,
                                  size: 24,
                                  color: Colors.grey,
                                )
                              ],
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 3),
                      const Text(
                        'tap to view',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {

    if (!isOnline) {
      return Image.asset(
        'assets/images/common/default-user.jpg',
        fit: BoxFit.cover,
      );
    }

    final String cleanUrl = imageUrl.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');

    return Image.network(
      cleanUrl,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: child,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/common/default-user.jpg',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
