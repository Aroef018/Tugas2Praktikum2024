import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
        backgroundColor: Colors.deepPurple, // Warna AppBar
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Formulir Input Data",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple, // Warna judul
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _textboxNama(),
              const SizedBox(height: 15),
              _textboxNIM(),
              const SizedBox(height: 15),
              _textboxTahun(),
              const SizedBox(height: 30),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textboxNama() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama",
        labelStyle: TextStyle(color: Colors.deepPurple), // Warna label
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Sudut melengkung
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.deepPurple), // Warna fokus
        ),
      ),
      controller: _namaController,
    );
  }

  Widget _textboxNIM() {
    return TextField(
      decoration: InputDecoration(
        labelText: "NIM",
        labelStyle: TextStyle(color: Colors.deepPurple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.deepPurple),
        ),
      ),
      controller: _nimController,
    );
  }

  Widget _textboxTahun() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Tahun Lahir",
        labelStyle: TextStyle(color: Colors.deepPurple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.deepPurple),
        ),
      ),
      keyboardType: TextInputType.number, // Input tipe angka
      controller: _tahunController,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String nama = _namaController.text;
        String nim = _nimController.text;
        int tahun = int.parse(_tahunController.text);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                TampilData(nama: nama, nim: nim, tahun: tahun)));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple, // Warna tombol
        padding: const EdgeInsets.symmetric(vertical: 15), // Ukuran tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Sudut melengkung
        ),
      ),
      child: const Text(
        'Simpan',
        style: TextStyle(fontSize: 18), // Ukuran teks tombol
      ),
    );
  }
}
