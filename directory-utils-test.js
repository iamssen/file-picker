var util = require('util')
var directory_utils = require('./directory-utils');
var FileExtractor = directory_utils.FileExtractor;
var DirectoryReader = directory_utils.DirectoryReader;

// var actionscriptExtractor = new FileExtractor(['.as', '.mxml']);
// console.log(actionscriptExtractor.extract('/Users/ssen/Data/workspace/SrcViewer'))

var actionscriptExtractor = new FileExtractor(['.md']);
console.log(actionscriptExtractor.extract('/Users/ssen/Dropbox/Documents'))

// var markdownFilesReader = new DirectoryReader(['.md']);
// console.log(util.inspect(markdownFilesReader.toJson('/Users/ssen/Dropbox/Documents'), false, null, true));
