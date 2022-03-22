class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :vet

  # Activity 1 => Building Aggregate Class / Instance Methods

  # Class Methods

  # Return earliest appointment
  def self.earliest
    #return entire appointment jinstance
    #self.order(:date).first

    #return date of earliest appointment Instance
    self.all.minimum(:date)
  end

  # Return latest appointment
  def self.latest
    #self.order(:date).latest
    #self.order(:date).last
    self.all.maximum(:date)
  end

  # Instance Methods

  # Return appointment patient's name
  def get_patient_name
    binding.pry
    self.patient.name
  end

  # Return appointment vet's name

  def get_vet_name
    self.vet.vet_name
  end
end
