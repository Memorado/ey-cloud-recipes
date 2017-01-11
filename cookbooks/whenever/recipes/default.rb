#
# Cookbook Name:: whenever
# Recipe:: default
#
ey_cloud_report "whenever" do
  message "starting whenever recipe"
end

if ["util"].include?(node[:instance_role])
  local_user = node[:users].first

  execute "whenever" do
    user local_user[:username]
    command "cd #{config.release_path}; bundle exec whenever --set environment=#{config.framework_env} --update-crontab '#{config.app}_#{config.framework_env}'"

    action :run
  end

  ey_cloud_report "whenever" do
    message "whenever recipe complete"
  end
end
