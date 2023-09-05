import 'package:flutter/material.dart';
// import './pertanyaan.dart';
// import './jawaban.dart';
import './kuis.dart';
import './hasil.dart';
/*
// yang pertama kali dirun
void main(){
  // runApp menerima parameter widget
  runApp(const MyApp());   // MyApp harus berbentuk widget
}
*/

// singkatannya
void main() => runApp(MyApp());

// cara 1 ketik ulang
// class MyApp extends StatefullWidget

// cara 2 stful
// class aplikasi extends StatefulWidget {
//   const aplikasi({super.key});

//   @override
//   State<aplikasi> createState() => _aplikasiState();
// }

// class _aplikasiState extends State<aplikasi> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// cara cepat, tekan "stless"

// cara lain arahkan ke stateless lalu akan muncul lampu convert to statefullwidget
class MyApp extends StatefulWidget {
  // const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _soalIndex = 0;
  var totalScore = 0;

  // pertanyaan adalah sebuah list
  // lalu dia adalah map karna memakai {}
  // isinya string semua
  var pertanyaan = [
    {
      'pertanyaan': 'Tempat apa yang akan anda kunjungi?',
      'jawaban': [ 
        {'text': 'Penggunungan', 'skor': 10},
        {'text': 'Pantai', 'skor': 5},
        {'text': 'Mall', 'skor': 3},
        {'text': 'Hutan', 'skor': 1}
      ],
    },
    {
      'pertanyaan': 'Apa warna kesukaan anda?',
      'jawaban': [ 
        {'text': 'Merah', 'skor': 3},
        {'text': 'Biru', 'skor': 11 },
        {'text': 'Hijau', 'skor': 5},
        {'text': 'Hitam', 'skor': 9}
      ],
    },
    {
      'pertanyaan': 'Apa hobby anda?',
      'jawaban': [ 
        {'text': 'Sepak Bola', 'skor': 1},
        {'text': 'Basket', 'skor': 1},
        {'text': 'Berenang', 'skor': 1},
        {'text': 'Ngoding', 'skor': 1}
      ],
    }
  ];

  void resetKuis(){
    setState(() {
      _soalIndex = 0;
      totalScore = 0;
    });
  }

  void _jawaban(int score) {
    //print("Tombol sudah ditekan");
    totalScore = totalScore + score;

    // dengan setstate bisa run ulang app
    setState(() {
      _soalIndex++;
    });
    if(_soalIndex < pertanyaan.length) {
      print('Masih ada soal berikutnya!');
    } else {
      print('sudah tidak ada soal');
    }
    // ignore: avoid_print
    print(_soalIndex);
  }

  @override
  Widget build(BuildContext context) {
    // buat variable/function dibagian sebelum return

    // materialApp memberikan fungsi2 yang dibutuhkan untuk tampilan
    return MaterialApp(
      // Text('Halo, selamat datang'),

      // di Scaffold memberikan 'appBar' cek ctrl+space
      home: Scaffold(
        // appbar = navbar
        appBar: AppBar(
          title: Text('Aplikasi Kuis'),
        ),

        // widget 1 kali menampilkan 1 text
        // body: Text('Welcome'),

        // column memiliki fitur yang bisa menampilkan beberapa widget didalam body
        // tanda tanya adalah ternary
        body: _soalIndex < pertanyaan.length 
        ? Kuis(
          pertanyaan, 
          _jawaban,
          _soalIndex
        )
/*
        Column(
          // fitur children mampu menampilkan beberapa widget
          children: [
            // cara manual
            //Text(pertanyaan.elementAt(0)),
            // Text(pertanyaan[_soalIndex]),

            // ini adalah class dari file pertanyaan.dart
            Pertanyaan(pertanyaan[_soalIndex]['pertanyaan']),
            
            //titik2 menandakan kalau semua ini yang dibawah adalah widget
            ...(pertanyaan[_soalIndex]['jawaban'] as List<String>).map((jawabanText){
              return Jawaban(_jawaban, jawabanText);
            }).toList(),
  /*
            ElevatedButton(
                // jawaban 1
                onPressed: _jawaban,
                // child, widget apa yang mau diisi didalam tombol
                child: Text('Jawaban 1')),

            ElevatedButton(
                // jawaban 2
                // onPressed: () => print('Anda memilih jawaban 2'),
                onPressed: _jawaban,
                child: Text('Jawaban 2')),

            ElevatedButton(
                // jawaban 3
                onPressed: _jawaban,
                // onPressed: () {
                //   // dapat memberi beberapa code
                //   print('Anda memilih jawaban 3');
                // }, 
                child: Text('Jawaban 3')),
  */
          ],
        )
*/
        : Hasil(totalScore, resetKuis ),
      ),
    );
  }
}
/*
// MyApp awalnya class tapi diubah jadi widget berkat extends StatelessWidget
class MyApp extends StatelessWidget { 
  @override
  // context adalah variable
  Widget build(BuildContext context) { // membuat / run / compile aplikasi nanti
  //didalamnya bisa gunakan properti MaterialApp

    // dapat memberikan tampilan2 menarik
    return MaterialApp ( 
      //cara menampilkan text biasa
      home: Text('Hallo World'),
    );
  } 
}
*/
