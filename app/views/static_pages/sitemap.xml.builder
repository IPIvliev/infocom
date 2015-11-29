xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.urlset(:xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9") {
 
xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'index', :only_path => false)
    xml.changefreq "weekly"
    xml.priority 1.0
 end

xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'help', :only_path => false)
    xml.changefreq "monthly"
    xml.priority 1.0
 end

xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'sitemap', :only_path => false)
    xml.changefreq "monthly"
    xml.priority 1.0
 end

xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'about_us', :only_path => false)
    xml.changefreq "monthly"
    xml.priority 1.0
 end

  xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'services', :only_path => false)
    xml.changefreq "monthly"
    xml.priority 1.0
 end

   xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'it_autsorsing', :only_path => false)
    xml.changefreq "monthly"
    xml.priority 1.0
 end

   xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'it_audit', :only_path => false)
    xml.changefreq "monthly"
    xml.priority 1.0
 end

   xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'sait', :only_path => false)
    xml.changefreq "monthly"
    xml.priority 1.0
 end

   xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'local', :only_path => false)
    xml.changefreq "monthly"
    xml.priority 1.0
 end

   xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'printers', :only_path => false)
    xml.changefreq "monthly"
    xml.priority 1.0
 end

   xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'servers', :only_path => false)
    xml.changefreq "monthly"
    xml.priority 1.0
 end

  xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'articles', :only_path => false)
    xml.changefreq "daily"
    xml.priority 1.0
 end

  for post in @posts
    xml.url {
      xml.loc(url_for :controller => 'posts', :action => 'show', :id => post.id, :only_path => false)
      xml.lastmod(post.updated_at.strftime("%Y-%m-%d"))
      xml.changefreq("monthly")
      xml.priority(0.8)
    }
  end

  xml.url do
    xml.loc (url_for :controller => 'static_pages', :action => 'contacts', :only_path => false)
    xml.changefreq "monthly"
    xml.priority 1.0
 end

 }