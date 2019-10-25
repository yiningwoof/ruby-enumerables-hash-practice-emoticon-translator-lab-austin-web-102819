# require modules here

def load_library(path)
  hash = {}
  require 'yaml'
  file = YAML.load_file(path)
  hash["get_meaning"] = {}
  hash["get_emoticon"] = {}
  file.each{|k, v| hash["get_meaning"][v[1]] = k}
  file.each{|k, v| hash["get_emoticon"][v[0]] = v[1]}
  hash
end

def get_japanese_emoticon(path, emo)
  hash = load_library(path)
  hash['get_emoticon'].key?(emo) ? hash['get_emoticon'][emo] : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emo)
  hash = load_library(path)
  hash['get_meaning'].key?(emo) ? hash['get_meaning'][emo] : "Sorry, that emoticon was not found"
end