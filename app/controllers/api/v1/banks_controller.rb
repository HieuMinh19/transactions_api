# frozen_string_literal: true

class Api::V1::BanksController < Api::V1::ApplicationController
  before_action :set_bank, only: [:show, :update, :destroy]

  # GET /banks
  def index
    @banks = Bank.paginate(page: params[:page], per_page: 10)

    render_success data: @banks
  end

  # GET /banks/1
  def show
    render_success data: @bank
  end

  # POST /banks
  def create
    @bank = Bank.new(bank_params)
    return render_success data: @bank, status: :created if @bank.save

    render_failure errors: @bank.errors
  end

  # PATCH/PUT /banks/1
  def update
    render_success data: @bank if @bank.update(bank_params)

    render_failure errors: @bank.errors
  end

  # DELETE /banks/1
  def destroy
    @bank.destroy
    render_success data: {messgage: "Delete company success"}
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bank
    @bank = Bank.find(params[:id])
  rescue
    render_failure errors: {messgage: "can't find bank with id= #{params[:id]}"}
  end

  # Only allow a list of trusted parameters through.
  def bank_params
    params.require(:bank).permit(:name)
  end
end
