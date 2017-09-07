# org-mode

Primarily a first attempt at Ruby on Rails. A personal organiser that hooks into various APIs including Trello and GitHub.

## Prerequisites

- A todo and done list on Trello somewhere. They don't have to be on the same board.
- A list of links on Trello, named as what they'll display as and with the link itself in the card description.
- A GitHub account.

## Installation

Clone the repository and run `bundle install` in the directory. Once you've moved the example_api_configs.rb to app/controllers/api_configs.rb and filled it with your details, run `bin/rails server` to host it and navigate to the port it's open at.

I'd like to build this into a more widespread and popular service if there's enough support for it, but for now, it's tailored more to my personal needs.

## Current state

I've literally just picked up Ruby on Rails after ASP.NET, so I'm feeling very much at home with it after my existing experience with Ruby. As such, development should be a pretty stable process, but it's still early days.
