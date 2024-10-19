// World of Dungeons Remix (WoDu Remix)
// character sheet by Window Dump
// https://github.com/WindowDump/typst-ttrpg
// wodu remix - https://katamoiran.itch.io/remix
// wodu - https://johnharper.itch.io/world-of-dungeons

// titles: Fraunces - https://github.com/undercasetype/Fraunces
// headings: Jost - https://indestructibletype.com/Jost
// Typst doesn't support variable fonts - use the static versions

#set document(
  title: "WoDu Remix Character Sheet - Half Letter",
  author: "Window Dump",
  keywords: ("world of dungeons", "wodu", "pbta", "osr"),
)

#set page(
  paper: "us-letter",
  flipped: true,
  margin: (x: 36pt, top: 36pt, bottom: 36pt),
)

// outline of small boxes players write in
// set to 0.25pt for increased legibility, nice with single contrast sheet
#let small_box_stroke = 0pt

#let thick_grid = 3pt
#let thin_grid = 1.5pt

// labels in writeable areas of sheet
#let sheet_label(it) = text(
  font: "Jost*",
  size: 8pt,
  weight: 400,
  number-width: "proportional",
  tracking: 0.05em,
  upper(it),
)

// small writeable box
#let sheet_box(
  it,
) = rect(
  fill: white,
  width: 100%,
  height: 100%,
  inset: 2pt,
  stroke: small_box_stroke,
  sheet_label(it),
)

// rectangle with quarter-circle cutouts
#let cutout_box(
  width: 30pt,
  height: 30pt,
  corner_cut: 4pt,
  box_stroke: (paint: black, thickness: 1pt),
) = path(
  (corner_cut, 0pt),
  (width - corner_cut, 0pt),
  ((width, corner_cut), (-corner_cut, 0pt), (0pt, 0pt)),
  (width, height - corner_cut),
  ((width - corner_cut, height), (0pt, -corner_cut), (0pt, 0pt)),
  (corner_cut, height),
  ((0pt, height - corner_cut), (corner_cut, 0pt), (0pt, 0pt)),
  (0pt, corner_cut),
  ((corner_cut, 0pt), (0pt, corner_cut), (0pt, 0pt)),
  closed: true,
  fill: white,
  stroke: box_stroke,
)

// cutout box with label
#let sheet_box_cutout(it, box_stroke: none) = {
  place(cutout_box(height: 100%, width: 100%, box_stroke: box_stroke))
  place(dx: 6pt, dy: 2pt, sheet_label(it))
}

// thicker label for use on colored background
#let sheet_label_light(block_fill: none, text_fill: white, it) = {
  set par(leading: thick_grid)
  block(
    fill: block_fill,
    outset: (1pt),
    text(
      font: "Jost*",
      size: 8pt,
      weight: 500,
      fill: text_fill,
      number-width: "proportional",
      tracking: 0.05em,
      upper(it),
    ),
  )
}

// header text on top of colored backgroung
#let sheet_header(block_fill: none, text_fill: white, it) = block(
  fill: block_fill,
  outset: (1pt),
  radius: 2pt,
  text(
    font: "Fraunces 9pt Soft",
    size: 9pt,
    weight: 800,
    tracking: 0.03em,
    fill: text_fill,
    upper(it),
  ),
)

// big box with big label
#let attribute_box(it, stroke: 1pt) = {
  let corner_cut = 4pt
  grid(
    columns: (auto, auto, 1fr),
    grid.cell(
      rowspan: 2,
      rect(
        height: 100%,
        width: 0pt,
        outset: (left: thick_grid, right: corner_cut - 0.5pt),
        fill: white,
        stroke: none,
      ),
    ),
    grid.cell(
      rowspan: 2,
      x: 2,
      align: left + horizon,
      block(
        height: 100%,
        width: 100%,
        inset: (left: 4pt),
        outset: (left: corner_cut - 0.5pt),
        fill: white,
        text(
          font: "Fraunces 72pt SuperSoft",
          size: 20pt,
          weight: 700,
          tracking: 0.03em,
          it,
        ),
      ),
    ),
    grid.cell(
      x: 1,
      y: 1,
      align: center + horizon,
      cutout_box(
        width: 30pt,
        height: 30pt,
        corner_cut: corner_cut,
        box_stroke: stroke,
      ),
    ),
  )
}

// circle with name
#let skill(it) = grid(
  columns: (auto, 1fr),
  inset: ((left: 0.5pt), 0pt),
  column-gutter: 2.5pt,
  align: left + horizon,
  circle(radius: 3pt, fill: white, stroke: 0.5pt),
  text(font: "Jost*", size: 7pt, weight: 500, tracking: 0.06em, upper(it)),
)

