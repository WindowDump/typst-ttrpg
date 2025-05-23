// orbital blues

#set document(
  title: "Orbital Blues Character Sheet Demo",
  author: "Window Dump",
  keywords: ("orbital blues", "sad", "space cowboy", "rpg"),
)
#import "flexoki.typ": *

// placeholder default values
#let sheet_black = flexoki-black
#let sheet_white = yellow-50

// global gutter value
#let glob_gutter = 4pt

// hack for montserrat having one stylistic set
#let heading_text(it, spacing: 0pt) = {
  stack(
    dir: ltr,
    ..for l in str(it) {
      l = upper(l)
      (
        text(
          l,
          stylistic-set: if l == "Q" or l == "G" { (1,) } else {
            ()
          },
        ),
      )
    },
    spacing: spacing,
  )
}

// Sheet will update lines based on text fill, which this template sets.
#let char_sheet_template(doc, fg: sheet_black, bg: sheet_white) = {
  set page(
    fill: bg,
    paper: "us-letter",
    flipped: true,
    margin: 0.5in,
  )
  set text(
    font: "League Spartan",
    fill: fg,
    size: 12pt,
  )
  set strong(delta: 200)
  show emph: it => text(it, weight: 500)

  let to-string(it) = {
    if type(it) == str {
      it
    } else if type(it) != content {
      str(it)
    } else if it.has("text") {
      it.text
    } else if it.has("children") {
      it.children.map(to-string).join()
    } else if it.has("body") {
      to-string(it.body)
    } else if it == [ ] {
      " "
    }
  }

  show heading.where(level: 1): it => text(
    heading_text(to-string(it.body), spacing: 0.10em),
    font: "Montserrat",
    size: 13pt,
    weight: 600,
  )
  show heading.where(level: 2): it => text(
    heading_text(to-string(it.body), spacing: 0.10em),
    font: "Montserrat",
    size: 12pt,
    weight: 500,
  )

  doc
}

#show: char_sheet_template

#let sheet_line_dotted(fill: sheet_black) = (
  thickness: 1pt,
  paint: fill,
  dash: (0pt, 3pt),
  cap: "round",
)

#let sheet_line_solid(fill: sheet_black) = (
  thickness: 1pt,
  paint: fill,
)

#let sheet_line_thick(fill: sheet_black) = (
  thickness: glob_gutter / 2,
  paint: fill,
)

#let sheet_line_placeholder = context pad(
  line(stroke: sheet_line_dotted(fill: text.fill), length: 20pt),
  top: 12pt,
)

#let sheet_label(it) = text(
  upper(it),
  font: "Archivo",
  stretch: 50%,
  tracking: 0.15em,
)

#let big_label(it) = text(
  upper(it),
  weight: 600,
  size: 18pt,
)

#let thick_heading(it) = context {
  show heading.where(level: 1): it => text(
    heading_text(it.body.text, spacing: 0.12em),
    font: "Montserrat",
    fill: if type(page.fill) != "auto" { page.fill } else { white },
    size: 13pt,
    weight: 700,
  )
  show heading.where(level: 2): it => text(
    heading_text(it.body.text, spacing: 0.12em),
    font: "Montserrat",
    fill: if type(page.fill) != "auto" { page.fill } else { white },
    size: 12pt,
    weight: 600,
  )
  block(
    align(center, it),
    below: 6pt,
    fill: text.fill,
    inset: glob_gutter,
    width: 100%,
  )
}

#let sheet_header = grid(
  columns: 1fr,
  row-gutter: glob_gutter * 2,
  stack(
    dir: ltr,
    spacing: 1fr,
    ..for l in "Orbital Blues" {
      l = upper(l)
      (text(l, font: "Montserrat", size: 16pt, weight: 900),)
    },
  ),
  stack(
    dir: ltr,
    spacing: 1fr,
    ..for l in "Lo-Fi Space Western Roleplaying" {
      l = upper(l)
      (text(l, font: "Archivo", size: 9pt, stretch: 50%, weight: 500),)
    },
  ),
)

#let sheet_subheading(it, x: auto, y: auto, colspan: 1) = grid.cell(
  text(
    heading_text(it, spacing: 0.15em),
    font: "Montserrat",
    size: 16pt,
    weight: 600,
  ),
  x: x,
  y: y,
  colspan: colspan,
  inset: (x: glob_gutter, bottom: glob_gutter * 3, top: glob_gutter * 2),
  align: center + bottom,
  stroke: (bottom: sheet_line_thick(fill: text.fill)),
)

