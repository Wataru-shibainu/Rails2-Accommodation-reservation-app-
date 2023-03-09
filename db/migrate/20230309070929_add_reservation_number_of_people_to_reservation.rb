class AddReservationNumberOfPeopleToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :reservation_number_of_people, :integer
  end
end
