fs      = require 'fs'
{print} = require 'util'

{spawn, exec} = require 'child_process'

app_path    = __dirname
sass_path   = 'scss'
coffee_path = app_path + '/node_modules/coffee-script/bin/coffee'
ugly_path   = app_path + '/node_modules/uglify-js/bin/uglifyjs'

# TODO: COMPILE COFFEE FOR APP
# TODO: COMPILE COFFEE FOR JS
# TODO: UGLIFY JS

task 'dev', 'Dev Env : Compile CoffeeScript/SCSS source files', ->
  # COFFEE
  coffee_src_path = "#{__dirname}/src"
  
  # SCSS
  scss_src_path = app_path + '/public/stylesheets/scss'
  css_path      = app_path + '/public/stylesheets/'

  # UGLIFY
  to_param  = 'xargs cat'
  ugly_from = app_path + '/public/javascripts/'
  ugly_to   = app_path + '/public/javascripts/cumulative/script.js'
  js_files  = "find #{ugly_from} -name '*.js'"
  uglify_js = "#{js_files} | #{to_param} | #{ugly_path} > #{ugly_to}"

  # COFFEE
  coffee_watcher = spawn coffee_path, ['-cbw', '-o', app_path, coffee_src_path]

  coffee_watcher.stdout.on 'data', (data) ->
    print data.toString()
    ugly_proc = exec uglify_js
    console.log '===>', uglify_js
    ugly_proc.stdout.on 'data', (data) -> print data.toString()
    ugly_proc.stderr.on 'data', (data) -> print data.toString()

  coffee_watcher.stderr.on 'data', (data) -> print data.toString()
  coffee_watcher.on 'exit', (status) -> callback?() if status is 0

  # SCSS
  sass_watcher = spawn sass_path, ['--watch', "#{scss_src_path}:#{css_path}", '-t', 'expanded']
  sass_watcher.stdout.on 'data', (data) -> print data.toString()
  sass_watcher.stderr.on 'data', (data) -> print data.toString()
  sass_watcher.on 'exit', (status) -> callback?() if status is 0