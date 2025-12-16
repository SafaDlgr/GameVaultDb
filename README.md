# 🎮 GameVault Database Project

GameVault, Steam ve Epic Games benzeri dijital oyun dağıtım platformları için tasarlanmış **örnek bir ilişkisel veritabanı projesidir**. Bu proje, SQL Server (MSSQL) kullanılarak oluşturulmuş olup portföy amaçlı olarak hazırlanmıştır.

---

## 📌 Proje Amacı

Bu çalışmanın amacı;

* İlişkisel veritabanı tasarımı yapabilme
* Primary Key ve Foreign Key ilişkilerini doğru kurma
* One-to-Many ve Many-to-Many ilişkileri uygulayabilme
* SQL (DDL, DML, SELECT, JOIN) sorgularını etkin kullanabilme

becerilerini göstermektir.

---

## 🗂️ Veritabanı Yapısı

Proje aşağıdaki **4 tablodan** oluşmaktadır:

### 1️⃣ developers

Oyun geliştirici firmaların bilgilerini tutar.

* `id` (PK)
* `company_name`
* `country`
* `founded_year`

### 2️⃣ games

Oyunlara ait temel bilgileri tutar.

* `id` (PK)
* `title`
* `price`
* `release_date`
* `rating`
* `developer_id` (FK)

📎 Bir geliştirici birden fazla oyun geliştirebilir (**One-to-Many**).

### 3️⃣ genres

Oyun türlerini tutar.

* `id` (PK)
* `name`
* `description`

### 4️⃣ games_genres

Oyunlar ile türler arasındaki **Many-to-Many** ilişkiyi kuran ara tablodur.

* `id` (PK)
* `game_id` (FK)
* `genre_id` (FK)

---

## 🔗 İlişkiler

* **developers → games** : One-to-Many
* **games ↔ genres** : Many-to-Many (games_genres aracılığıyla)

---

## 🛠️ Kullanılan Teknolojiler

* **Microsoft SQL Server (MSSQL)**
* SQL (DDL, DML, JOIN, UPDATE, DELETE)
* dbdiagram.io (ER Diagram)

---

## 📊 İçerik

Bu repository içerisinde:

* Veritabanı tablolarını oluşturan `CREATE TABLE` sorguları
* Örnek veriler için `INSERT INTO` sorguları
* Güncelleme ve silme işlemleri (`UPDATE`, `DELETE`)
* Raporlama amaçlı `SELECT` ve `JOIN` sorguları
* ER Diyagram ekran görüntüsü

bulunmaktadır.

---

## 📷 ER Diyagram

Veritabanı diyagramı **dbdiagram.io** kullanılarak oluşturulmuştur.

> DrawSQL sitesine erişim engeli nedeniyle alternatif bir araç tercih edilmiştir.

---

## 🚀 Amaç

Bu proje, veritabanı tasarımı ve SQL bilgimi göstermek amacıyla **portföy çalışması** olarak GitHub üzerinde paylaşılmıştır.

---

## 👤 Geliştirici

**Safa**
Management Information Systems Student
İlgi Alanları: Veritabanları, Test Otomasyonu, Yazılım Geliştirme

---

⭐ Bu projeyi faydalı bulduysanız yıldız vermeyi unutmayın!
