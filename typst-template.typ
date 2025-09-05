  #let article(
  // The book's title.
  title: "Book title",

  // The book's author.
  author: "Author",

  // The book's author.
  species: "default species",

  // The paper size to use.
  paper: "a4",
  
  // The book's content.
  body,
) = {
  // Define color schemes based on species
  let colors = if species == "Adelie" {
    (sidebar: rgb("#FF6B35"), header: rgb("#004E89"))
  } else if species == "Chinstrap" {
    (sidebar: rgb("#7209B7"), header: rgb("#F72585"))
  } else if species == "Gentoo" {
    (sidebar: rgb("#0D2C54"), header: rgb("#339989"))
  } else {
    // Default colors
    (sidebar: rgb("#0D2C54"), header: rgb("#339989"))
  }

  // Set the document's metadata.
  set document(title: title, author: author)

  // Set the body font.
  set text(font: "Source Sans Pro")

  // Configure the page properties.
  set page(
    paper: paper,
    background: place(
        top,
        rect(
            width: 2cm,
            height: 100%,
            fill: colors.sidebar
        )
    ),
    margin: (bottom: 1cm, top: 1cm, left: 2.5cm, right: 2.5cm),
  )

  page(align(left + top)[
    #h(-1cm)
    #box(
        fill: colors.header,
        width: 0.7fr,
        inset: 10pt,
    )[
        #text(size: 2.5em, fill: white)[*#title*]
    ]
    #v(2em, weak: true)
    #text(size: 1.6em)[Species: ]
    #body
  ])
}