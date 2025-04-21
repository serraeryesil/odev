-- PostgreSQL Çevrimiçi Eğitim Platformu Veritabanı Şeması

-- Üyeler (Members) tablosu
CREATE TABLE Members (
    member_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- Kategoriler (Categories) tablosu
CREATE TABLE Categories (
    category_id SMALLINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Eğitimler (Courses) tablosu
CREATE TABLE Courses (
    course_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    instructor_info VARCHAR(100) NOT NULL,
    category_id SMALLINT NOT NULL,
    CONSTRAINT fk_course_category FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Katılımlar (Enrollments) tablosu
CREATE TABLE Enrollments (
    enrollment_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    member_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    enrollment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_enrollment_member FOREIGN KEY (member_id) REFERENCES Members(member_id),
    CONSTRAINT fk_enrollment_course FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    CONSTRAINT unique_enrollment UNIQUE (member_id, course_id)
);

-- Sertifikalar (Certificates) tablosu
CREATE TABLE Certificates (
    certificate_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    certificate_code VARCHAR(100) UNIQUE NOT NULL,
    issue_date DATE NOT NULL,
    course_id BIGINT NOT NULL,
    CONSTRAINT fk_certificate_course FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Sertifika Atamaları (CertificateAssignments) tablosu
CREATE TABLE CertificateAssignments (
    assignment_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    member_id BIGINT NOT NULL,
    certificate_id BIGINT NOT NULL,
    assignment_date DATE NOT NULL,
    CONSTRAINT fk_assignment_member FOREIGN KEY (member_id) REFERENCES Members(member_id),
    CONSTRAINT fk_assignment_certificate FOREIGN KEY (certificate_id) REFERENCES Certificates(certificate_id),
    CONSTRAINT unique_certificate_assignment UNIQUE (member_id, certificate_id)
);

-- Blog Gönderileri (BlogPosts) tablosu
CREATE TABLE BlogPosts (
    post_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    publication_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    author_id BIGINT NOT NULL,
    CONSTRAINT fk_post_author FOREIGN KEY (author_id) REFERENCES Members(member_id)
);
