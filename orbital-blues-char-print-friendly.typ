#set document(
  title: "Orbital Blues Character Sheet (Print Friendly)",
  author: "Window Dump",
  keywords: ("orbital blues", "sad", "space cowboy", "osr"),
)
#import "flexoki.typ": *
#import "orbital-blues-char.typ": *

#set page(
  paper: "us-letter",
  flipped: true,
  margin: 0.5in,
)

#sheet_colors_fg.update(black) // does not update line colors rn
#sheet_bg.update(white)
#show: sheet_template

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
  remarks: [],
))
