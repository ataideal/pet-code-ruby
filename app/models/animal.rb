# == Schema Information
#
# Table name: animals
#
#  id          :bigint           not null, primary key
#  name        :string
#  mensal_cost :float
#  animal_type :string
#  owner_id    :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Animal < ApplicationRecord
  # Associations
  belongs_to :owner, class_name: 'Person'

  # Validations
  validates :name,
            presence: true,
            length: { maximum: 255 }

  validates :mensal_cost,
            presence: true

  validates :animal_type,
            presence: true,
            length: { maximum: 255 }

  validates_associated :owner
  validate :owner_validations

  def self.avarage_mensal_cost_by_type type
    Animal.where(animal_type: type).average(:mensal_cost)
  end

  def self.how_many_by_type type
    Animal.where(animal_type: type).count
  end

  def self.owner_names_by_type type
    Animal.joins(:owner).where(animal_type: type).pluck('people.name')
  end

  private
  def owner_validations
    if animal_type == 'Gato'
      if owner_name_start_with_a?
        errors.add(:owner, "People who name start with 'A' can not have a cat")
        return
      end
    elsif animal_type == 'Andorinha'
      unless owner_over_18?
        errors.add(:owner, 'People must be over 18 to have swallow')
        return
      end
    end

    unless owner_have_less_equal_then_1000_mensal_cost?
      errors.add(:owner, 'People must have less than 1000 cost to have more animals')
    end
  end

  def owner_over_18?
    (Date.today - 18.years) > owner.birthdate
  end

  def owner_have_less_equal_then_1000_mensal_cost?
    self.owner.person_mensal_cost <= 1000
  end

  def owner_name_start_with_a?
    self.owner.name.first.upcase == "A"
  end


end
