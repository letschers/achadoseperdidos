class CreateUsuarios < ActiveRecord::Migration[5.2]
	def change

		create_table :usuarios do |t|
			t.string :email, null: false
			t.string :nome, null: false
			t.string :username, null: false

			t.timestamps
		end

		remove_column :dados, :pessoa, :string,  null: false

		add_reference :dados, :usuario, index: true, foreign_key: true

	end
end
