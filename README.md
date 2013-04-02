# install

	npm install file-extractor

# api

- `extract(string target_directory, [array extract_types], function callback)`
	- `array extract_types` want array of file extension format (ex . `['.py', '.js']`)
	- `function callback` is return array of files infomation
		- `{ string path, string relative_path, string base, string relative_base, name, extension }`
- `object treefy(array files)` extracted files information to tree structure 

# extract files at a directory

	{extract} = require('file-extractor')
	
	extract '~/some_directory', ['.as'], (files) ->
		console.log(files)
		
print on console

	[ { path: '/Users/ssen/Data/workspace/SrcViewer/src/SrcViewer.mxml',
	    relative_path: 'src/SrcViewer.mxml',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src',
	    relative_base: 'src',
	    name: 'SrcViewer',
	    extension: '.mxml' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/airkit/update/AIRUpdate.as',
	    relative_path: 'src/ssen/airkit/update/AIRUpdate.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/airkit/update',
	    relative_base: 'src/ssen/airkit/update',
	    name: 'AIRUpdate',
	    extension: '.as' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/airkit/update/AIRUpdateError.as',
	    relative_path: 'src/ssen/airkit/update/AIRUpdateError.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/airkit/update',
	    relative_base: 'src/ssen/airkit/update',
	    name: 'AIRUpdateError',
	    extension: '.as' },
	  ....
	  
# files to tree object

	util = require('util')
	{extract, treefy} = require('file-extractor')
	
	extract '~/some_directory', ['.as'], (files) ->
		console.log(util.inspect(treefy(files)))
		
print

	{ssen : {
		airkit : {
			update : {
				AIRUpdate : 1, // index of files array 
				AIRUpdateError : 2
	...
