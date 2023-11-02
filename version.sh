version=$(grep 'version:' pubspec.yaml | sed 's/version: //')
sed -i '' "1i\ Project Version: $version" README.md

#sed -i '' "1i\
## Project Version: $version
#" README.md