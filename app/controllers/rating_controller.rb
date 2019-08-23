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

end