class UserClassificationsController < ApplicationController
  def index
    @user_classifications = UserClassification.all
  end

  def show
    @user_classification = UserClassification.find_by(id: params[:id])
  end

  def new
    @user_classification = UserClassification.new
  end

  def edit
    @user_classification = UserClassification.find_by(id: params[:id])
  end

  def create
    @user_classification = UserClassification.new(user_classification_params)
    if @user_classification.save # => Validation
      redirect_to @user_classification
    else
      render 'new'
    end
  end

  def update
    @user_classification = UserClassification.find_by(id: params[:id])
    if @user_classification.update(user_classification_params) # => Validation
      redirect_to @user_classification
    else
      render 'edit'
    end
  end

  def destroy
    @user_classification = UserClassification.find(params[:id]).destroy
    redirect_to user_classifications_url
  end

  private

  def user_classification_params
    params.require(:user_classification).permit(:user_classification_name)
  end
end
