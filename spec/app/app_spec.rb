require 'spec_helper'

# yumのリポジトリがあるかチェック
%w(base-remi php-remi php-epel).each do |pkg|
  describe yumrepo(pkg) do
    it {should exist }
  end
end

# パッケージチェック(puppetで導入したpkg)
%w(
cronie-noanacron dstat git make npm openssh-clients screen siege tree unzip wget
).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe package('cronie-anacron') do
  it { should_not be_installed }
end

# サービスチェック
%w(
httpd mysql sshd iptables
).each do |service|
  describe service(service) do
    it { should be_enabled  }
    it { should be_running  }
  end
end

# ポートチェック
%w(22 80 3306).each do |port|
  describe port(port) do
    it { should be_listening }
  end
end

#TODO: /etc/ssh/sshd_configの設定を確認する

# apacheチェック(httpd.confの中身を見る？）
describe user('apache') do
  it { should exist }
  it { should belong_to_group 'apache' }
  it { should belong_to_group 'developer' }
end
#TODO: /etc/httpd/httpd.confの設定を確認する

# phpチェック
%w(php php-cli php-common php-devel php-gd php-mbstring php-mcrypt php-mysqlnd php-pear php-pecl-apc php-pdo php-xml).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
#TODO: php.iniの設定を確認する
# php_configというリソースタイプがあるっぽい

# mysqlチェック(データベースがあるか、ユーザーがいるか？）
describe user('mysql') do
  it { should exist }
  it { should belong_to_group 'mysql' }
  it { should have_home_directory '/var/lib/mysql' }
end
#TODO: /etc/my.cnfの設定を確認する

# ローカルタイムチェック
describe file('/etc/localtime') do
  it { should be_file }
  it { should contain "JST-9" }
end

# langチェック
describe file('/etc/sysconfig/i18n') do
  it { should be_file }
  its(:content) { should match /^LANG="ja_JP.UTF-8"/ }
end

# osユーザーチェック
describe user('techtrain') do
  it { should exist }
  it { should belong_to_group 'developer' }
end
