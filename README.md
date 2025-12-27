# 📋 Flutter Todo App

Aplikasi **Todo List** berbasis **Flutter** yang memungkinkan pengguna untuk mengelola daftar tugas secara efisien, mulai dari menambahkan, mengubah status (selesai/belum), hingga menghapus todo. Aplikasi ini terintegrasi dengan **REST API backend** menggunakan autentikasi **JWT**.

---

## 🚀 Fitur Utama

* 🔐 **Autentikasi User** (Login & Register)
* ➕ **Tambah Todo**
* ✏️ **Update / Toggle Status Todo** (Done / Undone)
* 🗑️ **Hapus Todo**
* 🔄 **Sinkronisasi dengan Backend API**
* ⏳ **Loading & Error Handling**

---

## 🛠️ Tech Stack

### Frontend

* **Flutter**
* **Dart**
* **HTTP Package** (API request)
* **Stateful Widget / setState**

### Backend (Terintegrasi)

* REST API
* JWT Authentication (Bearer Token)
* Endpoint Todo (`GET`, `POST`, `PATCH`, `DELETE`)

---

## 📱 Tampilan Aplikasi

Fitur utama yang tersedia di aplikasi:

* Halaman Login & Register
* Halaman Daftar Todo
* Toggle status todo dengan satu klik
* Tambah dan hapus todo

---

## 🔗 API Integration

Contoh endpoint yang digunakan:

* **Login**
  `POST /auth/login`

* **Get Todos**
  `GET /todos`

* **Create Todo**
  `POST /todos`

* **Toggle Todo Status**
  `PATCH /todos/{id}`

* **Delete Todo**
  `DELETE /todos/{id}`

Semua request menggunakan header:

```
Authorization: Bearer <token>
Content-Type: application/json
```

---

## ⚙️ Cara Menjalankan Project

1. **Clone repository**

   ```bash
   git clone https://github.com/JovanLiem/Simple-ToDo-App-Flutter.git
   ```

2. **Masuk ke folder project**

   ```bash
   cd flutter-todo-app
   ```

3. **Install dependencies**

   ```bash
   flutter pub get
   ```

4. **Jalankan aplikasi**

   ```bash
   flutter run
   ```

Pastikan backend API sudah berjalan dan `baseUrl` sudah disesuaikan.

---

## 📂 Struktur Folder (Simplified)

```
lib/
│── models/
│   └── todo.dart
│── services/
│   └── api_service.dart
│── screens/
│   ├── login_page.dart
│   ├── register_page.dart
│   └── todo_page.dart
│── widgets/
│   └── todo_tile.dart
│── main.dart
```

---

## 👤 Author

**Jovan Amarta Liem**

---

