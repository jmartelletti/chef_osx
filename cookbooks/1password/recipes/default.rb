extension_dir = "/Users/#{node[:current_user]}/Library/Application Support/Google/Chrome/External Extensions"

remote_file "/tmp/1Password-3.8.20.zip" do
  source "https://d13itkw33a7sus.cloudfront.net/dist/1P/mac/1Password-3.8.20.zip"
  checksum "56aef138f06"
end

execute "install 1Password" do
  command "unzip -d /Applications/ /tmp/1Password-3.8.20.zip"
  not_if do File.directory?("/Applications/1Password.app") end
end

directory extension_dir
#"/Users/#{node[:current_user]}/Library/Application Support/Google/Chrome/External Extensions" do
#end

remote_file "#{extension_dir}/1Password.crx" do
#remote_file "/Users/#{node[:current_user]}/Library/Application Support/Google/Chrome/External Extensions" do
  source "http://aws.cachefly.net/dist/1P/ext/1Password.crx"
end

template "#{extension_dir}/gkndfifopckmhdkohjeoljlbfnjhekfg.json" do
  source "gkndfifopckmhdkohjeoljlbfnjhekfg.json.erb"
  variables({
    :extension_path => "#{extension_dir}/1Password.crx"
  })
end

#execute "install 1Password chrome extension" do
#  command "unzip -d /Applications/ /tmp/1Password-3.8.20.zip"
#  not_if do File.directory?("/Applications/1Password.app") end
#end
