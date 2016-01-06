require "serverspec"

set :backend, :exec

describe "timezone" do
  describe package("tzdata") do
    it { is_expected.to be_installed }
  end

  describe file("/etc/timezone") do
    it { is_expected.to contain "Australia/Sydney" }
  end
end
