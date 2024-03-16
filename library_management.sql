DROP TABLE IF EXISTS library_management.user_login;
CREATE TABLE IF NOT EXISTS library_management.user_login (
	user_id VARCHAR(50) PRIMARY KEY,
    user_password VARCHAR(50),
    first_name VARCHAR(50),
	last_name VARCHAR(50),
	sign_up_on VARCHAR(50),
	email_id VARCHAR(50)
);

DROP TABLE IF EXISTS library_management.publisher;
CREATE TABLE IF NOT EXISTS library_management.publisher (
	publisher_id VARCHAR(50) PRIMARY KEY,
    publisher VARCHAR(50),
    distributor VARCHAR(50),
	releases_count INT,
	last_release DATE
);

DROP TABLE IF EXISTS library_management.author;
CREATE TABLE IF NOT EXISTS library_management.author (
	author_id VARCHAR(50) PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	publications_count INT
);

DROP TABLE IF EXISTS library_management.books;
CREATE TABLE IF NOT EXISTS library_management.books (
	book_id VARCHAR(50) PRIMARY KEY,
    book_code VARCHAR(50),
    book_name VARCHAR(50),
    author_id VARCHAR(50) REFERENCES library_management.author (author_id),
	publisher_id VARCHAR(50) REFERENCES library_management.publisher (publisher_id),
    book_version VARCHAR(50),
    release_date DATE,
    available_from DATE,
    is_available BOOLEAN
);

DROP TABLE IF EXISTS library_management.staff;
CREATE TABLE IF NOT EXISTS library_management.staff (
	staff_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50),
	last_name VARCHAR(50),
    staff_role VARCHAR(50),
    start_date DATE,
    last_date DATE,
    is_active BOOLEAN,
    work_shift_start TIME,
	work_shift_end TIME
);

DROP TABLE IF EXISTS library_management.readers;
CREATE TABLE IF NOT EXISTS library_management.readers (
	reader_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50),
	last_name VARCHAR(50),
	registered_on DATE,
	books_issued_total INT,
	books_issued_current INT,
	is_issued BOOLEAN,
	last_issue_date DATE,
	total_fine FLOAT,
	current_fine FLOAT
);

DROP TABLE IF EXISTS library_management.books_issue;
CREATE TABLE IF NOT EXISTS library_management.books_issue (
	issue_id SERIAL PRIMARY KEY,
	book_id VARCHAR(50) REFERENCES library_management.books (book_id),
	issued_to VARCHAR(50) REFERENCES library_management.readers (reader_id),
	issued_on DATE,
	return_on DATE,
	current_fine FLOAT,
	fine_paid BOOLEAN,
	payment_transaction_id VARCHAR(50)
);

DROP TABLE IF EXISTS library_management.settings;
CREATE TABLE IF NOT EXISTS library_management.settings (
	book_issue_count_per_reader INT,
	fine_per_day FLOAT,
	book_return_in_days INT
);
