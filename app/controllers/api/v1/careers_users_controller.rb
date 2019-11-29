class Api::V1::CareersUsersController < Api::V1::ApiController

  # POST /api/v1/careers_users
  def create
    @career_user = CareersUsers.new(career_user_params)

    if @career_user.save
      render json: @career_user, status: :created
    else
      render json: @career_user.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /api/v1/careers_users/1
  def update
    if @career_user.update(career_user_params)
      render json: @career_user
    else
      render json: @career_user.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def career_user_params
    params.require(:career_user).permit(:user_id, :career_id)
  end
end