// little box
#let firstaid_max_track() = rect(
  width: 100%,
  height: 100%,
  radius: 1pt,
  fill: white,
  stroke: small_box_stroke,
)

// little circle
#let firstaid_used_track() = circle(
  radius: auto,
  fill: white,
  stroke: small_box_stroke,
)

// hack to expand special abilities
#let row_spacing = for value in range(1, 11) {
  if value == 9 {
    (1fr,)
  } else {
    (24pt,)
  }
}

// the main sheet
#let main_sheet(
  header_outline,
  header_fill,
  label_outline,
  label_fill,
  background_fill: black,
) = grid(
  columns: (1fr,) * 10,
  rows: row_spacing,
  gutter: thin_grid,
  // identity
  grid.cell(colspan: 3, sheet_box[Name]),
  grid.cell(colspan: 3, sheet_box[Class]),
  grid.cell(colspan: 3, sheet_box[Heritage]),
  grid.cell(align: top + center, sheet_box[Level]),
  grid.cell( // attributes
    colspan: 6,
    rowspan: 5,
    grid(
      columns: (1fr, 1fr),
      rows: (auto, 1fr),
      column-gutter: thin_grid,
      grid.cell(
        colspan: 2,
        inset: (top: thick_grid - thin_grid, bottom: thick_grid),
        align: top + center,
      )[
        #place( // left side cutout
          top + left,
          dx: -thick_grid - 6.5pt,
          dy: thick_grid,
          rect(fill: white, height: 100% + 6.5pt, width: 13pt, radius: 6.5pt)
        )
        #sheet_header(block_fill: header_outline, text_fill: header_fill)[Attributes]
      ],
      attribute_box(stroke: 0.5pt)[STR],
      attribute_box(stroke: 0.5pt)[INT],
      attribute_box(stroke: 0.5pt)[DEX],
      attribute_box(stroke: 0.5pt)[WIS],
      attribute_box(stroke: 0.5pt)[CON],
      attribute_box(stroke: 0.5pt)[CHA],
    ),
  ),
  grid.cell( // skills
    colspan: 4,
    rowspan: 5,
    grid(
      columns: 1fr,
      rows: (auto, 1fr),
      grid.cell(
        inset: (top: thick_grid - thin_grid, bottom: thick_grid, right: thick_grid*2),
        align: top + center,
      )[
        #place( // right side cutout
          top + right,
          dx: thick_grid*3 + 6.5pt,
          dy: thick_grid,
          rect(fill: white, height: 100% + 6.5pt, width: 13pt, radius: 6.5pt)
        )
        #sheet_header(block_fill: header_outline, text_fill: header_fill)[Skills]
      ],
      rect(
        fill: white,
        width: 100% - thick_grid*2 - 0.5pt,
        height: 100%,
        inset: (x: 2pt, y: 4pt),
        stroke: none,
        grid(
          columns: (1fr, 1fr),
          column-gutter: 2pt,
          row-gutter: 1fr,
          align: left + horizon,
          skill[Athletics],
          skill[Lore],
          skill[Awareness],
          skill[Medicine],
          skill[Craft],
          skill[Music],
          skill[Deception],
          skill[Mysteries],
          skill[Decipher],
          skill[Stealth],
          skill[Focus],
          skill[Survival],
          skill[Heal],
          skill[Tactics],
          skill[Leadership],
          skill[Use Devices],
          skill[#align(bottom, line(length: 95%, stroke: (0.5pt)))],
          skill[#align(bottom, line(length: 95%, stroke: (0.5pt)))],
        ),
      ),
    ),
  ),
  grid.cell( // special abilities
    colspan: 10,
    rowspan: 3,
    grid(
      rows: (auto, 1fr),
      columns: 1fr,
      grid.cell(
        inset: (top: thick_grid - thin_grid, bottom: thick_grid),
        align: top + center,
        sheet_header(
          block_fill: header_outline,
          text_fill: header_fill
        )[Special Abilities]
      ),
      sheet_box_cutout[],
    ),
  ),
  grid.cell(colspan: 4, rowspan: 4, inset: (top: thick_grid - thin_grid, right: (thick_grid - thin_grid)/2), sheet_box_cutout[Weapons]),
  grid.cell(colspan: 6, rowspan: 4, inset: (top: thick_grid - thin_grid, left: (thick_grid - thin_grid)/2), sheet_box_cutout[Equipment]),
  grid.cell( // misc stats
    colspan: 10,
    rowspan: 3,
    align: center + horizon,
    inset: (y: thick_grid - thin_grid),
    grid(
      rows: (1fr, 24pt, 1fr, 24pt),
      columns: (1fr,) * 10,
      gutter: thick_grid,
      grid.cell(
        colspan: 6,
        sheet_header(block_fill: header_outline, text_fill: header_fill)[Armor],
      ),
      grid.cell(
        colspan: 2,
        sheet_header(block_fill: header_outline, text_fill: header_fill)[Hit Dice],
      ),
      grid.cell(
        colspan: 2,
        sheet_header(block_fill: header_outline, text_fill: header_fill)[Hit Points],
      ),
      grid.cell(
        colspan: 6,
        inset: (x: 6pt),
        grid(
          columns: (1fr, auto, 1fr, auto, 1fr, auto,),
          column-gutter: thick_grid,
          align: right + horizon,
          sheet_label_light(block_fill: label_outline, text_fill: label_fill)[Worn Armor],
          circle(fill: white, stroke: small_box_stroke),
          sheet_label_light(block_fill: label_outline, text_fill: label_fill)[Shield],
          circle(fill: white, stroke: small_box_stroke),
          sheet_label_light(block_fill: label_outline, text_fill: label_fill)[Total Armor],
          path(
            ((0pt, 0pt), (0pt, 0pt), (0pt, 0pt)),
            ((24pt, 0pt), (0pt, 0pt), (0pt, 20pt)),
            ((12pt, 100%), (4pt, 0pt), (-4pt, 0pt)),
            ((0pt, 0pt), (0pt, 20pt), (0pt, 0pt)),
            fill: white,
            stroke: small_box_stroke,
          )
        ),
      ),
      grid.cell(colspan: 2, sheet_box_cutout(box_stroke: small_box_stroke)[]),
      grid.cell(colspan: 2, sheet_box_cutout(box_stroke: small_box_stroke)[]),
      grid.cell(
        colspan: 3,
        sheet_header(block_fill: header_outline, text_fill: header_fill)[Bonus Damage],
      ),
      grid.cell(
        colspan: 3,
        sheet_header(block_fill: header_outline, text_fill: header_fill)[Debilities],
      ),
      grid.cell(
        colspan: 4,
        sheet_header(block_fill: header_outline, text_fill: header_fill)[First Aid],
      ),
      grid.cell(colspan: 3, sheet_box_cutout(box_stroke: small_box_stroke)[]),
      grid.cell(colspan: 3, sheet_box_cutout(box_stroke: small_box_stroke)[]),
      grid.cell(colspan: 4, inset: (x: 16pt), align: horizon, grid(
        columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
        rows: 1fr,
        column-gutter: (thick_grid, thin_grid),
        row-gutter: thick_grid,
        grid.cell(
          align: right,
          sheet_label_light(
            block_fill: label_outline,
            text_fill: label_fill,
          )[Max],
        ),
        firstaid_max_track(),
        firstaid_max_track(),
        firstaid_max_track(),
        firstaid_max_track(),
        firstaid_max_track(),
        grid.cell(
          align: right,
          sheet_label_light(
            block_fill: label_outline,
            text_fill: label_fill,
          )[Used],
        ),
        firstaid_used_track(),
        firstaid_used_track(),
        firstaid_used_track(),
        firstaid_used_track(),
        firstaid_used_track(),
      )),
    ),
  ),
  grid.cell( // remarks
    colspan: 10,
    rowspan: 2,
    sheet_box_cutout[Remarks],
  ),
  grid.cell(
    colspan: 5,
    align: right + horizon,
    inset: (top: thick_grid - thin_grid),
  )[
    #place(
      bottom + left,
      dx: -thick_grid - 4.5pt,
      dy: thick_grid + 4.5pt,
      circle(fill: white, radius: 4.5pt)
    )
    #grid(
      columns: 2,
      column-gutter: thick_grid,
      block(inset: 2pt, radius: 3pt, fill: header_outline,
        text(
          font: "Fraunces 9pt Soft",
          size: 14pt,
          weight: 800,
          fill: header_fill,
          tracking: 0.03em,
          upper[Coin]
        )
      ),
      cutout_box(width: 100%, height: 100%, corner_cut: 4pt, box_stroke: small_box_stroke)
    )
  ],
  grid.cell(
    colspan: 2,
    align: right + horizon,
    inset: (top: thick_grid - thin_grid, x: thick_grid),
    block(inset: 2pt, radius: 3pt, fill: header_outline, text(
        font: "Fraunces 9pt Soft",
        size: 14pt,
        weight: 800,
        fill: header_fill,
        tracking: 0.03em,
        upper[XP],
      )
    )
  ),
  grid.cell(
    colspan: 3,
    inset: (top: thick_grid - thin_grid),
  )[
    #place(
      bottom + right,
      dx: thick_grid + 4.5pt,
      dy: thick_grid + 4.5pt,
      circle(fill: white, radius: 4.5pt),
    )
    #cutout_box(width: 100%, height: 100%, corner_cut: 4pt, box_stroke: small_box_stroke)
  ],
)

