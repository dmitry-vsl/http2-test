#!/bin/bash
set -e

FILE_SIZE_BYTE=1000
FILES_COUNT=10

rm -rf public
mkdir public

for f in bundle.html nobundle.html; do
cat > public/$f <<EOF
  <html>
    <head>
      <script>
        time = new Date().getTime()
      </script>
EOF
done


for i in $(seq 1 "$FILES_COUNT"); do
  file=public/$i.js
  echo -n '//' > $file
  head -c $FILE_SIZE_BYTE /dev/urandom | base64 | head -c $FILE_SIZE_BYTE >> $file
  echo "<script src='./$i.js'></script>" >> public/nobundle.html
done

cat >> public/nobundle.html <<EOF
      <script>
        document.write('Loaded in: ' + (new Date().getTime() - time)/1000 + ' s')
      </script>
    </head>
  </html>
EOF


echo "<script src='./bundle.js'></script>" >> public/bundle.html


for f in bundle.html nobundle.html; do
cat >> public/$f <<EOF
      <script>
        document.write('Loaded in: ' + (new Date().getTime() - time)/1000 + ' s')
      </script>
    </head>
  </html>
EOF
done

cat public/*.js > public/bundle.js
