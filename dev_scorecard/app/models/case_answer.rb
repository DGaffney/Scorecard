class CaseAnswer < ActiveRecord::Base
  belongs_to :case
  belongs_to :answer
end
