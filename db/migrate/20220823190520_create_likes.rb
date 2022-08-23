class CreateLikes < ActiveRecord::Migration[7.0]
  # rubocop:disable Style/SymbolProc
  def change
    create_table :likes do |t|
      t.timestamps
    end
  end
  # rubocop:enable Style/SymbolProc
end
