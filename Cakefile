fs      = require 'fs'
{print} = require 'util'
{spawn} = require 'child_process'

sass_path     = 'scss'
coffee_path   = './node_modules/coffee-script/bin/coffee'

task 'watcher', 'Compile CoffeeScript source files', ->
  # COFFEE
  app_path = __dirname
  src_path = "#{__dirname}/app_src"
  # SCSS
  scss_src_path = './public/stylesheets/scss'
  css_path      = './public/stylesheets/scss'

  coffee_watcher = spawn coffee_path, ['-cbw', '-o', app_path, "#{__dirname}/app_src"]
  coffee_watcher.stdout.on 'data', (data) -> print data.toString()
  coffee_watcher.stderr.on 'data', (data) -> print data.toString()
  coffee_watcher.on 'exit', (status) -> callback?() if status is 0

  sass_watcher = spawn sass_path, ['--watch', "#{scss_src_path}:#{css_path}"]
  sass_watcher.stdout.on 'data', (data) -> print data.toString()
  sass_watcher.stderr.on 'data', (data) -> print data.toString()
  sass_watcher.on 'exit', (status) -> callback?() if status is 0