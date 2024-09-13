Berikut adalah penjelasan lengkap yang bisa langsung disalin ke file `README.md`:

---

# Proses Passing Data dari Form ke Tampilan

## 1. Pembuatan Form Input Data
Pada aplikasi ini, kita membuat sebuah form untuk menginput data berupa **nama**, **NIM**, dan **tahun lahir**. Form ini dibuat menggunakan widget `TextField` dan disertai tombol `Simpan` untuk memproses data input.

### Struktur Form:
- **Nama**: Input tipe teks untuk mengisi nama.
- **NIM**: Input tipe teks untuk mengisi NIM.
- **Tahun Lahir**: Input tipe teks yang diubah ke tipe angka untuk menghitung umur.
- **Tombol Simpan**: Tombol untuk menyimpan data dan berpindah ke halaman berikutnya sambil membawa data yang telah diinput.

### Contoh Kode:
```dart
final _namaController = TextEditingController();
final _nimController = TextEditingController();
final _tahunController = TextEditingController();
```
Pada bagian ini, `TextEditingController` digunakan untuk mendapatkan nilai yang dimasukkan oleh pengguna ke dalam `TextField`.

### Fungsi Tombol Simpan:
```dart
_tombolSimpan() {
  return ElevatedButton(
    onPressed: () {
      String nama = _namaController.text;
      String nim = _nimController.text;
      int tahun = int.parse(_tahunController.text);

      // Passing data ke halaman TampilData
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TampilData(nama: nama, nim: nim, tahun: tahun)));
    },
    child: const Text('Simpan'),
  );
}
```
Pada kode di atas:
- **`Navigator.of(context).push`**: Fungsi ini digunakan untuk berpindah dari halaman form menuju halaman berikutnya (halaman tampilan data). Di dalamnya, kita membuat `MaterialPageRoute` untuk menampilkan widget baru (`TampilData`) dan membawa data yang dipassing melalui parameter `nama`, `nim`, dan `tahun`.

## 2. Menerima Data di Halaman TampilData
Pada halaman `TampilData`, data yang dipassing dari form akan diterima melalui konstruktor widget. Data tersebut kemudian digunakan untuk ditampilkan di layar.

### Contoh Kode:
```dart
class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahun;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int umur = DateTime.now().year - tahun;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perkenalan"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun"),
          ],
        ),
      ),
    );
  }
}
```

### Penjelasan:
- **Konstruktor `TampilData`** menerima data `nama`, `nim`, dan `tahun` dari halaman sebelumnya.
- **`final int umur = DateTime.now().year - tahun;`** menghitung umur berdasarkan tahun lahir yang diinput di form.
- Data yang telah dipassing kemudian ditampilkan pada widget `Text` di halaman ini.

---

Penjelasan di atas menunjukkan bagaimana proses passing data dilakukan dari form input ke halaman tampilan data menggunakan Flutter.

## Screenshot
![alt text](<Screenshot from 2024-09-14 03-01-02.png>)
![alt text](<Screenshot from 2024-09-14 03-01-27.png>)