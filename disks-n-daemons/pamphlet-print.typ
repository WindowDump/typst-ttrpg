#set document(
  title: "Disks & Daemons - Print Version",
  author: "Window Dump",
  keywords: ("fist", "world of dungeons", "wodu", "pbta", "osr", "nsr"),
)

#import "template.typ": *
#import "pamphlet.typ": *

#show: rest => pamphlet_light(rest)

#show link: it => underline(it, stroke: 0.25pt)

#set page(
  paper: "us-letter",
  flipped: true,
  margin: 12pt,
)

#panel_holder(panel_2, panel_3, panel_1)

#pagebreak()

#panel_holder(panel_4, panel_5, panel_6)
