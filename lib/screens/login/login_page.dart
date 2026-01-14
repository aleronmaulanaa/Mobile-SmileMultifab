import 'package:flutter/material.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // ✅ TAMBAHAN (ANTI NAIK SAAT KEYBOARD)
      body: SingleChildScrollView(     // ✅ TAMBAHAN
        child: SizedBox(               // ✅ TAMBAHAN
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/login/bg_login_page.JPEG',
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Stack(
                  children: [
                    // LOGO
                    Positioned(
                      top: 20,
                      left: 24,
                      child: Image.asset(
                        'assets/images/login/logo_smile_v2.png',
                        width: 130,
                        height: 57,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // LOGIN TEXT
                    Positioned(
                      top: 165,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: const [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Color(0xFFFA0209),
                            ),
                          ),
                          SizedBox(height: 9),
                          Text(
                            'Please Login to continue',
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

                    // LOGIN CARD
                    Align(
                      alignment: Alignment.center,
                      child: _loginCard(),
                    ),

                    // POWERED BY
                    Positioned(
                      bottom: 150,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: const [
                          Text(
                            'Powered by',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Color(0xFF97656E),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Dept. Information of Technology',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Color(0xFF97656E),
                            ),
                          ),
                        ],
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

  Widget _loginCard() {
    return Container(
      width: 346,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Email Address',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF991B1C),
            ),
          ),
          const SizedBox(height: 6),
          _inputField(
            hint: 'email@gmail.com',
            isPassword: false,
          ),

          const SizedBox(height: 14),

          const Text(
            'Password',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF991B1C),
            ),
          ),
          const SizedBox(height: 6),
          _inputField(
            hint: 'Enter your password',
            isPassword: true,
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _rememberMe = !_rememberMe;
                  });
                },
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: _rememberMe
                        ? const Color(0xFFFA0007)
                        : const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: _rememberMe
                      ? const Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Remember me',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Center(
            child: SizedBox(
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
                onPressed: () {},
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Apakah Anda lupa kata sandi? ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgotPasswordPage(),
                    ),
                  );
                },
                child: const Text(
                  'Klik disini',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: Color(0xFF1F63C7),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _inputField({
    required String hint,
    required bool isPassword,
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
          Expanded(
            child: TextField(
              obscureText: isPassword ? _obscurePassword : false,
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
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ),
          if (isPassword)
            GestureDetector(
              onTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              child: const Icon(
                Icons.visibility_off,
                size: 21,
                color: Color(0xFFA0A0A0),
              ),
            ),
        ],
      ),
    );
  }
}
