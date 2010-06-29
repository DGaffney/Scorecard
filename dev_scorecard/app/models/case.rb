class Case < ActiveRecord::Base
  has_many :case_answers
  has_many :user_answers
  belongs_to :survey
  belongs_to :user
  belongs_to :original_resource, :class_name => "Resource", :foreign_key => "original_resource_id"
  belongs_to :derivative_resource, :class_name => "Resource", :foreign_key => "derivative_resource_id"
  
  accepts_nested_attributes_for :original_resource, :reject_if => lambda { |a| a["uploaded_data"].nil? }, :allow_destroy => true
  accepts_nested_attributes_for :derivative_resource, :reject_if => lambda { |a| a["uploaded_data"].nil? }, :allow_destroy => true
  
  after_create :associate_resources

  def associate_resources
    if !self.original_resource.nil?
      self.original_resource.case_id = self.id
      self.original_resource.save
      self.original_resource_id = self.original_resource.id
      self.save
    end
    if !self.derivative_resource.nil?
      self.derivative_resource.case_id = self.id
      self.derivative_resource.save
      self.derivative_resource_id = self.derivative_resource.id
      self.save
    end
  end
  
  def raw_value
    if !self.case_answers.empty?
      return self.case_answers.collect{|ca| ca.answer.value }.sum.to_s
    else
      return "No Case Judgement Entered"
    end
  end
end