#let char_profile(char) = grid(
  columns: (auto, 1fr) * 2,
  column-gutter: (glob_gutter, glob_gutter * 2, glob_gutter),
  row-gutter: glob_gutter,
  inset: ((y: glob_gutter), (y: glob_gutter, x: glob_gutter)),
  align: bottom,
  stroke: (x, y) => {
    if calc.odd(x) { (bottom: sheet_line_dotted(fill: text.fill)) }
  },
  sheet_label[Player], grid.cell(colspan: 3, char.player),
  sheet_label[Name], grid.cell(colspan: 3, char.character),
  sheet_label[Crew], grid.cell(colspan: 3, char.crew),
  sheet_label[Ship], grid.cell(colspan: 3, char.ship),
  // sheet_label[Sector], grid.cell(colspan: 3, char.sector),
  sheet_label[Credits], char.credits, sheet_label[Debt], char.debt,
)

#let char_stats_heart_boxes(char) = stack(
  dir: ltr,
  spacing: glob_gutter,
  ..range(if type(char.grit) == int { char.grit + 8 } else {
    11
  }).map(heart => {
    let filled = if type(char.heart) == int { char.heart + heart } else {
      11
    }
    let max_hearts = if type(char.grit) == int { char.grit + 8 } else {
      11
    }
    block(
      stroke: sheet_line_solid(fill: text.fill),
      width: 12pt,
      height: 12pt,
      {
        if filled < max_hearts {
          place(
            line(
              stroke: sheet_line_solid(fill: text.fill),
              start: (15%, 15%),
              end: (85%, 85%),
            ),
          )
          place(
            line(
              stroke: sheet_line_solid(fill: text.fill),
              start: (15%, 85%),
              end: (85%, 15%),
            ),
          )
        }
      },
    )
  }),
)
#let str_if_int(it) = if type(it) == int { str(it) } else { it }

#let char_stats(char) = {
  grid(
    align: center,
    row-gutter: glob_gutter * 4,
    grid(
      columns: (1fr,) * 3,
      row-gutter: glob_gutter * 2,
      big_label(str_if_int(char.muscle)),
      big_label(str_if_int(char.grit)),
      big_label(str_if_int(char.savvy)),
      sheet_label[Muscle], sheet_label[Grit], sheet_label[Savvy],
    ),
    grid(
      columns: if char.at("use_heart_boxes", default: false) { 1 } else { 2 },
      column-gutter: glob_gutter * 4,
      row-gutter: (glob_gutter * 2, glob_gutter * 4, glob_gutter * 2),
      ..if char.at("use_heart_boxes", default: false) {
        (
          pad(y: 2pt, char_stats_heart_boxes(char)),
          sheet_label[Heart],
          if type(char.blues) == int {
            big_label(str(char.blues))
          } else {
            sheet_line_placeholder
          },
          sheet_label[Blues],
        )
      } else {
        (
          big_label[
            #if type(char.heart) == int { str(char.heart) } else { sheet_line_placeholder } /
            #if type(char.grit) == int { str(8 + char.grit) } else {
              sheet_line_placeholder
            }
          ],
          if type(char.blues) == int { big_label(str(char.blues)) } else {
            sheet_line_placeholder
          },
          sheet_label[Heart],
          sheet_label[Blues],
        )
      },
    ),
  )
}

#let sheet_info_grid(deets) = grid(
  columns: (2fr, 6fr),
  inset: (x, y) => (
    top: if y == 0 { 0pt } else { glob_gutter * 2 },
    bottom: if y == 0 { 0pt } else { glob_gutter * 2 },
    right: if y == 0 { 0pt } else if x == 0 { glob_gutter * 2 } else {
      glob_gutter
    },
    left: if y == 0 { 0pt } else if x == 1 { glob_gutter * 2 } else {
      glob_gutter
    },
  ),
  stroke: (x, y) => (
    right: if x == 0 { sheet_line_solid(fill: text.fill) },
    top: if y > 1 { sheet_line_dotted(fill: text.fill) },
  ),
  align: (x, y) => if y == 0 { center } else { left },
  grid.cell(
    inset: (right: 2pt),
    box(
      sheet_label[Name],
      stroke: (bottom: sheet_line_solid(fill: text.fill)),
      width: 100%,
      outset: (left: 1pt),
      inset: (left: 2pt, top: glob_gutter, bottom: glob_gutter * 2),
    ),
  ),
  grid.cell(
    inset: (left: 2pt),
    box(
      sheet_label[Details],
      stroke: (bottom: sheet_line_solid(fill: text.fill)),
      width: 100%,
      outset: (right: 1pt),
      inset: (right: 2pt, top: glob_gutter, bottom: glob_gutter * 2),
    ),
  ),
  ..for item in deets {
    (text(item.name, size: 10.5pt), text(item.details, size: 10.5pt))
  },
)