// text at top of sheet - "WoDu Remix"
#let default_header = (
  text(
    font: "Fraunces 9pt",
    weight: 700,
    tracking: -0.02em,
    size: 24pt,
  )[WoDu],
  text(
    font: "Fraunces 9pt SuperSoft",
    style: "italic",
    weight: 300,
    tracking: -0.05em,
    size: 24pt,
  )[Remix],
)

// just a full rectangle
#let full_rect(fill) = rect(
  fill: fill,
  width: 100%,
  height: 100%,
)

// header, background, main sheet
#let halfsheet(
  sheet_bg: full_rect(black),
  sheet_header: default_header,
  header_outline: none,
  header_fill: white,
  label_outline: none,
  label_fill: white,
) = block(height: 100%)[
  #place(sheet_bg)
  #set block(below: 0pt, above: 0pt)
  #rect(
    fill: white,
    outset: (x: 1pt, top: 1pt),
    inset: (bottom: thin_grid, top: 0pt, x: 0pt),
    height: 24pt,
    grid( // sheet header
      columns: (auto, auto, 1fr),
      rows: 24pt,
      inset: (bottom: 2pt),
      column-gutter: 4pt,
      align: bottom + left,
      ..sheet_header,
      grid.cell(align: top + right, sheet_label[Player]),
    ),
  )
  #rect( // main body
    height: 8.5 * 72pt - 72pt - 24pt,
    width: 100%,
    inset: thick_grid,
    stroke: none,
    main_sheet(
      header_outline,
      header_fill,
      label_outline,
      label_fill,
      background_fill: sheet_bg.fill,
    ),
  )
]

