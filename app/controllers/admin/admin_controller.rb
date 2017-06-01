class Admin::AdminController < ApplicationController
  layout 'admin'

  before_action -> { I18n.locale = :ru }
end
