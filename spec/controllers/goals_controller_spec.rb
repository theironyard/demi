require 'rails_helper'

describe GoalsController do
  render_views

  let(:goal) { create :goal }

  it 'lets anyone see goals' do
    as :peasant

    get :show, id: goal.id
    expect( response.json.description ).to eq goal.description
  end

  it 'lets admins update goals' do
    as :admin

    patch :update, id: goal.id, goal: { description: 'Updated description' }
    get :show, id: goal.id
    expect( response.json.description ).to eq 'Updated description'
  end

  it 'lets admins delete goals' do
    as :admin

    delete :destroy, id: goal.id
    get :show, id: goal.id
    expect( response ).to be_missing
  end
end
