import 'package:flutter/material.dart';
import 'verify_otp_page.dart'; // ✅ TAMBAHAN (NAVIGASI KE OTP)

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // ✅ TAMBAHAN (ANTI NAIK SAAT KEYBOARD)
      body: SingleChildScrollView(      // ✅ TAMBAHAN
        child: SizedBox(                // ✅ TAMBAHAN
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // BACKGROUND
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
        color: Colors.white, // FFFFFF
        shape: BoxShape.circle,

        // ✅ STROKE INSIDE
        border: Border.all(
          color: Colors.black, // 000000
          width: 1,
        ),

        // ✅ DROP SHADOW
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Icon(
        Icons.arrow_back,
        size: 20,
        color: Colors.black,
      ),
    ),
  ),
),


                    // ICON GEMBOK
                    const SizedBox(height: 32),
                    Center(
                      child: Image.asset(
                        'assets/images/login/forgot_password1.png',
                        width: 114,
                        height: 114,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // TEXT
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Forgot password',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Color(0xFFFA0209),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Please enter your email address',
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

                    // JARAK KE CONTAINER
                    const SizedBox(height: 80),

                    // ================= CARD =================
                    Center(
                      child: Container(
                        width: 347,
                        height: 231,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(21),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.25),
                            width: 1,
                          ),
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
                            // EMAIL SECTION
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Email Address',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Color(0xFF991B1C),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    width: 314,
                                    height: 42,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF2F2F2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.email_outlined,
                                          size: 19,
                                          color: Color(0xFFA0A0A0),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'email@gmail.com',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                                color: Color(0xFFA0A0A0),
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

                            // BUTTON SUBMIT (DITAMBAH LOGIC SAJA)
                            const SizedBox(height: 26),
                            SizedBox(
                              width: 262,
                              height: 36,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xFFFA0007),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const VerifyOtpPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
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
}
