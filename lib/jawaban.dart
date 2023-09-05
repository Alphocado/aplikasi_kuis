import 'dart:ffi';

import 'package:flutter/material.dart';

class Jawaban extends StatelessWidget {
  
  Function handlePilih;
  String jawabanText;
  Jawaban(this.handlePilih, this.jawabanText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: 
        ElevatedButton(
          onPressed: (){
            handlePilih();
          },
          style: ElevatedButton.styleFrom(
            // memberi warna background button
            backgroundColor: Colors.blue, 
            // primary: Colors.red[100],
          ),
          
          // child, widget apa yang mau diisi didalam tombol
          child: Text(jawabanText),

        ),
    );
  }
}
