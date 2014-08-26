class Lesson < ActiveRecord::Base
  validates :name, :presence => true
  validates :text, :presence => true

  def next
    @lessons = Lesson.all
    @current_lesson = Lesson.find_by(id: params[:id])
    @next_index = nil
    Lesson.all.each_with_index do |lesson, index|
      if lesson.id == @current_lesson.id
        @next_index = index.to_i + 1
      end
    end
    if @next_index > Lesson.all.length - 1
      redirect_to('/')
    else
      @next_lesson = Lesson.all[@next_index]
      redirect_to("/lessons/#{@next_lesson.id}")
    end
  end



  def previous
    @lessons = Lesson.all
    @current_lesson = Lesson.find_by(id: params[:id])
    @next_index = nil
    Lesson.all.each_with_index do |lesson, index|
      if lesson.id == @current_lesson.id
        @next_index = index.to_i - 1
      end
    end
    if @next_index < 0
      redirect_to('/')
    else
      @next_lesson = Lesson.all[@next_index]
      redirect_to("/lessons/#{@next_lesson.id}")
   end
  end

end
