require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    html = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

    binding.pry
  end

  Scraper.new.get_page

  def get_courses
    html.each do |course|
      @title = course.css(".post").first.css("h2").text
      @schedule = course.css(".post").first.css(".date").text
      @description = course.css(".post").first.css("p").text
  end

  def make_courses

  end

    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end
