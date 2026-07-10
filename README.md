# Football Ticket Booking System

SQL database project for a football ticket booking platform.

## Schema

### Users

| Column       | Type         | Constraints                                            |
| ------------ | ------------ | ------------------------------------------------------ |
| user_id      | int          | `PRIMARY KEY`                                          |
| full_name    | varchar(100) | `NOT NULL`                                             |
| email        | varchar(150) | `NOT NULL`, `UNIQUE`                                   |
| role         | varchar(20)  | `NOT NULL`, `CHECK ('Ticket Manager', 'Football Fan')` |
| phone_number | varchar(20)  |                                                        |

### Matches

| Column              | Type          | Constraints                                                                |
| ------------------- | ------------- | -------------------------------------------------------------------------- |
| match_id            | int           | `PRIMARY KEY`                                                              |
| fixture             | varchar(150)  | `NOT NULL`                                                                 |
| tournament_category | varchar(100)  | `NOT NULL`                                                                 |
| base_ticket_price   | numeric(10,2) | `NOT NULL`, `CHECK (>= 0)`                                                 |
| match_status        | varchar(20)   | `NOT NULL`, `CHECK ('Available', 'Selling Fast', 'Sold Out', 'Postponed')` |

### Bookings

| Column         | Type          | Constraints                                               |
| -------------- | ------------- | --------------------------------------------------------- |
| booking_id     | int           | `PRIMARY KEY`                                             |
| user_id        | int           | `NOT NULL`, `REFERENCES Users(user_id)`                   |
| match_id       | int           | `NOT NULL`, `REFERENCES Matches(match_id)`                |
| seat_number    | varchar(10)   |                                                           |
| payment_status | varchar(20)   | `CHECK ('Pending', 'Confirmed', 'Cancelled', 'Refunded')` |
| total_cost     | numeric(10,2) | `NOT NULL`, `CHECK (>= 0)`                                |

## Relationships

- **Users 1-to-M Bookings:** one fan can have many bookings
- **Bookings M-to-1 Matches:** many fans can book the same match

## Queries

| #   | Description                              |
| --- | ---------------------------------------- |
| 01  | Available Champions League matches       |
| 02  | User name pattern search                 |
| 03  | Bookings with null payment status        |
| 04  | Booking details with user and match      |
| 05  | All users and their bookings             |
| 06  | Bookings above average cost              |
| 07  | Top 2 most expensive matches skipping #1 |

## Sample Data

- **4 users:** 3 fans, 1 manager
- **5 matches:** Champions League, Premier League, Serie A
- **5 bookings:** mix of confirmed, pending, and null status