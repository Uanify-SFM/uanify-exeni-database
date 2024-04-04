-- ----------------------------------
-- 1. Create table extension
-- ----------------------------------
CREATE TABLE extension (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

-- ----------------------------------
-- 2. Create table multimedia
-- ----------------------------------
CREATE TABLE multimedia (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    s3_key VARCHAR(255) NOT NULL,
    fk_extension INT NOT NULL,
    fk_medical_study INT NOT NULL,
    fk_branch INT NOT NULL,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (fk_extension) REFERENCES extension(id),
    FOREIGN KEY (fk_medical_study) REFERENCES medical_study(id)
    FOREIGN KEY (fk_branch) REFERENCES branch(id)
);

-- ----------------------------------
-- 3. Create table medical_study
-- ----------------------------------
CREATE TABLE medical_study (
    id SERIAL PRIMARY KEY,
    fk_patient INT NOT NULL,
    fk_medical_study_type INT NOT NULL,
    ia_message TEXT,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (fk_patient) REFERENCES patient(id),
    FOREIGN KEY (fk_medical_study_type) REFERENCES medical_study_type(id)
);

-- ----------------------------------
-- 4. Create table patient
-- ----------------------------------
CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    paternal_surname VARCHAR(255),
    maternal_surname VARCHAR(255),
    phone VARCHAR(20),
    genre VARCHAR(50),
    address TEXT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

-- ----------------------------------
-- 5. Create table medical_study_type
-- ----------------------------------
CREATE TABLE medical_study_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

-- ----------------------------------
-- 9. Create table branch
-- ----------------------------------
CREATE TABLE branch (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    country VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20),
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);
