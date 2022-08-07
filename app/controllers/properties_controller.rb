# frozen_string_literal: true

require 'easy_broker_api'

# Class PropertiesController
class PropertiesController < ApplicationController
  before_action :set_easy_broker_client

  def index
    page = [1, params[:page].to_i].max
    @properties, @pagination = @easy_broker_client.properties(page:, only_published: false)
  end

  def show
    @property = @easy_broker_client.property(params[:id])
  end

  private

  def set_easy_broker_client
    @easy_broker_client = EasyBrokerAPI.new
  end
end
