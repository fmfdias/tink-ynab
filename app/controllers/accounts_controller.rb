# frozen_string_literal: true

class AccountsController < ApplicationController
  # To add force user to authenticate, uncomment bellow.
  # before_action :require_user!

  def index
    render json: YnabAccount.all, root: nil
  end
end
