Sequel.migration do
  up do
    create_table(:potlucks) do
      primary_key :id
      String :description, null: false
      String :title, null:false
      String :location
      Date   :potluck_date
      Time   :start_time
      Time   :end_time
    end
  end
end
