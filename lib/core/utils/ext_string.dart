 // ✅ Hàm ẩn email (vd: `ht.****@gmail.com`)
  String maskEmail(String email) {
    final parts = email.split("@");
    if (parts.length != 2) return email;
    final firstPart = parts[0];
    final maskedFirstPart =
        firstPart.length > 2 ? "${firstPart.substring(0, 2)}****" : "****";
    return "$maskedFirstPart@${parts[1]}";
  }