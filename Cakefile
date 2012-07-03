fs            = require 'fs'
{print}       = require 'sys'
{spawn, exec} = require 'child_process'
coffee_path   = './node_modules/coffee-script/bin/coffee'

task 'compile_coffee_files', 'Compile CoffeeScript source files', ->
  app_path = __dirname
  src_path = "#{__dirname}/app_src"

  app_coffee = spawn coffee_path, ['-cbw', '-o', app_root, "#{__dirname}/app_src"]
  app_coffee.stdout.on 'data', (data) -> print data.toString()
  app_coffee.stderr.on 'data', (data) -> print data.toString()
  app_coffee.on 'exit', (status) -> callback?() if status is 0