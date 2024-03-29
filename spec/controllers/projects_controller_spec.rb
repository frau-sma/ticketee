require 'spec_helper'

describe ProjectsController do
  let(:user) do
    create_user!
  end

  let(:project) do
    Factory(:project)
  end

  context 'standard users' do
    {'new' => 'get',
     'create' => 'post',
     'edit' => 'get',
     'update' => 'put',
     'destroy' => 'delete'}.each do |action, method|
      it "cannot access the #{action} action" do
        sign_in(:user, user)
        send(method, action.dup, :id => project.id)
        response.should redirect_to(root_path)
        flash[:alert].should == 'You must be an admin to do that.'
      end
    end
  end

  it 'displays an error for a missing project' do
    get :show, :id => 'not-here'
    response.should redirect_to(projects_path)
    flash[:alert].should == 'The project you were looking for does not exist.'
  end
end
