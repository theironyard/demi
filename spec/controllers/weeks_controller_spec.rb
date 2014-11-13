require 'rails_helper'

describe WeeksController do
  render_views

  let(:week) { create :week }
  let(:week_params) { {
    id:   week.timeline_id,
    week: week.number
  } }

  it 'can show a week' do
    as :peasant
    get :show, week_params

    %w( resources goals assignments ).each do |key|
      expect( response.json[key].length ).to be > 1
    end
  end

  it 'can add an assignment to a week' do
    as :peasant
    post :assignments, week_params.merge(assignment: { description: 'New assignment' })

    get :show, week_params
    expect( response.json.assignments ).to include 'New assignment'
  end

  it 'can add a goal to a week' do
    as :peasant
    post :goals, week_params.merge(goal: { description: 'New goal' })

    get :show, week_params
    expect( response.json.goals ).to include 'New goal'
  end

  it 'can add a resource to a week' do
    as :peasant
    new_resource = {
      description: 'New Resource',
      url: Faker::Internet.url
    }
    post :resources, week_params.merge(resource: new_resource)

    get :show, week_params
    added_resource = response.json.resources.find { |r| r.description == 'New Resource' }
    expect( added_resource.url ).to eq new_resource[:url]
  end
end
