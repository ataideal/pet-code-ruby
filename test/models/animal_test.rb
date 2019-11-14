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

require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
