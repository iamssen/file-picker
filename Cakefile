{exec} = require 'child_process'

task 'test', 'Test', ->
	build ->
		exec 'mocha --compilers coffee:coffee-script --timeout 10000 --require should', (err, stdout, stderr) ->
			if err? then throw err
			console.log(stdout + stderr)

task 'build', 'Compile Coffee Script Files', ->
	build()
		
build = (callback) ->
	exec 'coffee -m -o lib/ -c src/', (err, stdout, stderr) ->
		if err? then throw err
		console.log(stdout + stderr)
		callback?()
