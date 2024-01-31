all: data/main.db

data/main.db: create_db.sql generate_data.R
	rm -f data/main.db
	Rscript generate_data.R
	cat create_db.sql | sqlite3 data/main.db

