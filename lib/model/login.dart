class Login {
  String phonenumber;
  String otp;

  Login({required this.phonenumber, required this.otp});

  Map<String, dynamic> toJson() => {
        'phonenumber': phonenumber,
        'otp': otp,
      };
}
