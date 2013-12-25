module UserOperator
  def show_nav(documents, html)
    links = []

    documents.each do |document|
      link = "<li><a class='btn-primary' href='#{document.path}'>#{document.title}</a></li>"
      links << link
    end

    nav = "<ul>"+links.join()+"</ul>"
    html["{% show_nav %}"] = nav
  end
end