# FileExtractor

	var util = require('util')

	// get FileExtractor class
	var FileExtractor = require('directory-utils').FileExtractor;
	
	// create new instance with extract types (sample is flash actionscript class files)
	var classExtractor = new FileExtractor(['.as', '.mxml']);
	
	// extract
	var files = classExtractor.extract('/Users/ssen/Data/workspace/SrcViewer');
	
	// trace
	console.log(util.inspect(files))
	
	/* output
	ssen:directory-utils ssen$ node sample.js
	[ { path: '/Users/ssen/Data/workspace/SrcViewer/src/SrcViewer.mxml',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src',
	    name: 'SrcViewer',
	    extension: '.mxml' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/airkit/update/AIRUpdate.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/airkit/update',
	    name: 'AIRUpdate',
	    extension: '.as' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/airkit/update/AIRUpdateError.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/airkit/update',
	    name: 'AIRUpdateError',
	    extension: '.as' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/airkit/update/AIRUpdateState.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/airkit/update',
	    name: 'AIRUpdateState',
	    extension: '.as' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/datakit/file/FolderToTreeConverter.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/datakit/file',
	    name: 'FolderToTreeConverter',
	    extension: '.as' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/commands/OpenDocsLocation.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/commands',
	    name: 'OpenDocsLocation',
	    extension: '.as' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/model/Doc.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/model',
	    name: 'Doc',
	    extension: '.as' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/model/DocEvent.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/model',
	    name: 'DocEvent',
	    extension: '.as' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/model/DocModel.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/model',
	    name: 'DocModel',
	    extension: '.as' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/model/filetypes/ActionScript.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/model/filetypes',
	    name: 'ActionScript',
	    extension: '.as' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/model/filetypes/Code.as',
	    base: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/model/filetypes',
	    name: 'Code',
	    extension: '.as' },
	  { path: '/Users/ssen/Data/workspace/SrcViewer/src/ssen/srcviewer/model/filetypes/DocFile.as',
	  ......
	 */

output structure

- `[]` array
	- `{}` object
		- `string path` absolute file path
		- `string base` absolute parent path
		- `string name` file name without extension
		- `string extension` file extension

