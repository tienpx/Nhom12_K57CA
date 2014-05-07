require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit '/static_pages/home' }

    it { should have_content('Mind Map') }
    it { should have_title('| Home') }
  end
end