#Chef::Log.info("The mysql monitoring password is: ‘#{monitoring_pw}’")
#http://iterm2.googlecode.com/files/iTerm2-1_0_0_20120726.zip
#

remote_file "/tmp/1Password-3.8.20.zip" do
  source "https://d13itkw33a7sus.cloudfront.net/dist/1P/mac/1Password-3.8.20.zip"
  checksum "56aef138f06"
end

execute "install 1Password" do
  command "unzip -d /Applications/ /tmp/1Password-3.8.20.zip"
  not_if do File.directory?("/Applications/1Password.app") end
end
