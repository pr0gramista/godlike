Nie pamiętam jak się tworzy użytkownika.

```
// Logowanie się
mysql -u root -p

// Tworzenie użytkownika
CREATE USER 'wow'@'localhost' IDENTIFIED BY 'bezpiecznehaslo';

// Dodaj uprawnienia
GRANT ALL PRIVILEGES ON *.* TO 'wow'@'localhost';

// Szybki backup
mysqldump -u root -p BAZA_DURURU > backup.sql
// lub
mysqldump -u root -p --all-databases --result-file=dump.sql

// Używaj bazy
SHOW DATABASES;
USE name;
SHOW TABLES;

// Wyjaśnij
DESCRIBE blog_post;
EXPLAIN SELECT * FROM blog_post;

// Pokaż
SELECT title FROM blog_post WHERE pub_date > '2017-06-01 00:00:00' ORDER BY id DESC;

// Zmodyfikuj (pamiętaj o WHERE) + konkatenacja
UPDATE blog_post SET title = CONCAT(title, 'ooo') WHERE id = 39;
```
