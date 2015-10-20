class RaterController < ApplicationController

  def create
    if user_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_user, params[:dimension]

      render json:{ratting: (obj.overall_avg(current_user) == 0.0 ? params[:score] : obj.overall_avg(current_user)), success: true}
    else
      render :json => false
    end
  end
end
