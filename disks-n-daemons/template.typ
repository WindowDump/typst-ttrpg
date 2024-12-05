#import "@preview/hydra:0.5.1": hydra, selectors
#import selectors: custom

// hydra-friendly chapter indicator

#let chapter = figure.with(
  kind: "chapter",
  supplement: [Chapter],
  numbering: "I.",
)
#let chap = figure.where(kind: "chapter")
#let sect = custom(heading.where(level: 1), ancestors: chap)

// visual identity
// in general: prefer using luma(15%) or whatever you change this to over pure black - save pure black for text
#let dd_grey = luma(15%)
#let accent_gray = luma(65%)
#let emph_gray = luma(92%)

// display trix

#let boxify(word, fill: white, inset: 0pt, outset: 0pt) = for l in word {
  box(upper(l), fill: fill, inset: inset, outset: outset)
}

// dice stuff

#let pip_array = (
  (),
  ((1, 1),),
  ((0, 0), (2, 2)),
  ((0, 0), (1, 1), (2, 2)),
  ((0, 0), (0, 2), (2, 0), (2, 2)),
  ((0, 0), (0, 2), (1, 1), (2, 0), (2, 2)),
  ((0, 0), (0, 1), (0, 2), (2, 0), (2, 1), (2, 2)),
)

// TODO: generate this from the above one somehow
#let pip_array_rot = (
  (),
  ((1, 1),),
  ((0, 2), (2, 0)),
  ((0, 2), (1, 1), (2, 0)),
  ((0, 0), (0, 2), (2, 0), (2, 2)),
  ((0, 0), (0, 2), (1, 1), (2, 0), (2, 2)),
  ((0, 0), (1, 0), (2, 0), (0, 2), (1, 2), (2, 2)),
)

#let d6_maker(
  number,
  fill: white,
  dark: dd_grey,
  thickness: 1pt,
  paint: black,
  size: 20pt,
  radius: 2pt,
  inset: 12%,
  outset: 0%,
) = box(
  fill: if number < 20 {
    fill
  } else {
    dark
  },
  stroke: (
    thickness: thickness,
    paint: if number < 20 {
      paint
    } else {
      dark
    },
  ),
  width: size,
  height: size,
  radius: radius,
  inset: inset,
  outset: outset,
  grid(
    columns: (1fr,) * 3,
    rows: (1fr,) * 3,
    column-gutter: 8%,
    row-gutter: 8%,
    ..for (x, y) in if calc.odd(int(number / 10)) {
      pip_array_rot.at(calc.rem(number, 10))
    } else {
      pip_array.at(calc.rem(number, 10))
    } {
      (
        grid.cell(
          x: x,
          y: y,
          circle(fill: if number < 20 {
            paint
          } else {
            fill
          }),
        ),
      )
    }
  ),
)

#let d6_mini(
  number,
  size: 6.25pt,
  thickness: 0.5pt,
  radius: 1pt,
  inset: 8%,
  outset: 0.5pt,
) = d6_maker(
  number,
  size: size,
  thickness: thickness,
  radius: radius,
  inset: inset,
  outset: outset,
)

// Creates a D6 based on the incoming integer.
// Die style changes based on 10's digit:
// - 0X: light, normal.
// - 1X: light, rotated 90 degrees
// - 2X: dark, normal
// - 3X: dark, rotated 90 degrees
#let dicier_maker(
  x,
  size: 24pt,
  fill: black,
  dark: false,
  top-edge: "bounds",
  bottom-edge: "bounds",
) = text(
  str(calc.rem(x, 10)),
  font: if (x >= 20 and not dark) or (x < 20 and dark) {
    "Dicier Round-Dark"
  } else {
    "Dicier Round"
  },
  weight: 300,
  features: if calc.odd(int(x / 10)) {
    ("cv16": 1, "cv19": 1, "cv20": 1)
  } else {
    ()
  },
  size: size,
  fill: fill,
  top-edge: top-edge,
  bottom-edge: bottom-edge,
)

#let dicier_white(
  it,
  size: 24pt,
  fill: black,
  top-edge: "bounds",
  bottom-edge: "bounds",
) = box(
  dicier_maker(
    it,
    size: size,
    top-edge: top-edge,
    bottom-edge: bottom-edge,
    fill: fill,
  ),
  fill: white,
  radius: 2pt,
)

