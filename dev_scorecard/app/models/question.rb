class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a['content'].blank? }, :allow_destroy => true
  named_scope :with_answers, :joins => :answers, :group => 'questions.id', :conditions => ['questions.id = answers.question_id']
  named_scope :order, :order => "order"
  validates_uniqueness_of :order, :scope => :survey_id
  def self.get_answers
    self.find(:all, :include => :answers, :conditions => ["questions.id = answers.question_id"] )
  end

end
