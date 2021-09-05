// equivalent to "use <db>" commang in mongo shell.
// and it will create a new database if not exists.
const databse = db.getSiblingDB("my_database");

// equivalent to "show collections" command in mongo shell.
const collections = db.getCollectionNames();
