fs = require('fs')
path = require('path')

###
catch all files of match types in some directory and children directories

[
	{base : '/xxx/bbb/ccc', name : 'filename', extension : '.extension'},...
]
###
class FileExtractor
	constructor : (@extract_types) ->
	
	extract : (directory) =>
		@top = directory
		@files = []
		@readDirectory(directory)
		@files
		
	readDirectory : (directory) =>
		list = fs.readdirSync(directory)
		
		for itemname in list
			item = path.resolve(directory, itemname)
			stat = fs.statSync(item)
			
			if stat.isDirectory()
				@readDirectory(item)
			else if stat.isFile()
				@readFile(item)
				
	readFile : (file) =>
		extension = path.extname(file)
		
		if not @extract_types? || @extract_types.indexOf(extension) > -1
			@files.push
				path : file
				relative_path : path.relative(@top, file)
				base : path.dirname(file)
				relative_base : path.relative(@top, path.dirname(file))
				name : path.basename(file, extension)
				extension : extension

###
{
	__INFO__ : { path : "absolute path" }
	__FILES__ : [ {base : '/xxx/bbb/ccc', name : 'filename', extension : '.extension'}, ... ]
	subdirectory1 : {
		__INFO__: {}
		__FILES__ : []
		subdirectory : {}
	},
	subdirectory2 : {
		
	}
}
###			
class DirectoryReader
	constructor : (@extract_types) ->
		
	toJson : (directory) =>
		@top = directory
		extractor = new FileExtractor(@extract_types)
		
		files = extractor.extract(directory)
		json = 
			__INFO__ : 
				path : directory
				relative_path : '/'
		
		for file in files
			dirs = path.relative(directory, file.path).split(path.sep)
			current = json
			currentPath = directory
			
			dirs.pop()
			
			for dir in dirs
				if not current[dir]?
					current[dir] = 
						__INFO__ : 
							path : path.join(currentPath, dir)
							relative_path : path.relative(@top, path.join(currentPath, dir))
				current = current[dir]
				currentPath = path.join(currentPath, dir)
				
			current.__FILES__ ?= []
			current.__FILES__.push(file)
		
		json


exports.FileExtractor = FileExtractor
exports.DirectoryReader = DirectoryReader