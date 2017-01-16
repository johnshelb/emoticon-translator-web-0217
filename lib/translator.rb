# require modules here
require 'yaml'
require 'pry'
def load_library(file_path)
  new_hash={}
  inner_hash_meaning={}
  inner_hash_emoticons={}
  japanese_emoticons=[]
  english_emoticons=[]
  meanings=[]
  yaml_hash=YAML.load_file(file_path)
  #{get_meaning=>{Japanese emoticon string=>meaning string, etc.}}
  #{get_emoticon=>{english_emoticon=>Japanese_emoticon, etc.}}
  #yaml_hash={"angel"=>["O:)", "☜(⌒▽⌒)☞"], ETC.}
  yaml_hash.each do |meaning,emot_array|
      meanings<<meaning
      english_emoticons<<emot_array[0]
      japanese_emoticons<<emot_array[1]
  end
for i in (0..meanings.count)
  inner_hash_meaning[japanese_emoticons[i]]=meanings[i]
  inner_hash_emoticons[english_emoticons[i]]=japanese_emoticons[i]
  new_hash["get_meaning"]=inner_hash_meaning
  new_hash["get_emoticon"]=inner_hash_emoticons
end
new_hash
end


def get_japanese_emoticon(file_path,emoticon)
  new_hash=load_library(file_path)
  if new_hash["get_emoticon"][emoticon]
    new_hash["get_emoticon"][emoticon]
  else
"Sorry, that emoticon was not found"
end
end

def get_english_meaning(file_path,emoticon)
  new_hash=load_library(file_path)
  if new_hash["get_meaning"][emoticon]
    new_hash["get_meaning"][emoticon]
  else
"Sorry, that emoticon was not found"

end
end
