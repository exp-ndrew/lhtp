class SectionController < ApplicationController

  def new
    render('section/new.html.erb')
  end

  def create
    @new_section = Section.create({name: params[:name], number: params[:number]})
    @section = Section.all
    redirect_to('/')
  end
end