#show: rest => columns(2, gutter: 72pt, rest)

// set up gradients for the grid

#let mako_radial = gradient.radial(
  ..color.map.mako,
  focal-center: (50%, 35%),
  focal-radius: 10%,
  radius: 90%,
)

#let icefire_radial = gradient.radial(
  ..color.map.icefire,
  focal-center: (50%, 30%),
  focal-radius: 0%,
  radius: 80%,
)

#let viridis_radial = gradient.radial(
  ..color.map.viridis,
  center: (25%, 80%),
  radius: 145%,
  focal-center: (50%, 40%),
).repeat(2, mirror: true)

#let flare_linear = gradient.linear(
  ..color.map.flare,
  angle: 75deg,
).repeat(4, mirror: true)

#let wodu_blue = rgb("#007295")
#let PINK = color.hsv(355deg, 25%, 100%)
#let blackcurrant = rgb("#492950")
#let risus_green = color.hsv(302.997deg, 100%, 44.7%)

// big VGA DOS game vibes
#let chrome_text = gradient.linear(
  (luma(85%), 0%),
  (luma(100%), 10%),
  (luma(90%), 55%),
  (luma(65%), 80%),
  (luma(100%), 100%),
  angle: 90deg,
)

// li'l hack to stroke text without going into the main fill
// pass text.with() to it. note that stroke will be about half of listed
// value since it's obscured by the main text
#let text_stroke(base_text, fill: black, stroke: 0.5pt) = [
  #place(base_text(stroke: stroke))
  #base_text(fill: fill)
]

// alternate header with the BG fill on "WoDu" and chrome "Remix"
#let bg_chrome_header(fill: white) = (
  text_stroke(
    text.with(
      font: "Fraunces 72pt",
      weight: 700,
      tracking: 0.04em,
      size: 24pt,
    )[WoDu],
    fill: fill,
    stroke: 1pt,
  ),
  block(
    text_stroke(
      text.with(
        font: "Fraunces 9pt SuperSoft",
        style: "italic",
        weight: 300,
        tracking: -0.03em,
        size: 24pt,
      )[Remix],
      fill: chrome_text,
      stroke: 1pt,
    ),
  ),
)

// let's render some sheets!

#halfsheet()
#halfsheet()

#let flare_chrome = halfsheet(
  sheet_bg: full_rect(flare_linear),
  header_outline: luma(0%, 35%),
  header_fill: chrome_text,
  sheet_header: bg_chrome_header(fill: flare_linear),
)

// #flare_chrome
// #flare_chrome

#let mako_chrome = halfsheet(
  sheet_bg: full_rect(mako_radial),
  header_outline: luma(0%, 50%),
  header_fill: chrome_text,
  sheet_header: bg_chrome_header(fill: mako_radial),
)

// #mako_chrome
// #mako_chrome

// set small_box_stroke = 0.25pt for increased visibility
// TODO: be able to set it down here? idk
#let low_ink = halfsheet(
  sheet_bg: full_rect(luma(85%)),
  header_fill: black,
  label_fill: black,
)

// #low_ink
// #low_ink
