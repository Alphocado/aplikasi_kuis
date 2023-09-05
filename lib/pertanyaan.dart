import 'package:flutter/material.dart';

class Pertanyaan extends StatelessWidget {
  // const Pertanyaan({super.key});

  var pertanyaan;
  Pertanyaan(this.pertanyaan);

  @override
  Widget build(BuildContext context) {
    // membungkus Text didalam Container
    return Container(
      // container untuk mengambil ukuran seluruh layar hp
      width: double.infinity, // mengambil width dari ujung kiri sampai kanan
      margin: EdgeInsets.all(10),

      //
      child: Text(
        pertanyaan,
        style: TextStyle(fontSize: 20), // cara styling di flutter
        textAlign: TextAlign.center,
      ),
    );
  }
}
