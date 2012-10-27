desc "Run chef and setup the system"
task :setup do
  %x{sudo -E chef-solo -c solo.rb -j nodes/bender.json}
end
