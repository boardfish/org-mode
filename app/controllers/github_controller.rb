require 'octokit'
require_relative 'api_configs'
client = Octokit::Client.new \
  login: Config::GITHUB[:username],
  password: Config::GITHUB[:password]

notifications = client.notifications(participating: true)
notifications.each do |notification|
  puts notifications
end
