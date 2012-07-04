sass --watch input-dir:output-dir

fs = require 'fs'

{print} = require 'sys'
{exec} = require 'child_process'
{spawn} = require 'child_process'

option '-o', '--output [DIR]', 'output dir'

task 'minify', 'Minify mongo production scripts', ->
  exec 'uglifyjs --overwrite lib/mongo/lib/*.js', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'watch', 'Watch lib/mongo/src for changes', ->
  coffee = spawn 'coffee', ['-w', '-c', '-o', 'lib/mongo/lib', 'lib/mongo/src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
    invoke 'minify'