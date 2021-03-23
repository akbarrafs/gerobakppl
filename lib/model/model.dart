// import 'dart:collection';

// import 'package:flutter/material.dart';
// import 'package:gerobak_flutter/screen/login/login_view.dart';

// import 'package:gerobak_flutter/screen/register/register_view.dart';
// import 'package:gerobak_flutter/theme/color.dart';

// abstract class RegisterModel extends State<RegisterBody> {
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   TextEditingController namaLengkap = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController nomorTelpepon = TextEditingController();
//   TextEditingController selectedRole = TextEditingController();
//   TextEditingController kataSandi = TextEditingController();
//   TextEditingController konfirmasiSandi = TextEditingController();

//   bool secureText = true;
//   bool checkBox = false;

//   List<String> role = [
//     "Penjual",
//     "Pembeli",
//   ];

//   static Map<String, String> user = new Map<String, String>();

//   void addUser(String email, String pass) {
//     user.putIfAbsent(email, () => pass);
//   }

//   bool checkUser(String key) {
//     for (String mail in user.keys) {
//       if (mail == key) {
//         return true;
//       }
//     }
//     return false;
//   }

//   bool getPass(String key, String pass) {
//     if (user[key] == pass) {
//       return false;
//     }
//     return true;
//   }

//   String cekaja() {
//     return user.keys.toString();
//   }

//   InputDecoration passwordStyle() {
//     return InputDecoration(
//         suffixIcon: IconButton(
//           color: Colors.grey,
//           icon: Icon(secureText ? Icons.visibility_off : Icons.visibility),
//           onPressed: () {
//             setState(() {
//               secureText = !secureText;
//             });
//           },
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: black),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: black),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: black),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0));
//   }
// }

// abstract class LoginModel extends State<LoginBody> {
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   TextEditingController email = TextEditingController();
//   TextEditingController kataSandi = TextEditingController();

//   bool secureText = true;
//   bool checkBox = false;

//   HashMap<String, String> user = RegisterModel.user;

//   void addUser(String email, String pass) {
//     user.putIfAbsent(email, () => pass);
//   }

//   bool checkUser(String key) {
//     for (String mail in user.keys) {
//       if (mail == key) {
//         return true;
//       }
//     }
//     return false;
//   }

//   bool getPass(String key, String pass) {
//     if (user[key] == pass) {
//       return false;
//     }
//     return true;
//   }

//   String cekaja() {
//     return user.keys.toString();
//   }

//   InputDecoration passwordStyle() {
//     return InputDecoration(
//         suffixIcon: IconButton(
//           color: Colors.grey,
//           icon: Icon(secureText ? Icons.visibility_off : Icons.visibility),
//           onPressed: () {
//             setState(() {
//               secureText = !secureText;
//             });
//           },
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: black),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: black),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: black),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0));
//   }
// }

// class LoginEmailValidator {
//   static String validate(String value, String email) {
//     if (value.isEmpty) {
//       return 'Please Enter a Valid Email';
//     }
//     if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
//       return 'Not a Valid Email';
//     }
//     if (checkUser(email)) {
//       return 'Email not Registered';
//     }
//     return null;
//   }

//   static bool checkUser(String key) {
//     for (String mail in RegisterModel.user.keys) {
//       if (mail == key) {
//         return false;
//       }
//     }
//     return true;
//   }
// }

// class RegisterEmailValidator {
//   static String validate(String value, String email) {
//     if (value.isEmpty) {
//       return 'Please Enter a Valid Email';
//     }
//     if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
//       return 'Not a Valid Email';
//     }
//     if (checkUser(email)) {
//       return 'Email is Used';
//     }
//     return null;
//   }

//   static bool checkUser(String key) {
//     for (String mail in RegisterModel.user.keys) {
//       if (mail == key) {
//         return true;
//       }
//     }
//     return false;
//   }
// }

// class LoginPasswordValidator {
//   static String validate(String value, String email, String kataSandi) {
//     if (value.isEmpty) {
//       return 'Please Enter a Password';
//     }
//     if (checkUserPass(email, kataSandi)) {
//       return "Email and Password doesn't Match";
//     }
//     return null;
//   }

//   static bool checkUserPass(String email, String password) {
//     for (String mail in RegisterModel.user.keys) {
//       if (mail == email) {
//         if (RegisterModel.user[mail] == password) {
//           return false;
//         }
//       }
//     }
//     return true;
//   }
// }

// class RegisterPassValidator {
//   static String validate(String value) {
//     if (value.isEmpty) {
//       return 'Please Enter a Password';
//     }
//     return null;
//   }
// }

// class RegisterRePassValidator {
//   static String validate(
//       String value, String kataSandi, String konfirmasiSandi) {
//     if (value.isEmpty) {
//       return 'Please Enter a Password';
//     }

//     if (kataSandi != konfirmasiSandi) {
//       return "Password does not match";
//     }

//     return null;
//   }
// }

// class RoleValidator {
//   static String validate(String value) {
//     if (value == null) {
//       return "Please Select your Role";
//     }
//     return null;
//   }
// }

// class NameValidator {
//   static String validate(String value) {
//     if (value.isEmpty) {
//       return "Please Enter your Name";
//     }
//     return null;
//   }
// }

// class PhoneValidator {
//   static String validate(String value) {
//     if (value.isEmpty) {
//       return "Please Enter your Phone Number";
//     }
//     return null;
//   }
// }

// class CheckBoxValidator {
//   static String validate(bool value) {
//     if (value) {
//       return null;
//     }
//     return 'Required';
//   }
// }
