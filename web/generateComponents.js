var fs = require('fs');

function findModuleFiles(_name) {
  var totalList = fs.readdirSync("assets/styles/scss/modules").map(function (file) {
    return "../modules/" + file
  }).concat(fs.readdirSync("assets/styles/scss/layout").map(function (file) {
    return "../layout/" + file
  })).concat(fs.readdirSync("assets/styles/scss/states").map(function (file) {
    return "../states/" + file
  }));

  var fileList = [];
  for (index in totalList) {
    var file = totalList[index];
    if("_" + file.split("_")[1] == _name){
      fileList.push(file);
    }
  }
  return fileList
}

function findDependency() {
  var mixinsList = fs.readdirSync("assets/styles/scss/mixins").map(function (file) {
    return "../mixins/" + file
  });
  var variablesList = fs.readdirSync("assets/styles/scss/variables").map(function (file) {
    return "../variables/" + file
  });
  var totalList = variablesList.concat(mixinsList);

  return totalList
}

function outputFile(_list, _path){
  var _nameList = _list.map(function (file) {
    return '@import "' + file + '"'
  });
  var _str = _nameList.join(';\n');
  fs.writeFile(_path, _str, function (err) {
    if(err){console.log("write file" + _path + "error: " + err)}
  });
}

(function main(argument) {
  var totalList = fs.readdirSync("assets/styles/scss//layout").concat(fs.readdirSync("assets/styles/scss//modules")).concat(fs.readdirSync("assets/styles/scss//states"));
  for(index in totalList){
    var file = totalList[index];
    var nameList = findDependency().concat(findModuleFiles(file));
    outputFile(nameList, "assets/styles/scss//components/" + file);
  }
  var baseList = findDependency().concat(["../_base.scss"]);
  outputFile(baseList, "assets/styles/scss//components/_base.scss");
}).call(this);