#let dicier_mini(it, size: 7.75pt, fill: black) = dicier_maker(
  it,
  size: size,
  fill: fill,
  top-edge: "cap-height",
  bottom-edge: "baseline",
)

#let dicier_mini_white(it, size: 7.75pt, fill: black) = dicier_white(
  it,
  size: size,
  fill: fill,
  top-edge: "cap-height",
  bottom-edge: "baseline",
)

#let dicier_gray_white(
  it,
  size: 24pt,
) = dicier_white(it, size: size, fill: dd_grey)


// Creates a 3x3 grid of D6's from the input array of integers.
// Dice style changes based on 10's digit:
// - 0X: light, normal.
// - 1X: light, rotated 90 degrees
// - 2X: dark, normal
// - 3X: dark, rotated 90 degrees
#let dicier_light(arr, columns: 3, gutter: 4pt, size: 24pt) = grid(
  columns: columns,
  gutter: gutter,
  ..arr.map(x => dicier_maker(x, size: size)),
)

// Creates a 3x3 grid of D6's from the input array of integers.
// Text is white for use on dark backgrounds.
// Dice style changes based on 10's digit:
// - 0X: light, normal.
// - 1X: light, rotated 90 degrees
// - 2X: dark, normal
// - 3X: dark, rotated 90 degrees
#let dicier_dark(arr, columns: 3, gutter: 4pt, size: 24pt) = grid(
  columns: columns,
  gutter: gutter,
  ..arr.map(x => dicier_maker(
    x,
    size: size,
    fill: white,
    dark: true,
  )),
)

// layout

#let body_header_text(even_content, odd_content) = text(
  upper(context if calc.even(here().page()) {
    align(bottom + left, even_content)
  } else {
    align(bottom + right, odd_content)
  }),
  fill: white,
  font: "Archivo",
  size: 12pt,
  weight: 500,
  stretch: 150%,
  tracking: 0.10em,
)

#let body_header_text_default = context {
  body_header_text(
    hydra(
      chap,
      skip-starting: false,
      display: (ctx, candidate) => [
        #candidate.numbering #candidate.body
      ],
    ),
    hydra(1, skip-starting: false),
  )
}

#let body_header_block(content) = block(
  fill: dd_grey,
  inset: (x: 36pt, bottom: 6pt),
  width: 100%,
  height: 30pt,
  stroke: (bottom: (paint: accent_gray, thickness: 2pt)),
  content,
)

#let body_header_default = align(
  top,
  body_header_block(body_header_text_default),
)

#let body_page_count = text(
  font: "Charter",
  size: 10pt,
  number-width: "tabular",
  number-type: "lining",
  context if calc.odd(here().page()) {
    align(right, counter(page).display())
  } else {
    align(left, counter(page).display())
  },
)

#let body_margins = (top: 48pt, bottom: 36pt, inside: 48pt, outside: 36pt)

#let chapter_template = doc => {
  set page(
    background: body_header_default,
    footer: body_page_count,
    margin: body_margins,
  )
  doc
}

// typography

// light background

#let h1_light_text(content) = text(
  upper(content),
  hyphenate: false,
  fill: black,
  font: "Archivo",
  size: 14pt,
  stretch: 100%,
  weight: 300,
  tracking: 0.08em,
)

#let h2_light_text(content) = text(
  content,
  hyphenate: false,
  fill: black,
  font: "Archivo",
  size: 11pt,
  stretch: 100%,
  weight: 400,
  tracking: 0.025em,
)

#let h3_light_text(content) = text(
  content,
  hyphenate: false,
  fill: black,
  font: "Archivo",
  size: 11pt,
  stretch: 75%,
  weight: 400,
  tracking: 0.04em,
)

#let h1_light_overline(content) = block(
  h1_light_text(content.body),
  stroke: (top: (paint: dd_grey, thickness: 0.5pt)),
  inset: (top: 8pt),
  outset: (x: 4pt),
  width: 100%,
  above: 14pt,
)

