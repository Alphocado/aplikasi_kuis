import 'package:flutter/material.dart';

class Hasil extends StatelessWidget {
  // const Hasil({super.key});

  // var berhasil;
  int totalScore;
  Function resetKuis;
  Hasil(this.totalScore, this.resetKuis);

  // getter - akan mengambil text
  String get hasilText{
    String hasil = 'Anda berhasil';
    if(totalScore <= 8){
      hasil = "Anda hebat sekali";
    } else if (totalScore <= 12) {
      hasil = "Anda sedikit jahat";
    } else if (totalScore <= 16) {
      hasil = "Anda agak aneh";
    } else {
      hasil = 'Anda sangat jahat';
    }
    return hasil;
  }

  @override 
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            // 'Kamu Berhasil Menyelesailkan Kuis', 
            hasilText,
            textAlign: TextAlign.center, 
            style: TextStyle(
              fontSize: 28, 
              fontWeight: FontWeight.bold
            ),
          ),
          TextButton(
            onPressed: () {
              resetKuis();
            }, 
            child: Text('Reset'),
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}