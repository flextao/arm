
def fix_postgres_db_connection(config)
  if config['driver'] =~ /postgresql/i                      # changed line
    if config['url']
      db = config['url'][/\/([^\/]*)$/, 1]
      config['url'] = config['url'].gsub(/\/([^\/]*)$/, "/postgres") if db  # changed line
    else
      db = config['database']
      config['database'] = 'postgres'
    end
    ActiveRecord::Base.establish_connection(config)
  else
    ActiveRecord::Base.establish_connection(config)
    db = ActiveRecord::Base.connection.database_name
  end
  db
end

def drop_database(config)
  db = fix_postgres_db_connection(config.dup)
  ActiveRecord::Base.connection.drop_database(db)
  ActiveRecord::Base.establish_connection(config)
end

def create_database(config)
  db = fix_postgres_db_connection(config.dup)
  ActiveRecord::Base.connection.create_database(db)
  ActiveRecord::Base.establish_connection(config)
end