class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :users
  has_many :user_answers
  has_many :case_answers
  has_many :cases
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a['content'].blank? }, :allow_destroy => true
  
  def verify_and_update(params, kase, answer_set="case_answers")
    if params[:answer]
      if self.questions.with_answers.length == params[:answer].length
        kase.send(answer_set).collect{|ca| ca.destroy}
      end
    end
  end
end
