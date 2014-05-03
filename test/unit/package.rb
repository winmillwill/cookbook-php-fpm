require_relative '../spec_helper.rb'

describe 'php-fpm::default' do
  let(:chef_run) { ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)}

  it 'installs php-fpm' do
    expect(chef_run).to install_package('php5-fpm')
  end

  let(:chef_run) { ChefSpec::Runner.new(platform: 'centos', version: '6.4').converge(described_recipe)}

  it 'installs php-fpm' do
    expect(chef_run).to install_package('php-fpm')
  end
end
