# == Schema Information
#
# Table name: links
#
#  id          :bigint           not null, primary key
#  clicked_on  :integer
#  created_by  :integer
#  description :string
#  link        :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  dir_id      :integer
#
class Link < ApplicationRecord
end
