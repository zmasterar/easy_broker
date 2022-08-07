# frozen_string_literal: true

require 'easy_broker_api'

# Class LeadsController
class LeadsController < ApplicationController
  before_action :set_easy_broker_client

  def create
    puts lead_params
    res = @easy_broker_client.create_lead(lead_params)
    if res.success?
      redirect_to property_path(lead_params[:property_id]), notice: 'We will contact you shortly'
    else
      redirect_to property_path(lead_params[:property_id]), alert: JSON.parse(res.body)['error']
    end
  end

  private

  def lead_params
    params.permit(:name, :email, :phone, :message, :property_id, :source)
  end

  def set_easy_broker_client
    @easy_broker_client = EasyBrokerAPI.new
  end
end
