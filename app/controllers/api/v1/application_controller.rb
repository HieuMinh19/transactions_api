# frozen_string_literal: true

class Api::V1::ApplicationController < ActionController::API
  def render_success data: data, status: status = :ok 
    render json: {data: data} , status: status
  end

  def render_failure errors: errors, status: status = :unprocessable_entity
    render json: {errors: errors}, status: status
  end
end
