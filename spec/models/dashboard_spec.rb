require 'rails_helper'
require_relative '../support/devise'
require_relative '../factories/user'
require_relative '../support/controller_macros'

RSpec.describe Dashboard, type: :model do

  context 'validation test' do
    it 'ensures title presence' do
      dashboard = Dashboard.new(title:'Dashboard 1', description: 'some info', position: 1)
      dashboard.user = create(:user)
      dashboard.save
      expect(dashboard).to be_present
    end
    it 'title not present' do
      dashboard = Dashboard.new()
    end
  end
end
