require 'rails_helper'

describe Course do
  it 'adds a slug on save' do
    c = Course.create! name: 'Ember and Backbone and Stuff'
    expect( c.slug ).to eq 'ember-and-backbone-and-stuff'
  end
end