#let mug_shot(char) = rect(
  width: 100%,
  height: 102pt,
  stroke: sheet_line_solid(fill: text.fill),
  inset: (y: glob_gutter * 2),
  {
    grid(
      columns: (1fr, 1fr),
      rows: 1fr,
      align: center + horizon,
      inset: (x: glob_gutter),
      stroke: (x, y) => (
        if x == 0 { (right: sheet_line_dotted(fill: text.fill)) } else { none }
      ),
      if "photo_left" in char {
        char.photo_left
      } else {
        sheet_label[Photo\ Missing]
      },
      if "photo_right" in char {
        char.photo_right
      } else {
        sheet_label[Photo\ Missing]
      },
    )
    place(
      center + bottom,
      dy: glob_gutter * 1.5,
      box(
        fill: if type(page.fill) != "auto" { page.fill } else { white },
        inset: (y: glob_gutter),
        sheet_label[(Mug Shot)],
      ),
    )
  },
)

// takes an argument so you can fill it in digitally
#let char_sheet(
  char,
) = context grid(
  columns: (3fr, 5fr, 4fr),
  rows: (auto, auto, auto, auto, auto, auto, 1fr),
  column-gutter: glob_gutter * 4,
  row-gutter: glob_gutter,
  grid.cell(
    sheet_header,
    colspan: 1, //3,
    inset: (
      bottom: glob_gutter * 2,
    ),
    stroke: (bottom: sheet_line_thick(fill: text.fill)),
  ),
  sheet_subheading("Troubles", colspan: 1),
  sheet_subheading("Gambits", colspan: 1),
  grid.cell(
    rowspan: 3,
    // stroke: (bottom: sheet_line_dotted(fill: text.fill)),
    inset: (top: glob_gutter),
    grid(
      row-gutter: (glob_gutter * 1, glob_gutter * 4),
      mug_shot(char),
      char_profile(char),
      grid.cell(
        char_stats(char),
        inset: (bottom: glob_gutter * 2),
      ),
    ),
  ),
  grid.cell(sheet_info_grid(char.troubles), colspan: 1),
  grid.cell(sheet_info_grid(char.gambits), colspan: 1),
  grid.cell(
    sheet_subheading("Equipment & Mementos"),
    colspan: 2,
    stroke: (
      top: sheet_line_dotted(fill: text.fill),
      bottom: sheet_line_thick(fill: text.fill),
    ),
    inset: (top: glob_gutter * 1),
  ),
  grid.cell(
    {
      sheet_info_grid(char.equipment)
      place(
        line(stroke: sheet_line_dotted(fill: text.fill), length: 100%),
        dy: glob_gutter,
      )
    },
    colspan: 2,
    rowspan: 3,
  ),
  sheet_subheading("Remarks", colspan: 1),
  grid.cell(
    block(
      char.remarks,
      width: 100%,
      outset: (x: 1pt),
      // stroke: (bottom: sheet_line_thick(fill: text.fill)),
      inset: (bottom: glob_gutter * 2),
    ),
    colspan: 1,
    inset: (top: glob_gutter),
  ),
)

// printable character sheet
#char_sheet((
  photo_left: [],
  photo_right: [],
  player: [],
  character: [],
  sector: [],
  crew: [],
  ship: [],
  muscle: sheet_line_placeholder,
  grit: sheet_line_placeholder,
  savvy: sheet_line_placeholder,
  use_heart_boxes: true,
  heart: sheet_line_placeholder,
  blues: sheet_line_placeholder,
  credits: "",
  debt: "",
  troubles: (
    (
      name: pad(32pt, []),
      details: [],
    ),
  )
    * 3,
  gambits: (
    (
      name: pad(32pt, []),
      details: [],
    ),
  )
    * 3,
  equipment: (
    (
      name: pad(6pt, []),
      details: [],
    ),
  )
    * 6,
  remarks: pad(46.25pt, []),
))

