# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @current_user = current_user
  end

  def about; end

  def contact; end
end
