fs      = require 'fs'
{print} = require 'util'
{spawn} = require 'child_process'

task 'dev', 'Dev Env : Compile CoffeeScript/SCSS source files', ->
  # APP
  app_path = __dirname

  # COFFEE
  coffee_path   = './node_modules/coffee-script/bin/coffee'
  coffee_src_path = "#{__dirname}/src"
  
  # SCSS
  sass_path     = 'scss'
  scss_src_path = app_path + '/public/stylesheets/scss'
  css_path      = app_path + '/public/stylesheets/'

  coffee_watcher = spawn coffee_path, ['-cbw', '-o', app_path, coffee_src_path]
  coffee_watcher.stdout.on 'data', (data) -> print data.toString()
  coffee_watcher.stderr.on 'data', (data) -> print data.toString()
  coffee_watcher.on 'exit', (status) -> callback?() if status is 0

  sass_watcher = spawn sass_path, ['--watch', "#{scss_src_path}:#{css_path}"]
  sass_watcher.stdout.on 'data', (data) -> print data.toString()
  sass_watcher.stderr.on 'data', (data) -> print data.toString()
  sass_watcher.on 'exit', (status) -> callback?() if status is 0