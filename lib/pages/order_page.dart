import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kantin Bu Sari - Pesanan Kamu'),
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
                'Pesanan Kamu Diterima!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text('Tunjukkan struk ini ke kasir Bu Sari.'),
              const SizedBox(height: 16),

              // 1. LinearProgressIndicator - status pesanan
              const LinearProgressIndicator(
                value: 0.3,
                backgroundColor: Colors.grey,
                color: Colors.deepOrange,
              ),
              const SizedBox(height: 12),

              // 2. Stepper (visual step) pakai Column sederhana
              Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Pesanan Diterima'),
                    dense: true,
                  ),
                  ListTile(
                    leading: Icon(Icons.hourglass_bottom, color: Colors.orange),
                    title: Text('Sedang Diproses'),
                    dense: true,
                  ),
                  ListTile(
                    leading: Icon(Icons.dining, color: Colors.grey),
                    title: Text('Siap Diambil'),
                    dense: true,
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 3. Divider
              const Divider(thickness: 1),

              // 4. ExpansionTile - rincian pesanan
              const ExpansionTile(
                leading: Icon(Icons.receipt_long),
                title: Text('Rincian Pesanan'),
                children: [
                  ListTile(
                    title: Text('Nasi Goreng Ayam'),
                    trailing: Text('Rp 15.000'),
                    dense: true,
                  ),
                  ListTile(
                    title: Text('Es Teh Manis'),
                    trailing: Text('Rp 5.000'),
                    dense: true,
                  ),
                  ListTile(
                    title: Text('Total'),
                    trailing: Text('Rp 20.000'),
                    dense: true,
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 5. SwitchListTile - notifikasi
              SwitchListTile(
                title: const Text('Kabari saya saat pesanan siap'),
                value: true,
                onChanged: (_) {},
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                icon: const Icon(Icons.home),
                label: const Text('Kembali ke Daftar Menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

