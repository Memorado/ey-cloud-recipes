#
# Cookbook Name:: whenever
# Recipe:: default
#

def apply_recipes
  # Set your application name here
  appname = "jobz_backend"

  # be sure to replace "app_name" with the name of your application.
  local_user = node[:users].first
  execute "whenever" do
    cwd "/data/#{appname}/current"
    user local_user[:username]
    command "bundle exec whenever --update-crontab '#{appname}_#{node[:environment][:framework_env]}'"
    action :run
  end

  ey_cloud_report "whenever" do
    message "whenever recipe complete"
  end
end

ey_cloud_report "whenever" do
  message "starting whenever recipe"
end

# if ['solo', 'util'].include?(node[:instance_role])
if ['solo'].include?(node[:instance_role])
  apply_recipes
elsif ['util'].include?(node[:instance_role])
  if ['utility_1'].include?(node[:instance_name])
    apply_recipes
  end
end
