require 'octokit'
require "graphql/client"
require "graphql/client/http"
require_relative 'api_configs.rb'

# Configure GraphQL endpoint using the basic HTTP network adapter.
HTTP = GraphQL::Client::HTTP.new("https://api.github.com/graphql") do
  def headers(context)
    {
      "Authorization" => "Bearer #{Config::GITHUB[:access_token]}"
    }
  end
end

# Fetch latest schema on init, this will make a network request
# Schema = GraphQL::Client.load_schema(HTTP)

# However, it's smart to dump this to a JSON file and load from disk
#
# Run it from a script or rake task
GraphQL::Client.dump_schema(HTTP, "schema.json")
Schema = GraphQL::Client.load_schema("schema.json")
Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
LoginQuery = Client.parse <<-'GRAPHQL'
  query {
    viewer {
      avatarUrl
      name
      login
      config: repository(name: ".files") {
        name
        object(expression: "master:shellscripts/theme") {
          ... on Blob {
            text
          }
        }
      }
      repositories(last: 10) {
        edges {
          node {
            name
            url
            issues(states: OPEN) {
              totalCount
            }
          }
        }
      }
      issues(last: 5, states: OPEN) {
        edges {
          node {
            title
            state
            updatedAt
            url
            repository {
              nameWithOwner
            }
            url
          }
        }
      }
      data: repository(name: "org-mode-data") {
        project(number: 1) {
          columns(first: 4) {
            edges {
              node {
                id
                name
                cards(first: 100) {
                  edges {
                    node {
                      note
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
GRAPHQL
$result = Client.query(LoginQuery)

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
  $result.data.viewer.issues.edges
end

def repos
  $result.data.viewer.repositories.edges
end

def todo_list
  $result.data.viewer.data.project.columns.edges[1]
end

def repos
  p "result = #{@result}"
  $result.data.viewer.repositories.edges
end

