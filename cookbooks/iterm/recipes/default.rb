puts 'iterm'

#Chef::Log.info("The mysql monitoring password is: ‘#{monitoring_pw}’")
#http://iterm2.googlecode.com/files/iTerm2-1_0_0_20120726.zip
execute "install iTerm2" do
  command <<-EOF
    curl -o iTerm2.zip http://iterm2.googlecode.com/files/iTerm2-1_0_0_20120726.zip
    unzip -d . /tmp/iTerm2.zip
    mv iTerm.app /Applications/
    pwd
  EOF
  cwd "/tmp"
  not_if do File.directory?("/Applications/iTerm.app") end
end
