require 'pry'
class LessonController < ApplicationController

  def index
    @lessons = Lesson.all
    render('lesson/index.html.erb')
  end

  def show
    @lesson = Lesson.find_by(id: params[:id])
    render('lesson/show.html.erb')
  end

  def new
    render('lesson/new.html.erb')
  end

  def create
    @new_lesson = Lesson.create({name: params[:name], text: params[:text], number: params[:number]})
    @lessons = Lesson.all
    redirect_to('/')
  end

  def delete
    @lessons = Lesson.all
    @lesson_to_delete = Lesson.find_by(id: params[:id])
    @lesson_to_delete.destroy
    redirect_to('/')
  end

  def edit
    @lessons = Lesson.all
    @lesson = Lesson.find_by(id: params[:id])
    render('lesson/edit.html.erb')
  end

  def update
    @lessons = Lesson.all
    @lesson = Lesson.find_by(id: params[:id])
    @lesson.name = params[:name]
    @lesson.text = params[:text]
    @lesson.number = params[:number]
    @lesson.save
    redirect_to('/')
  end

  def next
    @lessons = Lesson.all
    @current_lesson = Lesson.find_by(id: params[:id])
    sorted_lessons = @lessons.sort_by{ |i| i.number}
    sorted_lessons.each_with_index do |i, index|
      if i.id == @current_lesson.id
        @next_lesson = sorted_lessons[index + 1]
      end
    end
    if @next_lesson == nil
      redirect_to('/')
    else
      redirect_to("/lessons/#{@next_lesson.id}")
    end
  end



  def previous
    @lessons = Lesson.all
    @current_lesson = Lesson.find_by(id: params[:id])
    sorted_lessons = @lessons.sort_by{ |i| i.number }
    sorted_lessons.each_with_index do |i, index|
      if i.id == @current_lesson.id
        @next_lesson = sorted_lessons[index - 1]
      end
    end
   if @next_lesson == sorted_lessons[-1]
     redirect_to('/')
   else
     redirect_to("/lessons/#{@next_lesson.id}")
   end
  end
end
