class CreatePersonas < ActiveRecord::Migration[7.1]
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :apellido
      t.string :username
      t.string :sexo
      t.date :fecha_nacimiento
      t.string :correo
      t.string :numero
      t.string :contraseña

      t.timestamps
    end
  end
end
