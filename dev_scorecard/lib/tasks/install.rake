namespace :scorecard do
  desc "Install ScoreCard (To be run AFTER editing config/database.yml)"
  task :install => :environment do

    puts "\n-- Installing Fair Use Calculator Survey\n--"

    # Set up the database
    Rake::Task["db:schema:load"].invoke

    # Create initial Survey
    Survey.create(:name => "Fair Use Calculator", :created_at => Time.new, :updated_at => Time.new)

    # Create initial Questions/Answers
    survey = Survey.find(1)
    if survey
      begin
        question1 = Question.create(:survey_id => survey.id, :content => "Purpose of the new work", :order => 1, :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question1.id, :content => "Criticism", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question1.id, :content => "Commentary", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question1.id, :content => "News Reporting", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question1.id, :content => "Teaching", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question1.id, :content => "Scholarship", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question1.id, :content => "Research", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question1.id, :content => "Personal Copy", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question1.id, :content => "Other", :created_at => Time.new, :updated_at => Time.new)
        question2 = Question.create(:survey_id => survey.id, :content => "Character of the new work", :order => 2, :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question2.id, :content => "Commercial", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question2.id, :content => "Non-Commercial", :created_at => Time.new, :updated_at => Time.new)
        question3 = Question.create(:survey_id => survey.id, :content => "Use of the original work in the new work", :order => 3, :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question3.id, :content => "Transformation", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question3.id, :content => "Parody", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question3.id, :content => "Neither Transformation or Parody", :created_at => Time.new, :updated_at => Time.new)
        question4 = Question.create(:survey_id => survey.id, :content => "Nature of the original work", :order => 4, :created_at => Time.new, :updated_at => Time.new)
        questiona = Question.create(:survey_id => survey.id, :content => "A", :parent_id => question4, :order => 5, :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => questiona.id, :content => "Published", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => questiona.id, :content => "Unpublished", :created_at => Time.new, :updated_at => Time.new)
        questionb = Question.create(:survey_id => survey.id, :content => "B", :parent_id => question4, :order => 6, :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => questionb.id, :content => "Creative", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => questionb.id, :content => "Not Creative", :created_at => Time.new, :updated_at => Time.new)
        question5 = Question.create(:survey_id => survey.id, :content => "Amount of the original work being used", :order => 7, :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question5.id, :content => "Most of it", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question5.id, :content => "Just the essential parts", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question5.id, :content => "Most of it and the essential parts", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question5.id, :content => "Neither most of the work nor the essential parts", :created_at => Time.new, :updated_at => Time.new)
        question6 = Question.create(:survey_id => survey.id, :content => "Financial impact of the new work", :order => 8, :bonus => 2, :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question6.id, :content => "Damages a current or potential market for the original work", :created_at => Time.new, :updated_at => Time.new)
                    Answer.create(:question_id => question6.id, :content => "Doesn't damage a current or potential market for the original work", :created_at => Time.new, :updated_at => Time.new)

      rescue
      end
    end

    puts "\n-- Installation Complete \n-- Try running the application with 'ruby script/server'\n-- Visit /settings to modify site settings, or /content to edit or publish site content.\n"
  end
end