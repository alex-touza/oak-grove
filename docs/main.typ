#import "@preview/tidy:0.4.3"

#let docs = tidy.parse-module(read("/src/lib.typ"))
#tidy.show-module(docs, style: tidy.styles.default)