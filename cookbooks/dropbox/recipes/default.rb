#Chef::Log.info("The mysql monitoring password is: ‘#{monitoring_pw}’")
#http://iterm2.googlecode.com/files/iTerm2-1_0_0_20120726.zip
#

#remote_file "/tmp/Dropbox 1.4.20.dmg" do
#  source "https://ddr3luum8vl5r.cloudfront.net/Dropbox%201.4.20.dmg"
#  checksum "ea3a585c61ede"
#end

#execute "install 1Password" do
#  command "unzip -d /Applications/ /tmp/1Password-3.8.20.zip"
#  not_if do File.directory?("/Applications/1Password.app") end
#end
#
dmg_package "Dropbox" do
  volumes_dir "Dropbox Installer"
  source "http://www.dropbox.com/download?plat=mac"
  checksum "ea3a585c61ede"
  action :install
end
