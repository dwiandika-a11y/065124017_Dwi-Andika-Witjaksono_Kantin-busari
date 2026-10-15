import 'package:flutter/material.dart';

// Data menu statis
const List<Map<String, dynamic>> _daftarMenu = [
  {
    'nama': 'Nasi Goreng Ayam',
    'harga': 'Rp 15.000',
    'kategori': 'Makanan',
    'icon': Icons.rice_bowl,
    'warna': Colors.orange,
    'tersedia': true,
  },
  {
    'nama': 'Mie Goreng Spesial',
    'harga': 'Rp 13.000',
    'kategori': 'Makanan',
    'icon': Icons.ramen_dining,
    'warna': Colors.deepOrange,
    'tersedia': true,
  },
  {
    'nama': 'Ayam Bakar',
    'harga': 'Rp 18.000',
    'kategori': 'Makanan',
    'icon': Icons.set_meal,
    'warna': Colors.brown,
    'tersedia': true,
  },
  {
    'nama': 'Soto Ayam',
    'harga': 'Rp 12.000',
    'kategori': 'Makanan',
    'icon': Icons.soup_kitchen,
    'warna': Colors.amber,
    'tersedia': false,
  },
  {
    'nama': 'Es Teh Manis',
    'harga': 'Rp 5.000',
    'kategori': 'Minuman',
    'icon': Icons.local_cafe,
    'warna': Colors.teal,
    'tersedia': true,
  },
  {
    'nama': 'Jus Alpukat',
    'harga': 'Rp 10.000',
    'kategori': 'Minuman',
    'icon': Icons.local_drink,
    'warna': Colors.green,
    'tersedia': true,
  },
  {
    'nama': 'Es Jeruk',
    'harga': 'Rp 6.000',
    'kategori': 'Minuman',
    'icon': Icons.emoji_food_beverage,
    'warna': Colors.orange,
    'tersedia': true,
  },
  {
    'nama': 'Kerupuk Udang',
    'harga': 'Rp 3.000',
    'kategori': 'Cemilan',
    'icon': Icons.cookie,
    'warna': Colors.yellow,
    'tersedia': true,
  },
  {
    'nama': 'Pisang Goreng',
    'harga': 'Rp 5.000',
    'kategori': 'Cemilan',
    'icon': Icons.cake,
    'warna': Colors.yellowAccent,
    'tersedia': true,
  },
  {
    'nama': 'Tempe Goreng',
    'harga': 'Rp 2.000',
    'kategori': 'Cemilan',
    'icon': Icons.lunch_dining,
    'warna': Colors.brown,
    'tersedia': false,
  },
];

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  String _kategori = 'Semua';
  String _pencarian = '';
  String _urutan = 'Populer';
  final TextEditingController _cariController = TextEditingController();

  List<Map<String, dynamic>> get _menuTersaring {
    return _daftarMenu.where((menu) {
      final cocokKategori =
          _kategori == 'Semua' || menu['kategori'] == _kategori;
      final cocokCari = menu['nama']
          .toString()
          .toLowerCase()
          .contains(_pencarian.toLowerCase());
      return cocokKategori && cocokCari;
    }).toList();
  }

  @override
  void dispose() {
    _cariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kantin Bu Sari - Daftar Menu'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang di Kantin Bu Sari!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            const Text(
              'Pilih menu favoritmu di bawah ini:',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // 1. TextField - Pencarian menu
            TextField(
              controller: _cariController,
              onChanged: (value) {
                setState(() {
                  _pencarian = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari menu...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _pencarian.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _cariController.clear();
                          setState(() {
                            _pencarian = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 12),

            // 2. Wrap - Filter kategori
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('Semua'),
                  avatar: const Icon(Icons.restaurant, size: 18),
                  selected: _kategori == 'Semua',
                  selectedColor: Colors.deepOrange,
                  labelStyle: TextStyle(
                    color: _kategori == 'Semua' ? Colors.white : null,
                  ),
                  onSelected: (_) {
                    setState(() {
                      _kategori = 'Semua';
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text('Makanan'),
                  avatar: const Icon(Icons.fastfood, size: 18),
                  selected: _kategori == 'Makanan',
                  onSelected: (_) {
                    setState(() {
                      _kategori = 'Makanan';
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text('Minuman'),
                  avatar: const Icon(Icons.local_cafe, size: 18),
                  selected: _kategori == 'Minuman',
                  onSelected: (_) {
                    setState(() {
                      _kategori = 'Minuman';
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text('Cemilan'),
                  avatar: const Icon(Icons.cake, size: 18),
                  selected: _kategori == 'Cemilan',
                  onSelected: (_) {
                    setState(() {
                      _kategori = 'Cemilan';
                    });
                  },
                ),
              ],
            ),
            // 3. ToggleButtons - Mode tampilan
            ToggleButtons(
              isSelected: const [true, false],
              borderRadius: BorderRadius.circular(12),
              selectedColor: Colors.white,
              fillColor: Colors.deepOrange,
              onPressed: (_) {},
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.grid_view),
                      SizedBox(width: 4),
                      Text('Grid'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.view_list),
                      SizedBox(width: 4),
                      Text('List'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 4. Card - Promo
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.local_offer, color: Colors.white),
                ),
                title: const Text('Promo Hari Ini'),
                subtitle: const Text('Diskon 10% untuk pembelian pertama!'),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('Lihat'),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 5. DropdownButton - Urutan
            DropdownButton<String>(
              isExpanded: true,
              value: _urutan,
              items: const [
                DropdownMenuItem(value: 'Populer', child: Text('Populer')),
                DropdownMenuItem(value: 'Termurah', child: Text('Termurah')),
                DropdownMenuItem(value: 'Termahal', child: Text('Termahal')),
                DropdownMenuItem(value: 'Terbaru', child: Text('Terbaru')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _urutan = value;
                  });
                }
              },
            ),
            const SizedBox(height: 20),

            // 6. Daftar Menu - Grid
            const Text(
              'Menu Tersedia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.82,
              ),
              itemCount: _menuTersaring.length,
              itemBuilder: (context, index) {
                final menu = _menuTersaring[index];
                final bool tersedia = menu['tersedia'] as bool;
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: tersedia
                        ? () => Navigator.pushNamed(context, '/detail', arguments: menu)
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor:
                                (menu['warna'] as Color).withValues(alpha: 0.2),
                            child: Icon(
                              menu['icon'] as IconData,
                              size: 32,
                              color: menu['warna'] as Color,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            menu['nama'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            menu['harga'] as String,
                            style: const TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: tersedia ? Colors.green : Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              tersedia ? 'Tersedia' : 'Habis',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            menu['kategori'] as String,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}




