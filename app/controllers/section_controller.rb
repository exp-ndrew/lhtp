class SectionController < ApplicationController

  def new
    render('section/new.html.erb')
  end

  def create
    @new_section = Section.create({name: params[:name], number: params[:number]})
    @section = Section.all
    redirect_to('/')
  end

  def destroy
    lessons_to_update = Lesson.where(:section_id => @section_to_delete.id)
    @sections = Section.all
    @section_to_delete = Section.find_by(id: params[:id])
    @section_to_delete.destroy
    redirect_to('/')
    lessons_to_update.each do |i|
      i.update(:section_id => nil)
    end
  end

  def edit
    @sections = Section.all
    @lessons = Lesson.all
    @section = Section.find_by(:id => params[:id])
    render('section/edit.html.erb')
  end

  def update
    @section = Section.find_by(id: params[:id])
    @section.name = params[:name]
    @section.number = params[:number]
    @section.save
    redirect_to('/')
  end
end
