DROP DATABASE IF EXISTS  "users-companies-jobs-db";
CREATE DATABASE "users-companies-jobs-db";
\c "users-companies-jobs-db"
CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    name TEXT,
    logo TEXT,
    handle TEXT NOT NULL,
    password TEXT NOT NULL
);
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY,
    title TEXT,
    salary TEXT,
    equity FLOAT,
    company_id INTEGER REFERENCES companies(id) ON DELETE CASCADE
);
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    email TEXT,
    photo TEXT,
    current_company_id INTEGER REFERENCES companies (id) ON DELETE SET NULL
);
CREATE TABLE jobs_users (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
    job_id INTEGER REFERENCES jobs (id) ON DELETE CASCADE
);