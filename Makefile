

all: data/main.db

data/main.db: create_db.sql
	rm -f data/main.db
	cat create_db.sql | sqlite3 data/main.db

