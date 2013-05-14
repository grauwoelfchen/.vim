#!/usr/bin/ruby
# encoding: utf-8

## ruby 1.8.6 and 1.8.7

=begin
# Usage:
#   % make_ruby_dict.rb  /usr/share/ri/1.8/system/*/*.yaml > ruby.dict
#
ary = []
ARGV.each do |arg|
  File.open(arg) do |io|
    while text = io.gets do
      if /^full_name/ =~ text
        if m = /^full_name:\s"?(\w+)(?:#|::)(\w+[!?]?)/.match(text)
          ary.concat(m.captures)
        else
          STDERR.print "Skipped: #{arg}: #{text}"
        end
      end
    end
  end
end
ary.uniq.sort.each do |line|
  puts line
end
=end

## ruby 1.9.3 and 2.0

# Usage:
#   % make_ruby_dict.rb
#
require 'stringio'
require 'rdoc/ri'

module Kernel
  def capture(stream=:stdout)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval "$#{stream} = #{stream.upcase}"
    end
    result
  end
end

def list_methods_matching(full_name)
  option = RDoc::RI::Driver.process_args([full_name])
  driver = RDoc::RI::Driver.new(option)
  driver.list_methods_matching(full_name)
end

# There may be another better way to get list :) (use Driver#stores ?)
list = capture { RDoc::RI::Driver.run(["-l"]) }.split("\n")

STDOUT.sync = true

result = []
len = list.length.to_f
list.map.with_index do |full_name, i|
  # class/module
  full_name.split("::").map { |name| result << name }
  # method
  methods = list_methods_matching(full_name)
  methods = methods.map { |m| m.length < 4 ? "" : m.gsub(/#{full_name}|#|::/, "") }
  result.concat(methods)

  print (((i + 1) / len) * 100).to_s + "\r"
end
result = result.uniq.sort

# report
puts len.to_s + " classes."
puts result.length.to_s + " entries."

File.open("ruby.dict", "w") do |f|
  result.map { |line| f.puts line }
end
