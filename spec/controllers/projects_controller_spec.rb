require 'spec_helper'

describe ProjectsController do
  it 'displays an error for a missing project' do
    get :show, :id => 'not-here'
    response.should redirect_to(projects_path)
    flash[:alert].should == 'The project you were looking for does not exist.'
  end
end
