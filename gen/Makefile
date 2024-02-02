all: ../main.db

../main.db: create_db.sql generate_data.R
	rm -f main.db
	Rscript generate_data.R
	cat create_db.sql | sqlite3 ../main.db
