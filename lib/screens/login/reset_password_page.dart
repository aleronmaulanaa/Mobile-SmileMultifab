import 'package:flutter/material.dart';
import 'login_page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/login/bg_login_page.JPEG',
                  fit: BoxFit.cover,
                ),
              ),

              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BACK BUTTON
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 12),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.arrow_back, size: 20),
                        ),
                      ),
                    ),

                    const SizedBox(height: 36),

                    // ICON
                    Center(
                      child: Image.asset(
                        'assets/images/login/reset_password.png',
                        width: 114,
                        height: 114,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // TEXT
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Reset Password',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Color(0xFFFA0209),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Please enter your new password,\nthen confirm it to make sure there are no mistakes.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Color(0xFFFA0209),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20), // ⬆️ CONTAINER DINAIKKAN

                    // ================= CARD =================
                    Center(
                      child: Container(
                        width: 347,
                        height: 311,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(21),
                          border: Border.all(color: Colors.black, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 22),

                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'New Password',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF991B1C),
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Password must be at least 8 characters.',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF991B1C),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),

                            _passwordField(
                              hint: 'Enter your password',
                              obscure: _obscureNew,
                              onToggle: () {
                                setState(() {
                                  _obscureNew = !_obscureNew;
                                });
                              },
                            ),

                            const SizedBox(height: 14),

                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Confirm New Password',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF991B1C),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),

                            _passwordField(
                              hint: 'Confirm your password',
                              obscure: _obscureConfirm,
                              onToggle: () {
                                setState(() {
                                  _obscureConfirm = !_obscureConfirm;
                                });
                              },
                            ),

                           const SizedBox(height: 40),

                            // BUTTON (NAIK KONSISTEN)
                            SizedBox(
                              width: 262,
                              height: 36,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFA0007),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  _showSuccessPopup(context);
                                },
                                child: const Text(
                                  'Confirm',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _passwordField({
    required String hint,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return Container(
      width: 314,
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const Icon(Icons.lock_outline, size: 19, color: Color(0xFFA0A0A0)),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              obscureText: obscure,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Color(0xFFA0A0A0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onToggle,
            child: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              size: 21,
              color: const Color(0xFF979797),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/login/popup_lock.png',
              width: 73,
              height: 73,
            ),
            const SizedBox(height: 16),
            const Text(
              'Password updated successfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 12),
            Image.asset(
              'assets/images/login/checklist_popup.png',
              width: 36,
              height: 36,
            ),
          ],
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    });
  }
}
