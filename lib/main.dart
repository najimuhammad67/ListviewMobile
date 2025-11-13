import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class Mahasiswa {
  final String nama;
  final String nim;
  final String jurusan;
  final String fotoUrl; 
  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.jurusan,
    this.fotoUrl = '',
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DaftarMahasiswaPage(),
    );
  }
}

class DaftarMahasiswaPage extends StatefulWidget {
  const DaftarMahasiswaPage({super.key});

  @override
  State<DaftarMahasiswaPage> createState() => _DaftarMahasiswaPageState();
}

class _DaftarMahasiswaPageState extends State<DaftarMahasiswaPage> {

  final List<Mahasiswa> listMahasiswa = [
    Mahasiswa(
      nama: "Andi Saputra",
      nim: "2023001",
      jurusan: "Teknik Informatika",
    ),
    Mahasiswa(
      nama: "Budi Santoso",
      nim: "2023002",
      jurusan: "Sistem Informasi",
    ),
    Mahasiswa(
      nama: "Citra Lestari",
      nim: "2023003",
      jurusan: "Teknik Komputer",
    ),
    Mahasiswa(
      nama: "Dewi Anggraini",
      nim: "2023004",
      jurusan: "Manajemen Informatika",
    ),
    Mahasiswa(
      nama: "Eko Prasetyo",
      nim: "2023005",
      jurusan: "Teknik Informatika",
    ),
    Mahasiswa(
      nama: "Fajar Nugraha",
      nim: "2023006",
      jurusan: "Sistem Informasi",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Mahasiswa"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
     
      body: ListView.builder(
        itemCount: listMahasiswa.length,
        itemBuilder: (context, index) {
          final mahasiswa = listMahasiswa[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  mahasiswa.nama[0], 
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              
              title: Text(
                mahasiswa.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NIM: ${mahasiswa.nim}"),
                  Text(
                    mahasiswa.jurusan,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
             
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Anda memilih: ${mahasiswa.nama}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
