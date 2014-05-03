require_relative '../spec_helper.rb'

describe 'php-fpm::default' do
    before do
      %w( /etc/php-fpm.d /etc/php5/fpm/pool.d ).each do |dir|
        stub_command("test -d #{dir} || mkdir -p #{dir}").and_return(true)
      end
    end

  context 'debian' do
    let(:chef_run) { ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)}

    it 'installs php5-fpm' do
      expect(chef_run).to upgrade_package('php5-fpm')
    end
  end

  context 'rhel' do
    let(:chef_run) { ChefSpec::Runner.new(platform: 'centos', version: '6.4').converge(described_recipe)}

    it 'installs php-fpm' do
      expect(chef_run).to upgrade_package('php-fpm')
    end
  end
end
