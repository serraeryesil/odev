# TurkStudentCo Data Science Bootcamp - 2. Hafta SQL

# 1. Amaç

Bu ödevde, **Chinook** veritabanında yer alan `Invoice` tablosu üzerinde çeşitli SQL sorguları yazmamız istendi.
Bu sayede SQL sorgulama becerilerimi geliştirmek ve farklı SQL işlemlerini uygulama amaçlanmıştır.

---

# 2. SQL Sorguları ve Açıklamaları

## **Soru 1: Tüm değerleri NULL olan kayıtları bulma**

Bu sorguda, `Invoice` tablosundaki tüm sütunları NULL olan kayıtların sayısını bulmamız istenmiştir.

# **SQL Sorgusu:**
```sql
SELECT COUNT(*)
FROM Invoice
WHERE invoice_id IS NULL
AND customer_id IS NULL
AND invoice_date IS NULL
AND billing_address IS NULL
AND billing_city IS NULL
AND billing_state IS NULL
AND billing_country IS NULL
AND billingpostal_code IS NULL
AND total IS NULL;
```

# **Sonuç:**
**Row Sayısı: 0**  
Tabloda tüm sütunları NULL olan bir kayıt bulunmamaktadır.

---

## **Soru 2: Total değerlerini iki katına çıkarma ve sıralama**

Bu sorguda, `total` sütunundaki değerleri iki katına çıkararak yeni bir sütun oluşturuyoruz ve bu sütuna göre azalan sıralama yapıyoruz.

# **SQL Sorgusu:**
```sql
SELECT
    total AS eski_total,
    total * 2 AS yeni_total
FROM Invoice
ORDER BY yeni_total DESC;
```

# **Çıktı:**
| eski_total | yeni_total |
|------------|------------|
| 25.86      | 51.72      |
| 23.86      | 47.72      |
| 21.86      | 43.72      |
| 18.86      | 37.72      |
| 17.91      | 35.82      |

Bu sorgu sayesinde, `total` değerlerini ikiyle çarparak yeni bir sütun oluşturur ve büyükten küçüğe sıralar. İlk birkaç çıktının değeri yazıldı.

---

# **Soru 3: Adres verisini kısaltarak gösterme**

Bu sorguda, `billing_address` sütunundaki verilerin **ilk 3** karakteri ve **son 4** karakteri alınarak `Açık_adres` adı altında yeni bir sütun oluşturulmuştur. Ayrıca, yalnızca **2013 yılının 8. ayına ait faturalar** filtrelenmiştir.

# **SQL Sorgusu:**
```sql
SELECT
    LEFT(billing_address, 3) || '...' || RIGHT(billing_address, 4) AS "Açık_adres"
FROM Invoice
WHERE
    EXTRACT(YEAR FROM invoice_date) = 2013
    AND EXTRACT(MONTH FROM invoice_date) = 8;
```

# **Çıktı:**
| Açık_adres |
|------------|
| "3 C...reet" |
| "Lij...20bg" |
| "C/ ...o 85" |
| "110...n Pl" |
| "Av....2170" |
| "Rua... 155" |
| "162...reet" |

Bu sorgu, adres bilgilerini gizliliği koruyacak şekilde kısaltırken, belirli bir tarih aralığına göre filtreleme yapmıştır.

---

# 3. Sonuç

Bu ödev kapsamında:
- NULL kayıtların sayısını tespit ettik.
- `total` değerlerini iki katına çıkararak yeni bir sıralama yaptık.
- Adres bilgilerini belirli bir formatta kısaltarak gösterdik.
