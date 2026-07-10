-- ============================================================
-- Database and table definitions
-- ============================================================

-- Database setup
DROP DATABASE IF EXISTS football_ticket_booking_system;

CREATE DATABASE football_ticket_booking_system;

-- Users table
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
  user_id int PRIMARY KEY,
  full_name varchar(100) NOT NULL,
  email varchar(150) NOT NULL UNIQUE,
  role varchar(20) NOT NULL CHECK (role IN ('Ticket Manager', 'Football Fan')),
  phone_number varchar(20)
);

-- Matches table
DROP TABLE IF EXISTS Matches;

CREATE TABLE Matches (
  match_id int PRIMARY KEY,
  fixture varchar(150) NOT NULL,
  tournament_category varchar(100) NOT NULL,
  base_ticket_price numeric(10, 2) NOT NULL CHECK (base_ticket_price >= 0),
  match_status varchar(20) NOT NULL CHECK (
    match_status IN (
      'Available',
      'Selling Fast',
      'Sold Out',
      'Postponed'
    )
  )
);

-- Bookings table
DROP TABLE IF EXISTS Bookings;

CREATE TABLE Bookings (
  booking_id int PRIMARY KEY,
  user_id int NOT NULL REFERENCES Users (user_id),
  match_id int NOT NULL REFERENCES Matches (match_id),
  seat_number varchar(10),
  payment_status varchar(20) CHECK (
    payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
  ),
  total_cost numeric(10, 2) NOT NULL CHECK (total_cost >= 0)
);