require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :answers }
  it { should validate_confirmation_of :password }
  it { should validate_presence_of :user_name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :user_name }
  it { should validate_uniqueness_of :email }
end
