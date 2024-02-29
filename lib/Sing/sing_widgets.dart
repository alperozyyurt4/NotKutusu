import 'package:flutter/material.dart';
import 'package:notkutusu/LoginPage/login_widgets.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/constant/text_style.dart';

final userNameController = TextEditingController();
const userNameText = 'Ad';
const userSurNameText = 'Soyad';
const userDepertmantText = 'Bölüm';
const userEmailText = 'Email';
const userPasswordText = 'Şifre';

// //*KULLANICI ADI

// class KayitKullaniciAdi extends StatefulWidget {
//   const KayitKullaniciAdi({super.key});

//   @override
//   State<KayitKullaniciAdi> createState() => _KayitKullaniciAdiState();
// }

// class _KayitKullaniciAdiState extends State<KayitKullaniciAdi>
//     with ColorsUtility, LoginWidgetsTextStyle {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         decoration: InputDecoration(
//           labelText: userNameText,
//           border: const OutlineInputBorder(),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: normalBlue, width: 2.0),
//           ),
//           prefixIcon: const Icon(Icons.person),
//         ),
//       ),
//     );
//   }
// }

//* KULLANICI SOYADI

// class KayitKullaniciSoyadi extends StatefulWidget {
//   const KayitKullaniciSoyadi({super.key});

//   @override
//   State<KayitKullaniciSoyadi> createState() => _KayitKullaniciSoyadiState();
// }

// class _KayitKullaniciSoyadiState extends State<KayitKullaniciSoyadi>
//     with ColorsUtility {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         decoration: InputDecoration(
//           labelText: userSurNameText,
//           border: const OutlineInputBorder(),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: normalBlue, width: 2.0),
//           ),
//           prefixIcon: const Icon(Icons.person),
//         ),
//       ),
//     );
//   }
// }

// //* KULLANICI OKUDUGU BÖLÜM

// class KayitKullaniciBolum extends StatefulWidget {
//   const KayitKullaniciBolum({super.key});

//   @override
//   State<KayitKullaniciBolum> createState() => _KayitKullaniciBolumState();
// }

// class _KayitKullaniciBolumState extends State<KayitKullaniciBolum>
//     with ColorsUtility {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         decoration: InputDecoration(
//           labelText: userDepertmantText,
//           border: const OutlineInputBorder(),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: normalBlue, width: 2.0),
//           ),
//           prefixIcon: const Icon(Icons.school),
//         ),
//       ),
//     );
//   }
// }

class KayitKullaniciEmail extends StatefulWidget {
  const KayitKullaniciEmail({super.key});

  @override
  State<KayitKullaniciEmail> createState() => _KayitKullaniciEmailState();
}

class _KayitKullaniciEmailState extends State<KayitKullaniciEmail>
    with ColorsUtility {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          labelText: userEmailText,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: normalBlue, width: 2.0),
          ),
          prefixIcon: const Icon(Icons.email),
        ),
      ),
    );
  }
}

class KayitKullaniciPassword extends StatefulWidget {
  const KayitKullaniciPassword({super.key});

  @override
  State<KayitKullaniciPassword> createState() => _KayitKullaniciPasswordState();
}

class _KayitKullaniciPasswordState extends State<KayitKullaniciPassword>
    with ColorsUtility {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          labelText: userPasswordText,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: normalBlue, width: 2.0),
          ),
          prefixIcon: const Icon(Icons.password),
        ),
        obscureText: true,
      ),
    );
  }
}

class KayitOlButton extends StatefulWidget {
  const KayitOlButton({super.key});

  @override
  State<KayitOlButton> createState() => _KayitOlButtonState();
}

class _KayitOlButtonState extends State<KayitOlButton>
    with ColorsUtility, LoginWidgetsTextStyle {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: appBlue,
        foregroundColor: whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 155, vertical: 15),
      ),
      child: Text('Kayıt Ol', style: loginTextStyle),
    );
  }
}
