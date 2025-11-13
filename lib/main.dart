import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// 1. MODEL DATA
// Membuat class khusus untuk merepresentasikan data.
class Daerah {
  final String nama;
  final String kode;

  const Daerah({required this.nama, required this.kode});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'Refactored ListView',
      // Menggunakan Material 3 untuk tampilan yang lebih modern
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 2),
      ),
      home: const DaerahListPage(),
    );
  }
}

class DaerahListPage extends StatelessWidget {
  const DaerahListPage({super.key});

  // Data statis dipisah di sini (seolah-olah dari database/API)
  static const List<Daerah> _dataDaerah = [
    Daerah(nama: 'Kelurahan Sukamaju', kode: 'SKM'),
    Daerah(nama: 'Kelurahan Mekarwangi', kode: 'MKW'),
    Daerah(nama: 'Kelurahan Cibadak', kode: 'CBD'),
    Daerah(nama: 'Kelurahan Babakan', kode: 'BBK'),
    Daerah(nama: 'Kelurahan Ciherang', kode: 'CHG'),
    Daerah(nama: 'Kelurahan Bojonggede', kode: 'BJG'),
    Daerah(nama: 'Kelurahan Ciparay', kode: 'CPR'),
    Daerah(nama: 'Kelurahan Pasirkaliki', kode: 'PSK'),
    Daerah(nama: 'Kelurahan Karangmulya', kode: 'KRM'),
    Daerah(nama: 'Kelurahan Sukaraja', kode: 'SKR'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar 10 Wilayah')),
      body: ListView.separated(
        padding: const EdgeInsets.all(
          16,
        ), // Memberikan jarak dari pinggir layar
        itemCount: _dataDaerah.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          // Memanggil widget yang sudah di-extract
          return DaerahCard(daerah: _dataDaerah[index], index: index);
        },
      ),
    );
  }
}

// 2. EXTRACTED WIDGET
// Memisahkan UI Item agar kode utama tidak berantakan
class DaerahCard extends StatelessWidget {
  final Daerah daerah;
  final int index;

  const DaerahCard({super.key, required this.daerah, required this.index});

  @override
  Widget build(BuildContext context) {
    // Menggunakan Card agar tampilan lebih menonjol (pop-out)
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Memilih: ${daerah.nama}'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              // Memberikan warna berbeda-beda berdasarkan index
              backgroundColor:
                  Colors.primaries[index % Colors.primaries.length],
              foregroundColor: Colors.white,
              child: Text(daerah.kode, style: const TextStyle(fontSize: 12)),
            ),
            title: Text(
              daerah.nama,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Wilayah Prioritas ke-${index + 1}'),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
