class RatingController < ApplicationController

  ##RATINGS - polymorphic
  
	post '/ratings' do
		authorize
    user = current_user
    @ratable_id = params[:rating][:ratable_id]
    @ratable_type = params[:rating][:ratable_type]
    @rating_path = params[:rating][:rating_path]
    @rating = Rating.create(user: user, rate: params[:rating][:rate], ratable_id: @ratable_id, ratable_type: @ratable_type)
		redirect "/#{@rating_path}/#{@ratable_id}"
	end

  # get '/ratings/:id/edit' do
  #   @rating = Rating.find_by(id: params[:id])
  #   auth_edit(@rating)
  #     erb :"rating/edit"
  # end


  # patch '/ratings/:id' do
  #   @ratable_id = params[:rating][:ratable_id]
  #   @ratable_type = params[:rating][:ratable_type]
  #   rate_path

  #   @rating = Rating.find_by(id: params[:id])
  #   auth_edit(@rating)
  #   @rating.update(rate: params[:rating][:rate])
  #     redirect "/#{@rate_path}/#{@ratable_id}"
  # end


  # delete '/ratings/:id' do
  #   @ratable_id = params[:rating][:ratable_id]
  #   @ratable_type = params[:rating][:ratable_type]
  #   rate_path

  #   @rating = Rating.find_by(id: params[:id])
  #   auth_edit(@rating)
  #   @rating.delete
  #   redirect "/#{@rate_path}"
  # end





end