# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string
#  identity   :string
#  birthdate  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ApplicationRecord
  has_many :animals, foreign_key: "owner_id", dependent: :destroy

  # Validations
  validates :name,
            presence: true,
            length: { maximum: 255 }

  validates :identity,
            presence: true,
            length: { is: 9 },
            numericality: { only_integer: true }

  validates :birthdate,
            presence: true


  def person_mensal_cost
    self.animals.map(&:mensal_cost).inject(0, :+)
  end

  def self.people_ranking_by_mensal_cost
    Person.joins(:animals).group(:name).order('sum_mensal_cost DESC').sum(:mensal_cost)
  end

  def self.each_person_3_month_forecast
    Person.all.map do |p|
      {
          p.name => p.person_mensal_cost * 3
      }
    end
  end

  def birthdate=(value)
    translated_months = [
        {en: 'january', pt_br: 'janeiro'},
        {en: 'february', pt_br: 'fevereiro'},
        {en: 'march', pt_br: 'março'},
        {en: 'april', pt_br: 'abril'},
        {en: 'may', pt_br: 'maio'},
        {en: 'june', pt_br: 'junho'},
        {en: 'july', pt_br: 'julho'},
        {en: 'august', pt_br: 'agosto'},
        {en: 'september', pt_br: 'setempro'},
        {en: 'octuber', pt_br: 'outubro'},
        {en: 'november', pt_br: 'novembro'},
        {en: 'december', pt_br: 'dezembro'}
    ]
    translated_months.each do |tm|
      value.gsub!(tm[:pt_br], tm[:en])
    end
    super(Date.strptime(value,"%d de %B de %Y"))
  end
end
