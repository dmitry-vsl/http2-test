# Compare bundling vs no-bundling js performance

We generate `10_000` js files, each file is 1KB. Then we compare two ways to deliver them to the web browsers.

First we include each file using `script` tag.

Then we bundle all files using unix `cat` utility and include it as a single large file using `script` tag.

[Link to the first html file (no bundle)](https://dmitry-vsl.github.io/http2-test/nobundle.html)

[Link to the second html file (js is bundled)](https://dmitry-vsl.github.io/http2-test/bundle.html)
