require 'rails_helper'

describe TimelinesController do
  render_views

  let(:timeline) { create :timeline }

  it 'can list timelines for a course' do
    3.times { create :timeline, course: timeline.course }
    as :peasant

    get :index, course_id: timeline.course_id
    expect(response.json.length).to eq 4
  end

  it 'can show a single timeline' do
    as :peasant
    get :show, id: timeline.id
    expect(response.json.name).to match /Timeline/
  end

  it 'requires an admin to create' do
    course = create :course
    as :peasant
    post :create, course_id: course.id, timeline: { name: 'Anguralph' }
    expect(response.status).to eq 403
  end

  it 'allows admins to create' do
    course = create :course
    as :admin
    post :create, course_id: course.id, timeline: { name: 'Anguralph' }
    expect(response.json.name).to eq 'Anguralph'
    expect(response.json.id).not_to eq nil
  end
end
