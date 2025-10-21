# Flutter Application

Aplikasi Flutter sederhana yang menampilkan halaman profil dengan fitur edit, navigasi bawah (bottom navigation), dan beberapa widget custom seperti header profil, tombol aksi, serta footer.

## Fitur Utama

- **Halaman Profil**: Menampilkan informasi profil pengguna.
- **Edit Profil**: Pengguna dapat mengubah data profil dan menyimpannya.
- **Bottom Navigation**: Navigasi antar halaman utama aplikasi.
- **Custom Widgets**: Komponen modular seperti action buttons, profile header, dan footer.
- **Asset Gambar**: Mendukung gambar dari folder `assets/images`.

## Struktur Direktori

```
lib/
  main.dart
  edit_profile.dart
  profile_page.dart
  profile_with_bottom_nav.dart
  widgets/
    action_buttons.dart
    footer.dart
    profile_header.dart
assets/images/
  profile1.jpg
  profile2.jpg
  banner1.jpg
  banner2.jpg
test/
  widget_test.dart
pubspec.yaml
```

## Cara Menjalankan Aplikasi

1. Pastikan Flutter SDK sudah terpasang di komputer Anda.
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Jalankan aplikasi:
   ```sh
   flutter run
   ```
4. Pilih device emulator atau perangkat fisik.

## Konfigurasi Asset

Pastikan asset gambar sudah didaftarkan di `pubspec.yaml`:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/profile1.jpg
    - assets/images/profile2.jpg
    - assets/images/banner1.jpg
    - assets/images/banner2.jpg
```

## Pengujian

Untuk menjalankan pengujian widget:
```sh
flutter test
```

## Pengembangan

- Project dapat dijalankan di Android, iOS, Web, Windows, Linux, dan macOS.
- Struktur kode modular, mudah dikembangkan dan dipelihara.
- Untuk menambah asset gambar, letakkan di `assets/images/` dan daftarkan di `pubspec.yaml`.

## Kontribusi

Kontribusi terbuka untuk perbaikan bug atau penambahan fitur. Silakan fork repository ini dan ajukan pull request.

---

**Created by: Shofwan Zhilaludin**