-- id: 20221204131007
-- direction: UP
-- description: credit_cards_table

CREATE TABLE cards (
  id INTEGER PRIMARY KEY,
  card_holder_id integer not null,
  card_number text not null,
  cvv text not null,
  expiration_date date not null,
  created_at date not null,
  updated_at date,
  deleted_at date
)