# DirectoryReader

	var util = require('util')
	
	// get DirectoryReader class
	var DirectoryReader = require('directory-utils').DirectoryReader;
	
	// create new instance with extract types (sample is markdown files)
	var markdownFilesReader = new DirectoryReader(['.md']);
	
	// read directory list json format
	var list = markdownFilesReader.toJson('/Users/ssen/Dropbox/Documents');
	
	// trace
	console.log(util.inspect(list, false, null, true));
	
	/* output
	ssen:directory-utils ssen$ node sample.js
	{ __FILES__: 
	   [ { path: '/Users/ssen/Dropbox/Documents/Books.md',
	       base: '/Users/ssen/Dropbox/Documents',
	       name: 'Books',
	       extension: '.md' },
	     { path: '/Users/ssen/Dropbox/Documents/계획.md',
	       base: '/Users/ssen/Dropbox/Documents',
	       name: '계획',
	       extension: '.md' },
	     { path: '/Users/ssen/Dropbox/Documents/라이센스 관리.md',
	       base: '/Users/ssen/Dropbox/Documents',
	       name: '라이센스 관리',
	       extension: '.md' } ],
	  '기술 관련 자료들': 
	   { __INFO__: { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들' },
	     __FILES__: 
	      [ { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Books.md',
	          base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들',
	          name: 'Books',
	          extension: '.md' },
	        { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/JQuery.md',
	          base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들',
	          name: 'JQuery',
	          extension: '.md' },
	        { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Objective-C.md',
	          base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들',
	          name: 'Objective-C',
	          extension: '.md' } ],
	     Flash: 
	      { __INFO__: { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash' },
	        __FILES__: 
	         [ { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/Flash.md',
	             base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash',
	             name: 'Flash',
	             extension: '.md' } ],
	        ssml: 
	         { __INFO__: { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml' },
	           trash: 
	            { __INFO__: { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml/trash' },
	              __FILES__: 
	               [ { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml/trash/DataModeling.md',
	                   base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml/trash',
	                   name: 'DataModeling',
	                   extension: '.md' },
	                 { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml/trash/Modeling.md',
	                   base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml/trash',
	                   name: 'Modeling',
	                   extension: '.md' },
	                 { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml/trash/ModelingCase.md',
	                   base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml/trash',
	                   name: 'ModelingCase',
	                   extension: '.md' },
	                 { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml/trash/ModelingPattern.md',
	                   base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml/trash',
	                   name: 'ModelingPattern',
	                   extension: '.md' },
	                 { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml/trash/ModelInterface.md',
	                   base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/ssml/trash',
	                   name: 'ModelInterface',
	                   extension: '.md' } ] } },
	        '정리 완료': 
	         { __INFO__: { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료' },
	           __FILES__: 
	            [ { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Build.Asdoc.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: 'Build.Asdoc',
	                extension: '.md' },
	              { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Build.Compiler Options.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: 'Build.Compiler Options',
	                extension: '.md' },
	              { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Data.Tree 형태 데이터의 전환과 렌더링.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: 'Data.Tree 형태 데이터의 전환과 렌더링',
	                extension: '.md' },
	              { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Log.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: 'Log',
	                extension: '.md' },
	              { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/S-ERP.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: 'S-ERP',
	                extension: '.md' },
	              { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/SwitchingToTheFlex.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: 'SwitchingToTheFlex',
	                extension: '.md' },
	              { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/UI.Flex Components 기술 문서.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: 'UI.Flex Components 기술 문서',
	                extension: '.md' },
	              { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/UI.Flow Layout 제작 시 참고한 자료들.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: 'UI.Flow Layout 제작 시 참고한 자료들',
	                extension: '.md' },
	              { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/UI.Form Container 제작 문서.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: 'UI.Form Container 제작 문서',
	                extension: '.md' },
	              { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/UI.Form Control 제작 문서.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: 'UI.Form Control 제작 문서',
	                extension: '.md' },
	              { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/UI.Text 처리 기법들.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: 'UI.Text 처리 기법들',
	                extension: '.md' },
	              { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/자료정리.md',
	                base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료',
	                name: '자료정리',
	                extension: '.md' } ],
	           'Chart 관련 정리할 자료들': 
	            { __INFO__: { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Chart 관련 정리할 자료들' },
	              __FILES__: 
	               [ { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Chart 관련 정리할 자료들/BarChart.md',
	                   base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Chart 관련 정리할 자료들',
	                   name: 'BarChart',
	                   extension: '.md' },
	                 { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Chart 관련 정리할 자료들/index.md',
	                   base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Chart 관련 정리할 자료들',
	                   name: 'index',
	                   extension: '.md' },
	                 { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Chart 관련 정리할 자료들/차트 모양 컨트롤.md',
	                   base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Chart 관련 정리할 자료들',
	                   name: '차트 모양 컨트롤',
	                   extension: '.md' },
	                 { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Chart 관련 정리할 자료들/차트의 데이터 표현.md',
	                   base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/Chart 관련 정리할 자료들',
	                   name: '차트의 데이터 표현',
	                   extension: '.md' } ] },
	           '과거 자료들 정리': 
	            { __INFO__: { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/과거 자료들 정리' },
	              '정리완료': 
	               { __INFO__: { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/과거 자료들 정리/정리완료' },
	                 __FILES__: 
	                  [ { path: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/과거 자료들 정리/정리완료/index.md',
	                      base: '/Users/ssen/Dropbox/Documents/기술 관련 자료들/Flash/정리 완료/과거 자료들 정리/정리완료',
	                      name: 'index',
	                      extension: '.md' } ] } } } } },
	  '생활 관련 자료들': 
	   { __INFO__: { path: '/Users/ssen/Dropbox/Documents/생활 관련 자료들' },
	     __FILES__: 
	      [ { path: '/Users/ssen/Dropbox/Documents/생활 관련 자료들/리바이스.md',
	          base: '/Users/ssen/Dropbox/Documents/생활 관련 자료들',
	          name: '리바이스',
	          extension: '.md' },
	        { path: '/Users/ssen/Dropbox/Documents/생활 관련 자료들/자동차.md',
	          base: '/Users/ssen/Dropbox/Documents/생활 관련 자료들',
	          name: '자동차',
	          extension: '.md' } ] } } 
	 */

output structure

- `{}`
	- `object __INFO__`
		- `string path` directory absolute path
	- `array __FILES__`
		- `{}` file info ...files in this directory
			- `string path` absolute file path
			- `string base` absolute parent path
			- `string name` file name without extension
			- `string extension` file extension
	- `object directoryname1` ...sub directories
		- `object __INFO__`
		- `array __FILES__`
		- `object subdirectory1` ... sub directories
		- `object subdirectory2`
		- `object subdirectory3`
	- `object directoryname2`
		- `object __INFO__`
		- `array __FILES__`
	- `object directoryname3`
		- `object __INFO__`
		- `array __FILES__`