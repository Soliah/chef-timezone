require "spec_helper"

describe "timezone::default" do
  before do
    stub_command("grep US/Pacific /etc/timezone").and_return(1)
  end

  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set["timezone"]["zone"] = "US/Pacific"
    end.converge(described_recipe)
  end

  it "installs tzdata" do
    expect(chef_run).to install_package("tzdata")
  end

  it "creates the cookbook file" do
    expect(chef_run).to create_template("/etc/timezone")
  end

  it "notifies update_tzdata" do
    expect(chef_run.template("/etc/timezone")).to notify("execute[update_tzdata]").to(:run).delayed
  end
end
