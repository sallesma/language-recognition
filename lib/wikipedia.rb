module Wikipedia

    def self.article(locale)
        require 'open-uri'
        doc = Nokogiri::HTML(open(I18n.t(:wikipedia_random_url, locale: locale), :allow_redirections => :safe))

        title = doc.at_css("#content h1#firstHeading").content.tr(" ", "_")

        article = doc.at_css("body #content").inner_html
        article = Sanitize.fragment(article)

        return title, article
    end
end