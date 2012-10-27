cookbook_file "/usr/local/bin/dockutil" do
  source "dockutil"
  mode "0755"
end

service "dock" do
  supports :restart => true
  restart_command "killall Dock"
end

execute "remove all" do
  command "dockutil --remove all"
  only_if "dockutil --list | grep Launchpad.app"
  notifies :restart, "service[dock]"
end

execute "add iTerm dock icon" do
  command "dockutil --add /Applications/iTerm.app --no-restart"
  not_if "dockutil --list | grep iTerm.app"
  notifies :restart, "service[dock]"
end

execute "add Chrome dock icon" do
  command "dockutil --add '/Applications/Google Chrome.app' --no-restart"
  not_if "dockutil --list | grep 'Google Chrome'"
  notifies :restart, "service[dock]"
end

execute "add Sparrow dock icon" do
  command "dockutil --add /Applications/Sparrow.app --no-restart"
  not_if "dockutil --list | grep Sparrow.app"
  notifies :restart, "service[dock]"
end

execute "add Adium dock icon" do
  command "dockutil --add /Applications/Adium.app --no-restart"
  not_if "dockutil --list | grep Adium.app"
  notifies :restart, "service[dock]"
end

execute "add Applications grid folder" do
  command "dockutil --add '/Applications' --view grid --display folder --no-restart"
  not_if "dockutil --list | grep -e \"^Applications\t\""
  notifies :restart, "service[dock]"
end

execute "add Documents grid folder" do
  command "dockutil --add '~/Documents' --view grid --display folder --no-restart"
  not_if "dockutil --list | grep Documents"
  notifies :restart, "service[dock]"
end

execute "add Downloads grid folder" do
  command "dockutil --add '~/Downloads' --view grid --display folder --no-restart"
  not_if "dockutil --list | grep Downloads"
  notifies :restart, "service[dock]"
end

