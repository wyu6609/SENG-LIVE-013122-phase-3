class Patient < ActiveRecord::Base
  belongs_to :clinic

  has_many :appointments
  has_many :vets, through: :appointments

  # Activity 2 => Building Aggregate Class / Instance Methods

  # Class Methods

  # Return all patient names
  def self.all_patient_names
    binding.pry
    self.all.pluck(:name)
  end

  # Return all patient species
  def self.all_patient_species
    binding.pry
    self.all.pluck(:species)
  end

  # Return all patient ages
  def self.all_patient_ages
    binding.pry
    self.all.pluck(:ages)
  end

  # Return oldest patient
  def self.oldest
    self.all.max_by { |p| p.age }
    #order
    # self.all.order(:age).last
  end

  # Return youngest patient
  def self.youngest
    binding.pry
    self.all.min_by { |p| p.age }
    #order
    #self.all.order(:age).first
  end

  # Instance Methods

  # Return patient's first Vet's name
  def get_first_vet_name
    binding.pry
    self.vets.first.vet_name
    #self.vets.pluck(:vet_name).first
  end

  # Return patient's vet's names
  def get_vet_names
    self.vets.pluck(:vet_name)
  end

  # Return patient's appointment dates
  def get_appt_dates
    self.appointments.pluck(:date)
  end

  # Return patient's number of vets
  def vet_count
    self.vets.count
  end

  # Return patient's number of appointments
  def appt_count
    self.appointments.count
  end
end