// variable object to pass to sheet function
// can also just put one in the function call
#let placeholder_char = (
  player: [Placeholder],
  character: [Slab Bulkhead],
  crew: [The Placeholder],
  sector: [Gamma],
  ship: [Elite Crew],
  muscle: 0,
  grit: 2,
  savvy: 1,
  heart: 7,
  use_heart_boxes: true,
  blues: 0,
  credits: "zilch",
  debt: "2",
  photo_left: sheet_label[Restricted\ Access],
  photo_right: sheet_label[Restricted\ Access],
  troubles: (
    (
      name: [In Too Deep],
      // details: [I wriggled free with a forged passport and a phone taped to a turtle. I'm not off the hook. I knew I went too far when I crashed through the fuel depot.],
      details: [
        - Which unsavoury organisation did you work with?
        - Which lawman remembers your face?
        - At what point did you realize you'd gone too far?
        - How did you wriggle free? Are you off the hook?
        - Which old friend would help you with something illegal if you asked nicely?
      ],
    ),
    (
      name: [Time Behind Bars],
      details: [
        - What were you convicted for? Did you do it?
        - What uncommon skills did you learn?
        - What friends did you make?
        - What enemies did you make?
        - Where did you serve your sentence? How long was it?
        // Gain *1 Blues* when:
        // - Something reminds you of your cell or cellmates.
        // - Something reminds you of your jailers.
        // - You use a skill you learned while you were inside.
      ],
    ),
  ),
  gambits: (
    (
      name: [Fast Hands],
      details: [When you roll *Initiative*, roll 2D3 instead and add the higher to your *Savvy*.\ If the party is *Surprised*, you can still act on your first *Turn*.],
    ),
    (
      name: [Martial Art],
      details: [When you *Attack* unarmed, you do not roll *Against the Odds*.\ Your unarmed attacks have *Defensive*.],
    ),
    (
      name: [True Grit],
      details: [Once per *Session*, you may draw on your inner resolve to roll a *Stat Check* or *Attack* with the *Upper Hand*, using your *Grit* instead of the normal Stat.],
    ),
  ),
  equipment: (
    (
      name: [Antique Sneakers],
      details: [Black, well-worn, numerous repairs],
    ),
    (
      name: [Revolver, Sub-Nose],
      details: [Personal -- Concealable],
    ),
    (
      name: [Stun Gun],
      details: [Melee -- Stun],
    ),
  ),
  remarks: [Theme song:\ _Blue Monday_ by New Order],
)

#char_sheet(placeholder_char)

// sheet for the crew's all-important ship
#let ship_sheet(ship) = context grid(
  columns: (3fr, 6fr),
  rows: (auto, 1fr),
  column-gutter: glob_gutter * 4,
  row-gutter: glob_gutter * 3,
  sheet_subheading(ship.name), sheet_subheading("Details"),
  [
    #grid(
      row-gutter: glob_gutter * 4,
      align: center,
      grid(
        row-gutter: glob_gutter * 2,
        columns: (1fr,) * 2,
        big_label(ship.size), big_label(ship.class),
        sheet_label[Size], sheet_label[Class],
      ),
      pad(
        x: 10%,
        grid(
          columns: (1fr,) * 3,
          row-gutter: glob_gutter * 2,
          column-gutter: glob_gutter * 4,
          // inset: (x, y) => {(
          //   bottom: if y == 0 { glob_gutter * 2 } else { 0pt },
          //   left: if x > 0 { glob_gutter * 2 } else { 0pt },
          //   right: if x < 2 { glob_gutter * 2 } else { 0pt },
          //   )
          // },
          // stroke: (x, y) => { if x > 0 { (left: sheet_line_solid) } },
          big_label(str_if_int(ship.body)),
          big_label(str_if_int(ship.mobility)),
          big_label(str_if_int(ship.systems)),

          sheet_label[Body], sheet_label[Mobility], sheet_label[Systems],
        ),
      )
    )

    #thick_heading[= Weaponry]
    #ship.weaponry

    #thick_heading[= Equipment]
    #ship.equipment
  ],
  ship.details,
)

// test it out
#ship_sheet((
  name: "TBD Express",
  size: [Medium],
  class: [Cairn],
  body: 0,
  mobility: 2,
  systems: 1,
  weaponry: [
    - *Pulse Laser* (Personal -- Precise)
      - mounted on side of main chassis
  ],
  equipment: [
    - 2 Hull-Breaching Charges
    - Bio-Compass
    - Night Vision Scanner
  ],
  details: [
    = Former Purpose
    Gambler's Barge

    = Origin
    Found in a scrap heap. (who'd throw this away?)

    = Chassis
    Antique, sought-after by collectors.

    = Extra Feature
    Holodeck, often faulty.
  ],
))
