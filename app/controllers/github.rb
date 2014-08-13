class Github
  include HTTParty
  base_uri 'https://api.github.com'
  headers 'User-Agent' => 'durp'

  def self.repos_for username
    get "/users/#{username}/repos"
  end
end
