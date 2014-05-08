require "bundler/gem_tasks"
require 'treetop'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end

desc 'Compile treetop to ruby'
task :compile do
  compiler = Treetop::Compiler::GrammarCompiler.new
  treetop_file = File.expand_path('../lib/methic.tt', __FILE__)
  compiler.compile(treetop_file)
end

task :default => [:compile, :test]
