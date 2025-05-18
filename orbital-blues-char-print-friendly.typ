#set document(
  title: "Orbital Blues Character Sheet (Print Friendly)",
  author: "Window Dump",
  keywords: ("orbital blues", "sad", "space cowboy", "rpg"),
)
#import "orbital-blues-char.typ": *

// pure black and white for ink saving
#show: it => char_sheet_template(it, fg: black, bg: white)

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
