# == Schema Information
#
# Table name: directories
#
#  id         :bigint           not null, primary key
#  created_on :datetime
#  image_url  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Directory < ApplicationRecord
end
