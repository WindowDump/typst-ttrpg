// original text from: https://docs.google.com/document/d/1Coy_8zLWFN8hPuXSwix95w_hEK9Ou5-vzjQl-MDiQl8/edit?usp=sharing

#set document(
  title: "Runic Magic",
  author: "skander, Window Dump",
  keywords: ("world of dungeons", "wodu", "pbta", "osr", "runic", "magic"),
)

#set page(
  paper: "us-letter",
  flipped: false,
  margin: (x: 48pt, top: 48pt, bottom: 48pt),
)

// Rune dictionary, to be consumed by tables
// references (shout out to _Ultima V_ fans):
// https://wiki.ultimacodex.com/wiki/File:Runicbig.gif
// https://wiki.ultimacodex.com/wiki/Incantation
// Elstob stylistic sets 12-14 are runes.
// 12, Early English Futhorc, probably matches closest.
// Elstob is big, download it here: https://github.com/psb1558/Elstob-font/releases/latest
#let runes = (
  (glyph: "ᚫ", name: "An", meaning: "Negate"),
  (glyph: "ᛒ", name: "Bet", meaning: "Small"),
  (glyph: "ᚳ", name: "Corp", meaning: "Death"),
  (glyph: "ᛞ", name: "Des", meaning: "Lower"),
  (glyph: "e", name: "Ex", meaning: "Free"),
  (glyph: "ᚠ", name: "Flam", meaning: "Flame"),
  (glyph: "ᛄ", name: "Jux", meaning: "Harm"),
  (glyph: "ᚹ", name: "Kal", meaning: "Summon"),
  (glyph: "ᛚ", name: "Lor", meaning: "Light"),
  (glyph: "ᛗ", name: "Mani", meaning: "Life"),
  (glyph: "ᚾ", name: "Nox", meaning: "Poison"),
  (glyph: "ᚩ", name: "Ort", meaning: "Magic"),
  (glyph: "ᛈ", name: "Por", meaning: "Move"),
  (glyph: "ᚴ", name: "Quas", meaning: "Deceive"),
  (glyph: "ᚱ", name: "Rel", meaning: "Change"),
  (glyph: "ᛋ", name: "Sanet", meaning: "Protection"),
  (glyph: "ᛏ", name: "Tym", meaning: "Time"),
  (glyph: "ᚢ", name: "Uus", meaning: "Raise"),
  (glyph: "ᛜ", name: "Vas", meaning: "Great"),
  (glyph: "ᛣ", name: "Xen", meaning: "Creature"),
  (glyph: "ᚻ", name: "Wis", meaning: "Knowledge"),
  (glyph: "y", name: "Ylem", meaning: "Matter"),
  (glyph: "ᛝ", name: "Zu", meaning: "Sleep"),
  (glyph: "ᛠ", name: "Ear", meaning: "Sound"),
)

#set text(
  font: "ElstobD 10pt",
  size: 11pt,
  weight: 400,
  number-width: "proportional",
  number-type: "old-style",
)

#show heading.where(level: 1): it => block(
  above: 0pt,
  below: 14pt,
  width: 100%,
  align(
    center,
    text(
      it,
      font: "ElstobD 18pt",
      size: 20pt,
      weight: 600,
      tracking: 0.25em,
      spacing: 300%,
      features: ("smcp": 1),
    ),
  ),
)

#show heading.where(level: 2): it => block(
  text(
    it,
    font: "ElstobD",
    size: 14pt,
    weight: 600,
    tracking: 0.10em,
    features: ("smcp": 1),
  ),
)

#show heading.where(level: 3): it => block(
  text(
    it,
    weight: 600,
  ),
)

#show link: it => text(
  it,
  tracking: 0.04em,
  features: ("smcp": 1),
)

#show smallcaps: set text(tracking: 0.05em)

#set strong(delta: 200)

= Runic Magic

#grid(
  columns: (1fr,) * 6,
  align: center + horizon,
  stroke: 0.5pt,
  inset: (y: 14pt),
  ..runes.map(rune => grid(
    row-gutter: 10pt,
    text(
      rune.name,
      font: "ElstobD 8pt",
      size: 9pt,
      weight: 500,
      features: ("smcp",),
      tracking: 0.08em,
    ),
    text(
      rune.glyph,
      font: "ElstobD 18pt",
      size: 24pt,
      weight: 600,
      stylistic-set: 12,
    ),
    text(
      rune.meaning,
      font: "ElstobD 10pt",
      size: 10pt,
      weight: 500,
    )
  )),
)

#set par(leading: 0.65em)

#pad(x: 72pt, top: 14pt)[
  == Draw Runes

  When you have time for meditation and connection with the sources of your power, return all your runes to the deck. Shuffle. *Draw 2d6+level runes.*

  == Cast Runic Magic

  Combine runes to form a reasonable spell. To cast a spell, *roll 2d6+modifiers*:
  - *6-:* _miss_; the spell turns out badly.\
  - *7-9:* _partial success_; the spell is cast, but there's some cost, compromise, or harm.\
  - *10+:* _full success_; the spell is cast without complications.\

  By default, a spell takes 30-60 seconds to cast, lasts for a single use or with active concentration, and affects you or someone you touch in a noticeable way. Once used, runes lose power until you #smallcaps[draw runes] again.

  #grid(
    columns: (1fr,) * 2,
    column-gutter: 6pt,
    [
      === Add +1 to the roll for each:
      - Use more than 2 runes in the spell
      - Sacrifice 1d6 #smallcaps[hp]
      - Take much longer
    ],
    [
      === Subtract -1 from the roll for each:
      - Increase range
      - Affect group or area
      - Cast instantly
      - Subtle effect and casting
      - Long-lasting
    ],
  )

  Change to suit your systems of choice. For example, to use with #link("https://claymorerpgs.itch.io/fist")[_FIST_,]\ draw 2d6+number of traits runes, and gain #smallcaps[a bag of runes] and +1 #smallcaps[max hp].

  #text(
    font: "ElstobD 8pt",
    size: 9pt,
  )[Original text by skander. Layout by #link("https://windowdump.github.io")[Window Dump]. Based on the system used in the\ _Ultima_ games. Some text and much inspiration from Tam H.'s #link("https://katamoiran.itch.io/remix")[_World of Dungeons Remix_].]
]

#pagebreak()

#set page(margin: (x: 72pt, y: 48pt))

// getting this to show up in contents but not visible
#show heading.where(level: 1): none
= Printable Runes

#grid(
  columns: (1fr,) * 4,
  rows: (1fr,) * 6,
  align: center + horizon,
  stroke: 0.5pt,
  ..runes.map(rune => grid.cell(
    inset: (y: 14pt),
    grid(
      row-gutter: 1fr,
      text(
        rune.name,
        font: "ElstobD 10pt",
        size: 11pt,
        weight: 500,
        features: ("smcp",),
        tracking: 0.08em,
      ),
      text(
        rune.glyph,
        font: "ElstobD 18pt",
        size: 48pt,
        weight: 700,
        stylistic-set: 12,
      ),
      text(
        rune.meaning,
        font: "ElstobD",
        size: 13pt,
        weight: 500,
      )
    ),
  )),
)

