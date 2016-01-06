require "spec_helper"

describe "timezone::default" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set["timezone"]["zone"] = "US/Pacific"
    end.converge(described_recipe)
  end

  it "installs tzdata" do
    expect(chef_run).to install_package("tzdata")
  end

  context "timezone is not set" do
    before do
      stub_command("diff -s /etc/localtime /usr/share/zoneinfo/`cat /etc/timezone`").and_return(2)
    end

    it "creates the cookbook file" do
      expect(chef_run).to create_file("/etc/timezone")
    end

    it "notifies update_tzdata" do
      expect(chef_run.file("/etc/timezone")).to notify("execute[update_tzdata]").to(:run).delayed
    end
  end

  context "timezone is already set" do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    it "doesn't run update_tzdata" do
      expect(chef_run).to_not run_execute("execute[update_tzdata]")
    end
  end
end
