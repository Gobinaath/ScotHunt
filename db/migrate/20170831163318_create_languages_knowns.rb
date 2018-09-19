class CreateLanguagesKnowns < ActiveRecord::Migration[5.1]
   def change
   	execute <<-SQL
    CREATE TYPE level AS ENUM ('novice', 'intermediary','expert');
  SQL
    create_table :languages_knowns do |t|
   
      t.column :english, :level
      t.column :spanish, :level
      t.column :scotish, :level
   end
end	
end
