class CaseAnswersController < ApplicationController
  # GET /case_answers
  # GET /case_answers.xml
  def index
    @case_answers = @survey.case_answers.user(current_user).sort_by {|ca| ca.answer.question.order}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @case_answers }
    end
  end

  # GET /case_answers/1
  # GET /case_answers/1.xml
  def show
    @case_answers = CaseAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @case_answers }
    end
  end

  # GET /case_answers/new
  # GET /case_answers/new.xml
  def new
    @case = Case.find(params[:case_id])
    @survey = Survey.find(params[:survey_id])
    @case_answers = @survey.case_answers.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @case_answers }
    end
  end

  # GET /case_answers/1/edit
  def edit
    @case = Case.find(params[:case_id])
    @survey = Survey.find(params[:survey_id])
    @case_answers = @survey.case_answers.new
  end

  # POST /case_answers
  # POST /case_answers.xml
  def create
    debugger
    g = ""
    g = true
    @case = Case.find(params[:case_id])
    @survey = Survey.find(params[:survey_id])
    @survey.verify_and_update(params, @case)
    errors = []
    if params[:answer]
    @answers = params[:answer].values.collect { |answer| CaseAnswer.new(:case_id => @case.id,
                                                                         :answer_id => answer,
                                                                         :survey_id => @survey.id)}
    errors << "Please answer all questions." unless @answers.size == @survey.questions.with_answers.length
    @answers.all? {|answer| errors << answer.errors unless answer.valid? } if errors.empty?
    @answers.each {|answer| errors << answer.errors unless answer.save } if errors.empty?
    else
     errors << "Please answer all questions."
    end

    respond_to do |format|
     if errors.empty?
       flash[:notice] = 'Answer was successfully created.'
       format.html { redirect_to(survey_user_answer_path(@survey,:id => @case)) }
       format.xml  { render :xml => @answer, :status => :created, :location => @answer }
     else
       flash[:error] = errors.join("/n")
       format.html { redirect_to(new_survey_user_answer_path(@survey))}
       format.xml  { render :xml => @case_answer.errors, :status => :unprocessable_entity }
     end
    end
  end

  # PUT /case_answers/1
  # PUT /case_answers/1.xml
  def update
    @case_answers = CaseAnswer.find(params[:id])

    respond_to do |format|
      if @case_answers.update_attributes(params[:case_answers])
        flash[:notice] = 'CaseAnswer was successfully updated.'
        format.html { redirect_to(@case_answers) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @case_answers.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /case_answers/1
  # DELETE /case_answers/1.xml
  def destroy
    @case_answers = CaseAnswer.find(params[:id])
    @case_answers.destroy

    respond_to do |format|
      format.html { redirect_to(case_answers_url) }
      format.xml  { head :ok }
    end
  end
end
