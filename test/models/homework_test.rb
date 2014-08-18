# == Schema Information
#
# Table name: homeworks
#
#  id               :integer          not null, primary key
#  link_to_homework :string(255)
#  finished         :boolean
#  help             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer
#  assignment_id    :integer
#

require 'test_helper'

class HomeworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
