fs = require('fs')
path = require('path')
unorm = require('unorm')

class FilePicker
	directory : null
	pick_types : null
	
	extract : (callback) =>
		if @pick_types?
			types = []
			for type in @pick_types
				types.push(type.toLowerCase())
			@pick_types = types
		
		@top = @directory
		@files = []
		@readDirectory(@directory)
		
		callback?(@files)
		
	readDirectory : (directory) =>
		list = fs.readdirSync(directory)
		
		for itemname in list
			item = path.resolve(directory, itemname)
			stat = fs.statSync(item)
			
			if stat.isDirectory()
				@readDirectory(item)
			else if stat.isFile()
				@readFile(item, stat)
				
	readFile : (file, stat) =>
		extension = path.extname(file).toLowerCase()
		
		if not @pick_types? || @pick_types.indexOf(extension) > -1
			@files.push
				path : unorm.nfc(file).replace(/\\/g, '/')
				relative_path : unorm.nfc(path.relative(@top, file)).replace(/\\/g, '/')
				base : unorm.nfc(path.dirname(file)).replace(/\\/g, '/')
				relative_base : unorm.nfc(path.relative(@top, path.dirname(file))).replace(/\\/g, '/')
				name : unorm.nfc(path.basename(file, extension))
				extension : extension
				atime : stat.atime.getTime()
				mtime : stat.mtime.getTime()
				ctime : stat.ctime.getTime()

exports.pick = (args...) ->
	directory = args[0]
	if args.length is 3
		pick_types = args[1]
		callback = args[2]
	else
		callback = args[1]
	
	picker = new FilePicker
	picker.directory = directory
	picker.pick_types = pick_types
	picker.extract(callback)
	
exports.treefy = (files, json) ->
	json ?= {}
		
	for f in [0..files.length-1]
		file = files[f]
		dirs = file.relative_base.split('/')
		current = json
		
		if file.relative_base isnt ''
			for dir in dirs
				if not current[dir]? then current[dir] = {}
				current = current[dir]
		
		current[file.name] = f
	
	json
	
exports.FilePicker = FilePicker