#let h1_light_plain(content) = block(
  h1_light_text(content.body),
  stroke: none,
  inset: 0pt,
  outset: 0pt,
  width: auto,
  above: 1.28em,
)

#let light_body(content) = [
  #show heading: set par(leading: 4pt, justify: false)
  #show heading.where(level: 1): it => h1_light_overline(it)
  #show heading.where(level: 2): it => block(h2_light_text(it.body))
  #show heading.where(level: 3): it => block(h3_light_text(it.body))

  #set par(
    justify: true,
    leading: 0.65em,
    spacing: 0.65em + 0.60em,
    // first-line-indent: 1.2em,
  )
  #set text(
    hyphenate: true,
    // font: "New Computer Modern",
    font: "Charter",
    size: 10pt,
    number-width: "proportional",
    number-type: "lining",
  )
  #content
]

// dark background

#let h1_dark_text(
  content,
  size: 12pt,
) = text(
  upper(content),
  hyphenate: false,
  fill: white,
  font: "Archivo",
  size: size,
  stretch: 75%,
  weight: 500,
  tracking: 0.05em,
)

#let h2_dark_text(
  content,
) = text(
  content,
  hyphenate: false,
  fill: white,
  font: "Archivo",
  size: 12pt,
  weight: 500,
  stretch: 75%,
  tracking: 0.03em,
)

#let h3_dark_text(
  content,
) = text(
  content,
  hyphenate: false,
  fill: white,
  font: "Archivo",
  size: 10pt,
  stretch: 75%,
  weight: 600,
  tracking: 0.05em,
)

#let dark_body(content) = [
  #show heading: set par(leading: 4pt, justify: false)
  #show heading.where(level: 1): it => block(h1_dark_text(it.body))
  #show heading.where(level: 2): it => block(h2_dark_text(it.body))
  #show heading.where(level: 3): it => block(h3_dark_text(it.body))
  #set par(leading: 0.55em)
  #set text(
    fill: white,
    font: "Latin Modern Sans", // demi-condensed
    weight: 500,
    stretch: 75%,
    tracking: 0.01em,
    size: 10pt,
  )
  #align(top + left, content)
]

#let dark_box(
  content,
  fill: dd_grey,
  width: 100%,
  outset: 2pt,
  inset: 6pt,
) = block(
  dark_body(content),
  fill: fill,
  inset: inset,
  outset: outset,
  radius: 8pt,
  breakable: false,
  width: width,
)

// pamphlet stuff

#let pamph_l_h1(
  it,
  size: 13pt,
) = text(
  upper(it),
  hyphenate: false,
  fill: black,
  font: "Archivo",
  size: size,
  // stretch: 110%,
  weight: 300,
  tracking: 0.08em,
)

#let pamph_l_h2(
  content,
) = text(
  upper(content),
  hyphenate: false,
  fill: black,
  font: "Archivo",
  size: 11pt,
  stretch: 75%,
  weight: 500,
  tracking: 0.085em,
)

#let pamph_l_h3(content, size: 10pt) = text(
  upper(content),
  hyphenate: false,
  fill: black,
  font: "Archivo",
  size: size,
  stretch: 75%,
  weight: 500,
  tracking: 0.085em,
)

#let pamph_d_h1(
  content,
  size: 12pt,
) = text(
  upper(content),
  hyphenate: false,
  fill: white,
  font: "Archivo",
  size: size,
  stretch: 110%,
  weight: 500,
  // tracking: 0.05em,
)

#let pamph_d_h2(
  content,
) = text(
  upper(content),
  hyphenate: false,
  fill: white,
  font: "Archivo",
  size: 11pt,
  weight: 600,
  stretch: 50%,
  tracking: 0.08em,
)

#let pamph_d_h3(
  content,
) = text(
  content,
  hyphenate: false,
  fill: white,
  font: "Archivo",
  size: 10pt,
  stretch: 50%,
  weight: 700,
  tracking: 0.04em,
)

#let pamph_l_h1_bar(
  content,
) = block(
  align(left + horizon, par(pamph_d_h1(content), leading: 4pt)),
  fill: dd_grey,
  width: 100%,
  inset: (x: 4pt, y: 6pt),
  // outset: (x: 2pt),
  radius: 2pt,
  // above: 0pt,
)

