class LoadFromSql < ActiveRecord::Migration[5.0]

  def up
    config = YAML.load_file('config/database.yml')[Rails.env].symbolize_keys
    config[:flags] = Mysql2::Client::MULTI_STATEMENTS
    client = Mysql2::Client.new(config)

    sql = read_sql_files(ENV['SQL_DUMP'], 'adjustments.sql')

    puts ">>> LOADING SQL"
    client.query sql
  end

  def down
  end

  private
  def read_sql_files(*filenames)
    result = ''

    filenames.each do |filename|
      sqlfile = File.join(Rails.root, 'db', 'sql', filename)
      puts ">>> READING #{sqlfile}"
      result += File.read(sqlfile)
    end

    result
  end
end
