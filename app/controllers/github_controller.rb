require 'octokit'
require_relative 'api_configs.rb'

Octokit.configure do |c|
  c.access_token = Config::GITHUB[:access_token]
end

def notifications
  Octokit.notifications(participating: true)
end

def events
  Octokit.received_events(Config::GITHUB[:username])
end

def issues
  Octokit.search_issues(
    "author:#{Config::GITHUB[:username]}", 
    sort: 'updated',
    order: 'desc',
    page: 1,
    per_page: 5
  )[:items]
end

def repos
  Octokit.repos(
    Config::GITHUB[:username],
    sort: 'updated',
    order: 'desc',
    page: 1,
    per_page: 5
  )
end

