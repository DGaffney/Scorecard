class SurveyAnswersController < ApplicationController
  # GET /survey_answers
  # GET /survey_answers.xml
  def index
    @survey_answers = SurveyAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @survey_answers }
    end
  end

  # GET /survey_answers/1
  # GET /survey_answers/1.xml
  def show
    @survey_answer = SurveyAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey_answer }
    end
  end

  # GET /survey_answers/new
  # GET /survey_answers/new.xml
  def new
    @survey_answer = SurveyAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey_answer }
    end
  end

  # GET /survey_answers/1/edit
  def edit
    @survey_answer = SurveyAnswer.find(params[:id])
  end

  # POST /survey_answers
  # POST /survey_answers.xml
  def create
    @survey_answer = SurveyAnswer.new(params[:survey_answer])

    respond_to do |format|
      if @survey_answer.save
        flash[:notice] = 'SurveyAnswer was successfully created.'
        format.html { redirect_to(@survey_answer) }
        format.xml  { render :xml => @survey_answer, :status => :created, :location => @survey_answer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /survey_answers/1
  # PUT /survey_answers/1.xml
  def update
    @survey_answer = SurveyAnswer.find(params[:id])

    respond_to do |format|
      if @survey_answer.update_attributes(params[:survey_answer])
        flash[:notice] = 'SurveyAnswer was successfully updated.'
        format.html { redirect_to(@survey_answer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_answers/1
  # DELETE /survey_answers/1.xml
  def destroy
    @survey_answer = SurveyAnswer.find(params[:id])
    @survey_answer.destroy

    respond_to do |format|
      format.html { redirect_to(survey_answers_url) }
      format.xml  { head :ok }
    end
  end
end
