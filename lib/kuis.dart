import 'package:flutter/material.dart';

import './pertanyaan.dart';
import './jawaban.dart';

class Kuis extends StatelessWidget {
  // const Kuis({super.key});


  List<Map<String,Object>> pertanyaan;
  Function jawaban;
  int soalIndex;

  Kuis(
    this.pertanyaan, 
    this.jawaban, 
    this.soalIndex
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Pertanyaan(pertanyaan[soalIndex]['pertanyaan']),
        ...(pertanyaan[soalIndex]['jawaban'] as List<Map<String, Object>>).map((jawabanText){
          return Jawaban(
            () => jawaban(jawabanText['skor']), jawabanText['text'] as String);
        }).toList(),
      ],
    );
  }
}