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
    @new_lesson = Lesson.create({name: params[:name], text: params[:text]})
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
    @lesson.save
    redirect_to('/')
  end
end
