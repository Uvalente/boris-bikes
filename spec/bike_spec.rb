require 'bike'

describe Bike do
  it { is_expected.to respond_to :working?}


  it "Report a broken bike and expect it to be broken" do
    subject.report_broken
    expect(subject.working?).to eq false
  end
end
