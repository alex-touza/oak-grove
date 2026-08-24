# Oak Grove

Create problem sets with support for multiple solutions, tags, links and code.

## Features

- Generate a section for **listing problems** and another section for **showing solutions**.
- Organize problems in **sections**.
- Write **solutions** in **code blocks** or automatically **read from files**.
- Use colorful **tags** to categorize problems.
- Add **hyperlinks** to problems.
- Support for English, Spanish and Catalan.
## Usage

Here's a short but complete example:

```typst
#import "/src/lib.typ" as oak

#show: oak.set-config(
  read-func: (filename) => read(filename),
  // You can also specify a function that receives the problem
  // object and returns the link for more advanced use cases.
  link: "https://jutge.org/problems/", // IDs will be appended to this.
  tags: (
    oak.tag("easy", green.darken(60%)),
    oak.tag("hard", red.darken(60%))
  ),
  default-lang: "cc",
)

#let data = (
  // Use sections to organize problems. The second parameter
  // must be a list of problem objects.
  oak.section("A section",
      // Name is the first string parameter, and the solution
      // is the first content or raw block parameter.
      oak.problem("Hello world!", [
        A text solution.
    
        This one's easy.
      ], tags: ("easy"), author: "Who Knows"),
  ),
  oak.section("Another section",
      // Using auto will read the file "P52109.cc" in the current directory
      // and use it as the solution.
      oak.problem("Siracusa function", "P52109", auto),
      
      // Use the oak.solution function to add a title or description or
      // override the language. You can specify multiple solutions.
      oak.problem("Darkened", "P79756", (
        // This will read "P79756-1.cc" 
        oak.solution(auto, title: "Obvious solution"),
        // This will read "P79756-2.cc" 
        auto, // Unnamed solution
        // This will read "P79756-3.py" 
        oak.solution(auto, title: "Even more efficient solution", descr: [
          This one even has a description.
        ], lang: "py")
      ))
  )
)

= Problem list

#oak.problems-list(
  data,
)

#pagebreak()

= Solutions
#oak.problems-solutions(
  data,
)


```

## Examples

See the [examples](examples) directory.

## Publishing

Before publishing to Typst Universe:

1. Fill in package metadata in `typst.toml` and make sure the package name is acceptable for Universe.
2. Add real documentation to this README and keep `LICENSE` in the package root.
3. Run `tyler check` to validate the manifest and package layout.
4. Run `tyler build -i` to install and test locally.
5. Run `tyler build -p` when you are ready to prepare a submission to `typst/packages`.

References:

- Universe: https://typst.app/universe/
- Package manifest rules: https://github.com/typst/packages/blob/main/docs/manifest.md
- Package repository: https://github.com/typst/packages
