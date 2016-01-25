var fs = require('fs');

function writeName(_list){
  var _nameList = _list.map(function (file) {
    return '@import "' + file + '"'
  })
  var _str = _nameList.join(';\n');
  fs.writeFile('assets/styles/scss/tmp/main.scss', _str, function (err) {
  	if (err){
  		console.log(err);
  	}
   });
}

(function main() {
  var totalList = fs.readdirSync("assets/styles/scss/variables").map(function (file) {
    return "../variables/" + file
  })
  .concat(fs.readdirSync("assets/styles/scss/mixins").map(function (file) {
    return "../mixins/" + file
  }))
  .concat(['../_base.scss'])
  .concat(fs.readdirSync("assets/styles/scss/states").map(function (file) {
    return "../states/" + file
  }))
  .concat(fs.readdirSync("assets/styles/scss/modules").map(function (file) {
    return "../modules/" + file
  }))
  .concat(fs.readdirSync("assets/styles/scss/layout").map(function (file) {
    return "../layout/" + file
  }))
  writeName(totalList);
}).call(this);
