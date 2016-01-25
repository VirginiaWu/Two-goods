for file in ./assets/styles/scss/tmp/components/* ; do
  name=`echo $file | cut -d '_' -f2`
  scssName="_$name"
  cssName="`echo $name | cut -d '.' -f1`.css"
  sass assets/styles/scss/tmp/components/$scssName .tmp/public/styles/components/$cssName
done