#let pamph_l_h2_bar(content) = block(
  align(left + horizon, par(pamph_d_h2(content), leading: 4pt)),
  fill: dd_grey,
  width: 100%,
  inset: (x: 2pt, y: 2pt),
  outset: (x: 2pt, y: 2pt),
  radius: 2pt,
)

#let pamphlet_light(content) = [
  #show heading: set par(leading: 3pt, justify: false)
  #show heading.where(level: 1): it => block(pamph_l_h1_bar(it.body))
  #show heading.where(level: 2): it => block(pamph_l_h2(it.body), above: auto)
  #show heading.where(level: 3): it => block(pamph_l_h3(it.body))

  #set par(
    justify: true,
    leading: 0.65em,
    // spacing: 0.65em + 0.60em,
    // first-line-indent: 1.2em,
  )
  #set text(
    hyphenate: true,
    // font: "New Computer Modern",
    // font: "Latin Modern Sans 9",
    font: "Charter",
    size: 9.5pt,
    number-width: "proportional",
    number-type: "lining",
  )
  #content
]

#let pamphlet_dark(content) = [
  #show heading: set par(leading: 3pt, justify: false)
  #show heading.where(level: 1): it => block(pamph_d_h1(it.body))
  #show heading.where(level: 2): it => block(pamph_d_h2(it.body))
  #show heading.where(level: 3): it => block(pamph_d_h3(it.body))

  #set par(
    justify: true,
    leading: 0.65em,
  )
  #set text(
    hyphenate: true,
    fill: white,
    font: "Charter",
    size: 9.5pt,
    number-width: "proportional",
    number-type: "lining",
  )
  #content
]

// patterns from pattern monster

#let outline_cubes = "<svg id='patternId' width='100%' height='100%' xmlns='http://www.w3.org/2000/svg'><defs><pattern id='a' patternUnits='userSpaceOnUse' width='80' height='46.185' patternTransform='scale(2) rotate(0)'><rect x='0' y='0' width='100%' height='100%' fill='#262626ff'/><path d='M0 .002V13.63l9.87-5.69L21.944.975l7.373 4.239C19.536 10.843 9.782 16.503 0 22.135v24.05h.842V23.557l.145-.087C10.71 17.868 20.436 12.266 30.13 6.664v8.476c-4.006 2.35-8.041 4.673-12.076 6.995-3.28 1.887-6.56 3.803-9.869 5.69v18.359H9.87v-6.022a1928.14 1928.14 0 0 1 10.396 6.023h3.338l-1.659-.972c-4.005-2.323-8.04-4.645-12.075-6.967V29.74l28.45 16.445h3.389c9.454-5.482 18.938-10.963 28.421-16.444v8.505a4590.557 4590.557 0 0 1-12.076 6.967l-1.63.972h3.285v-.016c3.483-2.004 6.966-4.006 10.421-6.01v6.024h1.684v-18.36l-6.01-3.483-3.86-2.206a2547.983 2547.983 0 0 1-12.076-6.996V6.662c9.754 5.631 19.536 11.263 29.29 16.894v22.627H80v-24.05L50.682 5.211 58.055.972 70.131 7.94 80 13.63V0h-.842v11.22l-7.344-4.24V0h-1.683v6.023L59.735 0h-3.36l-8.189 4.717v25.37l-7.344 4.238V.48l.146-.087L41.63 0h-3.26l.788.48v33.845l-7.344-4.238V4.717l-6.008-3.454L23.653 0h-3.387L9.87 6.023V0H8.186v6.982L.842 11.22V0zm30.13 17.083v12.017l-10.42-6.009c3.483-2.003 6.966-4.006 10.42-6.008zm19.74 0c3.483 2.002 6.937 4.005 10.42 6.008l-10.42 6.009zm-31.814 6.967 12.075 6.995 9.87 5.69 9.868-5.69 12.076-6.995 7.373 4.237c-9.782 5.66-29.317 16.924-29.317 16.924L10.683 28.289z'  stroke-width='1' stroke='none' fill='#a5a5a5ff'/></pattern></defs><rect width='800%' height='800%' transform='translate(0,0)' fill='url(#a)'/></svg>"
