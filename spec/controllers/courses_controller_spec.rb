require 'rails_helper'


describe CoursesController do
  render_views

  let(:course) { create :course }

  include_examples 'default authorization' do
    let(:object) { course }
  end


  it 'can list courses' do
    3.times { create :course }
    as :peasant

    get :index
    expect(response.json.length).to eq 3
  end

  it 'can show a single course' do
    as :peasant
    get :show, id: course.id
    expect(response.json.name).to match /Course/
  end

  it 'can create a course' do
    as :peasant
    post :create, course: { name: 'Anguralph' }
  end

  it 'lets admins update' do
    as :admin

    patch :update, id: course.id, course: { name: 'Updated' }
    course.reload

    expect(response.json.name).to eq 'Updated'
    expect(course.name).to eq 'Updated'
  end

  it 'lets admins delete' do
    as :admin
    delete :destroy, id: course.id
    expect{ Course.find course.id }.to raise_error ActiveRecord::RecordNotFound
  end
end
