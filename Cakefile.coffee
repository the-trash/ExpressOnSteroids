fs      = require 'fs'
{print} = require 'util'

{spawn, exec} = require 'child_process'

app_path    = __dirname
sass_exec   = 'scss'
coffee_exec = app_path + '/node_modules/coffee-script/bin/coffee'
ugly_exec   = app_path + '/node_modules/uglify-js/bin/uglifyjs'

# TODO: COMPILE COFFEE FOR APP
# TODO: COMPILE COFFEE FOR JS
# TODO: UGLIFY JS

task 'dev', 'Dev Env : Compile CoffeeScript/SCSS source files', ->
  # APP
  js_path      = "#{app_path}/public/javascripts"
  css_path     = "#{app_path}/public/stylesheets"
  scss_path    = "#{app_path}/public/stylesheets/scss"
  coffee_path  = "#{app_path}/public/javascripts/coffee"
  app_src_path = "#{__dirname}/src"

  # COFFEE
  # watch application source dir => ROOT
  coffee_watcher_1 = spawn coffee_exec, ['-cbw', '-o', app_path, app_src_path]
  coffee_watcher_1.stdout.on 'data', (data) -> print data.toString()
  coffee_watcher_1.stderr.on 'data', (data) -> print data.toString()
  coffee_watcher_1.on 'exit', (status) -> callback?() if status is 0
  # watch coffee dir => js dir
  coffee_watcher_2 = spawn coffee_path, ['-cw',  '-o', js_path,  coffee_path]
  coffee_watcher_2.stdout.on 'data', (data) -> print data.toString()
  coffee_watcher_2.stderr.on 'data', (data) -> print data.toString()
  coffee_watcher_2.on 'exit', (status) -> callback?() if status is 0

  # SCSS
  sass_watcher = spawn sass_exec, ['--watch', "#{scss_path}:#{css_path}", '-t', 'expanded']
  sass_watcher.stdout.on 'data', (data) -> print data.toString()
  sass_watcher.stderr.on 'data', (data) -> print data.toString()
  sass_watcher.on 'exit', (status) -> callback?() if status is 0

  # UGLIFY
  #to_param  = 'xargs cat'
  #ugly_from = app_path + '/public/javascripts/'
  #ugly_to   = app_path + '/public/javascripts/cumulative/script.js'
  #js_files  = "find #{ugly_from} -name '*.js'"
  #uglify_js = "#{js_files} | #{to_param} | #{ugly_path} > #{ugly_to}"

  #coffee_watcher.stdout.on 'data', (data) ->
  #print data.toString()
  #ugly_proc = exec uglify_js
  #console.log '===>', uglify_js
  #ugly_proc.stdout.on 'data', (data) -> print data.toString()
  #ugly_proc.stderr.on 'data', (data) -> print data.toString()

  #coffee_watcher.stderr.on 'data', (data) -> print data.toString()
  #coffee_watcher.on 'exit', (status) -> callback?() if status is 0