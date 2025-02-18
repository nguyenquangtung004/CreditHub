import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    required this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true; // ✅ Trạng thái hiển thị mật khẩu

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword; // ✅ Nếu là password thì mặc định ẩn
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
    
      controller: widget.controller,
      obscureText: _obscureText, // ✅ Thay đổi theo trạng thái
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        floatingLabelBehavior:FloatingLabelBehavior.never, // Ẩn text hiển thị lên đầu text field
        labelText: widget.label,
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        suffixIcon: widget.isPassword
            ? Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility, // ✅ Đổi icon theo trạng thái
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // ✅ Đảo trạng thái ẩn/hiện mật khẩu
                    });
                  },
                ),
              )
            : null,
      ),
    );
  }
}
