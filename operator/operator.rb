require 'faraday'
require 'json'

module UserOperator
  def show_nav(documents, html)
    links = []

    documents.each do |document|
      link = "<li><a class='btn-primary' href='#{document.path}'>#{document.title}</a></li>"
      links << link
    end

    nav = "<ul>"+links.join()+"</ul>"

    return nav
    #html["{% show_nav %}"] = nav
  end

  def show_github_activity(documents, html)
    conn = Faraday.new(:url => 'http://osrc.dfm.io/') do |c|
      c.use Faraday::Request::UrlEncoded  # encode request params as "www-form-urlencoded"
      c.use Faraday::Response::Logger     # log request & response to STDOUT
      c.use Faraday::Adapter::NetHttp     # perform requests with Net::HTTP
    end

    response = conn.get '/benny1992.json'     # GET http://sushi.com/nigiri/sake.json
    json = response.body

    datahash = JSON.parse(json)

    string = "#{datahash["name"]} has following language activities: <br />"
    datahash["usage"]["languages"].each.with_index(1) do |languagehash, index = 1|
      string << "#{index}: #{languagehash["language"]} - #{languagehash["count"]} commits<br />"
    end

    return string
  end
end