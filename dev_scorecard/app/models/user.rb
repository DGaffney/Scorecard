class User < ActiveRecord::Base
  acts_as_authentic
  has_many :user_answers  
  before_create :assign_role
  
  def anonymous?
    self.login.include?('anonymous')
  end
  
  def assign_role
    self.role = "user"
  end
  
  def user_case_answers(case_id)
    if case_id.class == Integer || case_id.class == Fixnum
      return UserAnswer.find(:all, :conditions => {:case_id => case_id, :user_id => self.id})
    elsif case_id.class == Case
      return UserAnswer.find(:all, :conditions => {:case_id => case_id.id, :user_id => self.id})
    else return nil
    end
  end
  
  def answer(case_id, answer_id)
    return UserAnswer.find(:first, :conditions => {:case_id => case_id, :user_id => self.id, :answer_id => answer_id})
  end
  
  def verify_and_update(params, kase)
    if params[:answer]
      if Survey.find(params[:survey_id]).questions.with_answers.length == params[:answer].length
        self.user_case_answers(kase.id).collect{|ca| ca.destroy}
      end
    end
  end
  
  def finished_survey?(survey, kase)
    case_answers = self.user_case_answers(kase.id)
    return case_answers.nil? ? false : case_answers.length == survey.questions.with_answers.length
  end
  
  def associate_case(params)
    debugger
    kase = nil
    if !params[:case_id].nil?
      kase = Case.find(params[:case_id])
      self.verify_and_update(params, kase)
    else
      kase = Case.new
      kase.title = params[:case][:name].nil? ? self.name+Time.now.to_i.to_s : params[:case][:name]
      kase.user_id = self.id
      kase.survey_id = params[:survey_id]
      kase.save
    end
    return kase
  end
end
