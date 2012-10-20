# Searchable

With this gem you can implement

1. search by string
2. filter by starting letter or number

Searching is using "LIKE" syntax.

## Installation

Add this line to your application's Gemfile:

    gem 'searchable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install searchable

## Usage

Activate gem in your model:

    has_searchable :name

Update your controller action:

    @projects = Project.search(search_options)

Add @search@ param to url to search. This will find any project with "car" in the name:

    http://localhost:3000/projects?search=car

Add @letter@ param to url to search by starting letter. This will find any project with first letter "C":

    http://localhost:3000/projects?letter=c

Add @letter@ param to url with value "num" to search by numbers. This will find projects with any number in the beginning:

    http://localhost:3000/projects?letter=num


### Search form

Here's the simple HAML snippet for search form. You can add it to your index action:

    = form_tag request.path, :method => :get do
      = text_field_tag :search, params[:search]
      = submit_tag "Search"

### Letter filter

Here's the simple HAML letter filter snippet. It is generating A, B, C, etc links, "#" link for numbers and reset link (visible only when filter is active).

    - if params[:letter]
      = link_to "Reset filter", {}

    - if params[:letter] == "num"
      = link_to "#", {:letter => "num"}

    - ("A".."Z").each do |c|
      = link_to c, {:letter => c.downcase}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
