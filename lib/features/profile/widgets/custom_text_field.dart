import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // LABEL JUDUL (Merah Gelap)
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600, // Semibold
            fontSize: 12,
            color: Color(0xFF991B1C),
          ),
        ),
        const SizedBox(height: 8), // Jarak antara Label dan Form

        // FORM INPUT
        Container(
          width: 378,
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 7), // Margin dalam form
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color(0xFFD3D3D3), // Stroke D3D3D3
              width: 1.0,
            ),
          ),
          child: TextField(
            keyboardType: keyboardType,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600, // Semibold (sesuai request)
                fontSize: 10,
                color: Color(0xFFA0A0A0),
              ),
              border: InputBorder.none, // Hilangkan border bawaan TextField
              isDense: true, // Agar text vertikal center pas di height 42
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}