
class Admin::BaseController < ApplicationController
  before_filter :authorise_admin!
end
