
# Flutter Application Test

## Deskripsi Project

Project ini adalah aplikasi Flutter yang dikembangkan untuk memenuhi tugas pada semester 5, Mata Kuliah "Pemrograman Mobile". Aplikasi ini menampilkan halaman profil dengan fitur edit profil, navigasi bawah (bottom navigation), serta beberapa widget custom seperti header profil, tombol aksi, dan footer.

## Fitur Utama

- **Halaman Profil**: Menampilkan informasi profil pengguna.
- **Edit Profil**: Pengguna dapat mengedit data profil.
- **Bottom Navigation**: Navigasi antar halaman utama aplikasi.
- **Custom Widgets**: Komponen seperti action buttons, profile header, dan footer dibuat terpisah untuk modularitas.
- **Asset Gambar**: Mendukung penggunaan gambar dari folder `assets/images`.

## Struktur Direktori Penting

- `lib/` : Berisi kode utama aplikasi Flutter
  - `main.dart` : Entry point aplikasi
  - `edit_profile.dart` : Halaman edit profil
  - `profile_page.dart` : Halaman profil utama
  - `profile_with_bottom_nav.dart` : Profil dengan navigasi bawah
  - `widgets/` : Widget custom (action_buttons, footer, profile_header)
- `assets/images/` : Menyimpan gambar yang digunakan dalam aplikasi
- `test/` : Berisi file untuk pengujian widget
- `pubspec.yaml` : Konfigurasi dependencies dan asset

## Cara Menjalankan Aplikasi

1. Pastikan sudah menginstall Flutter SDK.
2. Jalankan perintah berikut di terminal:

   ```sh
   flutter pub get
   flutter run
   ```

3. Pilih device emulator atau perangkat fisik yang tersedia.

## Konfigurasi Asset

Pastikan asset gambar sudah didaftarkan di `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
```

## Informasi Tambahan

- Project ini dapat dijalankan di Android, iOS, Web, Windows, Linux, dan macOS.
- Untuk pengujian, gunakan file di folder `test/`.

## Identitas Pembuat

- **Nama**: Shofwan Zhilaludin
- **NIM**: C2383207016
- **Mata Kuliah**: Pemrograman Mobile