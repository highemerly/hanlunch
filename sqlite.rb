require 'sqlite3'
require 'pp'

SQLITE_DBNAME = "lunch"
SQLITE_TABLE_DEFINE = "day datetime, lunch text"

class Database
	def initialize(filename)
		@db = SQLite3::Database.new filename
		unless @db.execute("SELECT tbl_name FROM sqlite_master WHERE type == 'table'").flatten.include?(SQLITE_DBNAME) then
			@db.execute("CREATE TABLE " + SQLITE_DBNAME + " (" + SQLITE_TABLE_DEFINE + ")")
		end
		@db.results_as_hash = true
	end

	def add_if_new(key, value)
		sql = "SELECT * FROM " + SQLITE_DBNAME + " WHERE day = '" + key + "'"
		if @db.execute(sql).empty? then
			add(key, value)
		end
	end

	def latest()
		sql = "SELECT * FROM " + SQLITE_DBNAME + " ORDER BY day desc"
		return @db.execute(sql)[0]
	end

	def pretty()
		hoge = @db.execute('select * from '+SQLITE_DBNAME)
		pp hoge
	end

	def close()
		@db.close()
	end

	private

	def add(key, value)
		sql = "insert into "+ SQLITE_DBNAME+ " values (?, ?)"
		@db.execute(sql, key, value)
	end

end