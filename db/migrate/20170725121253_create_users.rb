class CreateUsers < ActiveRecord::Migration[5.1]
    def change
  	execute <<-SQL
    CREATE TYPE user_roles AS ENUM ('job_seeker', 'recruiter','moderator');
  SQL
    create_table :users do |t|
    	t.column :roles, :user_roles
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.string :password
    	t.string :mobile_num


      t.timestamps
    end
  end
end