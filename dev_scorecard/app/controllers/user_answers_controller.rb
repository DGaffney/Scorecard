class UserAnswersController < ApplicationController
  before_filter :require_user, :except => [:new, :show]
  before_filter :require_login, :only => [:new, :show]
  before_filter :get_survey

  def get_survey
    @survey = Survey.find(params[:survey_id])
  end

  # GET /user_answers
  # GET /user_answers.xml
  def index
    @user_answers = @survey.user_answers.user(current_user).sort_by {|ua| ua.answer.question.order}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_answers }
    end
  end

  # GET /user_answers/1
  # GET /user_answers/1.xml
  def show
    @user_answers = @survey.user_answers.user(current_user).sort_by {|ua| ua.answer.question.order}
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_answer }
    end
  end

  # GET /user_answers/new
  # GET /user_answers/new.xml
  def new
    debugger
    g = ""
    g = true
    @user_answer = @survey.user_answers.new
    @survey = params[:survey_id].nil? ? nil : Survey.find(params[:survey_id])
    @case = params[:case_id].nil? ? nil : Case.find(params[:case_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_answer }
      format.js {
        render :update do |page|
          page.replace_html 'surveyFormWrapper', :partial => "/user_answers/form"
        end
      }
      
    end
  end

  # GET /user_answers/1/edit
  def edit
    debugger
    g = ""
    g = true
    
    @user_answer = UserAnswer.find(params[:id])
  end

  # POST /user_answers
  # POST /user_answers.xml
  def create
    debugger
    g = ""
    @case = current_user.associate_case(params)
    errors = []
    if params[:answer]
     @answers = params[:answer].values.collect { |answer| UserAnswer.new(:user_id => current_user.id,
                                                                          :answer_id => answer,
                                                                          :survey_id => @survey.id,
                                                                          :case_id => @case.nil? ? nil : @case.id)}
     errors << "Please answer all questions." unless @answers.size == @survey.questions.with_answers.length
     @answers.all? {|answer| errors << answer.errors unless answer.valid? } if errors.empty?
     @answers.each {|answer| errors << answer.errors unless answer.save } if errors.empty?
    else
      errors << "Please answer all questions."
    end

   respond_to do |format|
      if errors.empty?
        flash[:notice] = 'Answer was successfully created.'
        format.html { 
          if params[:case_id]
            redirect_to(request.referrer) 
          else
            redirect_to(case_url(@case.id))
          end
        }
        format.xml  { render :xml => @answer, :status => :created, :location => @answer }
      else
        flash[:error] = errors.join("/n")
        format.html { redirect_to(request.referrer)}
        format.xml  { render :xml => @user_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_answers/1
  # PUT /user_answers/1.xml
  def update
    @user_answer = UserAnswer.find(params[:id])

    respond_to do |format|
      if @user_answer.update_attributes(params[:user_answer])
        flash[:notice] = 'UserAnswer was successfully updated.'
        format.html { redirect_to([ @survey, @user_answer ])}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_answers/1
  # DELETE /user_answers/1.xml
  def destroy
    @user_answer = UserAnswer.find(params[:id])
    @user_answer.destroy

    respond_to do |format|
      format.html { redirect_to(user_answers_url) }
      format.xml  { head :ok }
    end
  end
end
