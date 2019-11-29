class Api::V1::UsersController < Api::V1::ApiController
  def index
    render json: current_user
  end

  def get_careers
    render json: current_user.careers
  end

  def get_requirements
    user_requirements = current_user.user_requirements
    requirements = user_requirements.map { |user_req| user_req.requirement }

    render json: requirements
  end

  def get_finished_requirements
    user_requirements = current_user.user_requirements.finished
    requirements = user_requirements.map { |user_req| user_req.requirement }

    render json: requirements
  end
end
