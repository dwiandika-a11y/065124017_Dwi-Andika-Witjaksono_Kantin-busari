import 'package:flutter/material.dart';

class MenuDetailPage extends StatefulWidget {
  const MenuDetailPage({super.key});

  @override
  State<MenuDetailPage> createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  double _porsi = 1.0;
  bool _tambahSambal = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    String nama = 'Menu Pilihan';
    String harga = 'Rp 0';
    String kategori = 'Makanan';
    IconData icon = Icons.fastfood;
    bool tersedia = true;

    if (args is Map) {
      nama = args['nama']?.toString() ?? nama;
      harga = args['harga']?.toString() ?? harga;
      kategori = args['kategori']?.toString() ?? kategori;
      icon = args['icon'] is IconData ? args['icon'] as IconData : icon;
      tersedia = args['tersedia'] is bool ? args['tersedia'] as bool : tersedia;
    }

    final bool isMakanan = kategori.toLowerCase() == 'makanan';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kantin Bu Sari - Detail Menu'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Detail Menu Pilihan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Harga, deskripsi, dan gambar menu.'),
              const SizedBox(height: 16),

              // 1. CircleAvatar - Foto menu
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.orange,
                child: Icon(icon, size: 48, color: Colors.white),
              ),
              const SizedBox(height: 12),

              // Nama & Harga Menu
              Text(nama, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(harga, style: const TextStyle(fontSize: 16, color: Colors.deepOrange, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              // Badge kategori
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange),
                ),
                child: Text(
                  kategori,
                  style: TextStyle(color: Colors.deepOrange, fontSize: 12),
                ),
              ),
              const SizedBox(height: 12),

              // 2. RatingBar (indikator) pakai Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star_border, color: Colors.amber),
                  Icon(Icons.star_border, color: Colors.amber),
                  SizedBox(width: 8),
                  Text('3.5/5'),
                ],
              ),
              const SizedBox(height: 12),

              // 3. Badge (label) ketersediaan
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tersedia ? 'Tersedia' : 'Habis',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),

              // Deskripsi menu
              const Text(
                'Nasi goreng dengan potongan ayam segar, bumbu rempah pilihan, '
                'dilengkapi telur mata sapi, kerupuk, dan acar. Cocok untuk makan siang!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.black87),
              ),
              const SizedBox(height: 12),

              // 4. Slider (jumlah porsi)
              Row(
                children: [
                  const Text('Porsi:'),
                  Expanded(
                    child: Slider(
                      value: _porsi,
                      min: 1,
                      max: 5,
                      divisions: 4,
                      label: _porsi.round().toString(),
                      onChanged: (val) {
                        setState(() {
                          _porsi = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              if (isMakanan)
              // 5. CheckboxListTile (tambahan)
              if (isMakanan)
                CheckboxListTile(
                title: const Text('Tambah sambal'),
                subtitle: const Text('+Rp 2.000'),
                value: _tambahSambal,
                onChanged: (val) {
                  if (val == null) return;
                  setState(() {
                    _tambahSambal = val;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/pesan');
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Pesan Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



