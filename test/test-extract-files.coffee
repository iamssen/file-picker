require('source-map-support').install()
{extract, treefy} = require('../lib/file-extractor')

describe 'File Extracting', ->
	it '.txt 파일에 대한 조회 값은 5 이어야 한다', ->
		extract __dirname + '/samples', ['.txt'], (files) ->
			files.length.should.equal(5)

	it '.jpg 파일에 대한 조회는 1 이어야 하고, name 은 img21 이어야 한다', ->
		extract __dirname + '/samples', ['.jpg'], (files) ->
			files.length.should.equal(1)
			files[0].name.should.equal('img21')
				
describe 'File List To Tree', ->
	it '.txt 파일에 대한 조회를 json 으로 바꿨을때 dir4.dir.file411 은 4 이어야 한다', ->
		extract __dirname + '/samples', ['.txt'], (files) ->
			json = treefy(files)
			json.dir4.dir.file411.should.equal(4)
