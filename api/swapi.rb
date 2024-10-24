require 'webrick'
require 'ruby_rhymes'
require 'engtagger'
require 'nokogiri'
require 'sinatra'
require 'cgi'
require 'sinatra/json'

# HEYDEV! Edit module name and action_on() body in order to write your own function
module Swapi
  class Handler < WEBrick::HTTPServlet::AbstractServlet
    def do_GET request, response
      status, content_type, body = self.class.action_on request

      response = {'Content-Type': 'application/json; charset=utf-8'}
      response.status = status
      response['Content-Type'] = content_type
      response.body = body
    end

    def self.action_on request
      return {status: 200, "Content-Type": 'text/plain', body: 'you got a page' }
    end

    def rhyme_line(line)
      words = line.split(/[\s\n]+/)
      result = words.map do |word|
        word.gsub(/[^\w\d]+/,'')
      end.reject do |word|
        word.strip.length.zero? || word =~ /[,'’]/
      end.map do |word|
        tagged = @tagger.add_tags(word)
        xml = Nokogiri::XML(tagged)
        part = xml.children.first.name
        is_blacklisted = !/^[vnj]/.match(part)

        if is_blacklisted
          word
        else

          syllables_to_match = word.to_phrase.syllables
          rhymes = word.to_phrase.flat_rhymes.select do |rhymed_word|
            rhymed_word.to_phrase.syllables == syllables_to_match
          end
          rhymed = rhymes.sort_by do |rhyme|
            @words.find_index(rhyme) || 0
          end.select do |rhyme|
            !/[\d]/.match(rhyme)
          end.first(10).sample


          rhymed || word
        end
      end.join(' ')
    end


    def post '/rhyme'
      @words = File.read('frequencies').lines
      @tagger = EngTagger.new
      q = JSON.parse(request.body.read)['text']
      rhymed = q.lines.map do |line|
        rhyme_line(line)
      end.to_a.join("\n")


      json :rhymed => rhymed

    end
  end
end

# Avoids name conflicts when multiple functions are present in the /api folder
Handler = Proc.new do |req, res|
  return Swapi::Handler # HEYDEV! Refer to your custom module
end