#set document(
  title: "Longshot City Character Sheet & Quick Reference",
  author: "Window Dump",
  keywords: (
    "longshot city",
    "superhero",
    "troika",
    "fighting fantasy",
    "osr",
    "nsr",
  ),
)

#set page(paper: "us-letter", flipped: true, margin: 36pt)

#let sheet_label(it, size: 12pt) = text(
  it,
  size: size,
  font: "Patrick Hand SC",
  ligatures: false,
  tracking: 0.04em,
)

#let sheet_label_sm(it, size: 10pt) = text(
  upper(it),
  size: size,
  font: "Patrick Hand SC",
  ligatures: false,
  tracking: 0.08em,
)

#let row_gutter = 4pt
#let sheet_box_stroke = (thickness: 1pt, paint: black)

#grid(
  columns: (3fr, 3fr, 4fr),
  column-gutter: (18pt, 24pt),
  row-gutter: row_gutter,
  grid.cell( // Header
    colspan: 2,
    align: center + top,
    inset: (bottom: row_gutter, x: 24pt),
    image("longshot-city-logo.svg", alt: "Longshot City Logo"),
  ),
  grid.cell( // Inventory & notes
    rowspan: 3,
    stroke: none,
    grid(
      columns: (auto, 1fr, auto, 1fr),
      column-gutter: (8pt, 12pt, 8pt),
      row-gutter: (8.75pt, 17pt),
      align: bottom + right,
      grid.cell(
        colspan: 4,
        align: left,
        inset: (top: 1.5pt),
        sheet_label(size: 16pt)[Inventory],
      ),
      ..{
        let inventory_slot(x) = (
          pad(
            top: 8pt,
            text(
              str(x),
              font: "Comic Helvetic",
              weight: "light",
              size: 11pt,
              number-width: "tabular",
            ),
          ),
          line(length: 100%, stroke: 0.5pt),
        )
        for x in range(1, 7) {
          inventory_slot(x)
          inventory_slot(x + 6)
        }
      },
      grid.cell(
        block(height: 1fr, sheet_label(size: 16pt)[Notes]),
        colspan: 4,
        align: top + left,
        stroke: sheet_box_stroke,
        inset: 6pt,
      )
    ),
  ),
  grid.cell( // Identity, advanced skills & powers
    rowspan: 2,
    grid(
      columns: 1fr,
      row-gutter: 8pt,
      stroke: sheet_box_stroke,
      inset: (x: 4pt, top: 4pt, bottom: 24pt),
      sheet_label[Name, Pronouns],
      sheet_label[Archetype],
      sheet_label[Origin],
      sheet_label[Wealth],
      grid.cell(
        inset: (bottom: 72pt),
        sheet_label[Special / K.O. Results],
      ),
      grid.cell(
        stroke: none,
        inset: (x: 0pt, bottom: 0pt, top: 0pt),
        block(
          height: 1fr,
          grid(
            columns: 5,
            row-gutter: (2pt, 1fr),
            column-gutter: 8pt,
            align: bottom,
            grid.cell(
              sheet_label[Advanced Skills & Powers],
              colspan: 2,
              align: top + left,
              inset: (bottom: 6pt),
            ),
            place(
              bottom + center,
              sheet_label_sm(size: 6.0pt)[
                Rank #place(right + horizon, dx: 6.25pt)[+]
              ],
            ),
            place(
              bottom + center,
              sheet_label_sm(size: 6.0pt)[
                Skill #place(right + horizon, dx: 6.5pt, dy: 0.5pt)[=]
              ],
            ),
            place(bottom + center, sheet_label_sm(size: 6.0pt)[Total]),
            ..for x in range(1, 11) {
              (
                grid.cell(
                  align: horizon,
                  rect(height: 6pt, width: 6pt, stroke: 0.5pt),
                ),
                line(length: 100%, stroke: 0.5pt),
                rect(height: 14pt, width: 14pt, stroke: 0.5pt),
                rect(height: 14pt, width: 14pt, stroke: 0.5pt),
                rect(height: 14pt, width: 14pt, stroke: 0.5pt),
              )
            }
          ),
        ),
      ),
    ),
  ),
  [ // Appearance & Stats
    #block(
      height: 259.65pt,
      width: 100%,
      stroke: sheet_box_stroke,
      inset: 4pt,
      sheet_label[Appearance],
    )
    #place(
      bottom + right,
      dx: 6pt,
      dy: 16pt,
      stack(
        spacing: 11pt,
        block(
          height: 48pt,
          width: 36pt,
        )[
          #place(
            center + top,
            dy: 10pt,
            circle(fill: white, stroke: 1pt, height: 95%),
          )
          #place(top + left, dx: -10pt, dy: 2pt, sheet_label_sm[Skill])
        ],
        block(
          height: 72pt,
          width: 36pt,
        )[
          #place(
            right + bottom,
            dy: -8pt,
            rect(fill: white, stroke: 1pt, width: 85%, height: 50%),
          )
          #place(
            center + top,
            dy: 6pt,
            circle(fill: white, stroke: 1pt, height: 95%),
          )
          #place(top + left, dx: -10pt, dy: -2pt, sheet_label_sm[Stamina])
          #place(bottom + left, dx: -6pt, dy: 1.5pt, sheet_label_sm[Damage])
        ],
        block(
          height: 72pt,
          width: 36pt,
        )[
          #place(
            right + bottom,
            dy: -8pt,
            rect(fill: white, stroke: 1pt, width: 85%, height: 50%),
          )
          #place(
            center + top,
            dy: 6pt,
            circle(fill: white, stroke: 1pt, height: 95%),
          )
          #place(top + left, dx: -10pt, dy: -2pt, sheet_label_sm[Luck])
          #place(bottom + left, dx: 1pt, dy: 1.5pt, sheet_label_sm[Spent])
        ],
        block(
          height: 48pt,
          width: 36pt,
        )[
          #place(
            center + top,
            dy: 10pt,
            square(fill: white, stroke: 1pt, height: 95%),
          )
          #place(top + left, dx: -10pt, sheet_label_sm[Armor])
        ],
      ),
    )
  ],
  grid.cell(inset: (top: 4pt))[ // Attacks
    #let ab_label(x) = text(
      x,
      font: "Comic Helvetic",
      weight: "light",
      size: 7pt,
    )
    #block(
      height: 1fr,
      grid(
        columns: (1fr, auto),
        column-gutter: 8pt,
        row-gutter: (6pt, 1fr),
        align: bottom + right,
        grid.cell(colspan: 2, align: top + left, sheet_label[Attacks]),
        ..for x in range(1, 7) {
          (
            line(length: 100%, stroke: 0.5pt),
            grid(
              align: center,
              row-gutter: 2pt,
              columns: 7,
              ..for x in range(1, 7) {
                (ab_label(str(x)),)
              },
              ab_label[7+],
              ..for x in range(1, 8) {
                (
                  rect(
                    stroke: 0.5pt,
                    width: 12.5pt,
                    height: 18.75pt,
                    inset: 0pt,
                  ),
                )
              }
            ),
          )
        }
      ),
    )
  ],
)

#pagebreak()

#set page(
  header: align(
    right + bottom,
    text(size: 8pt)[*Longshot City* Quick Reference],
  ),
)

#show: rest => [
  #show heading: set par(leading: 4pt, justify: false)
  #show heading.where(level: 1): set text(
    weight: 800,
    features: ("smcp",),
    tracking: 0.05em,
  )
  #show heading.where(level: 2): set text(weight: 500)
  #show heading.where(level: 3): set text(weight: 400)

  #set text(
    font: "Alegreya",
    size: 11pt,
    number-width: "proportional",
    number-type: "lining",
  )
  #show smallcaps: set text(tracking: 0.03em)
  #set par(
    leading: 0.60em,
    spacing: 0.60em + 0.60em,
  )
  #rest
]

#show "†": super

#let gameterms(it) = [
  #set par(spacing: 1.0em)
  #show "Armor": smallcaps
  #show "armor": smallcaps
  #show "attack": smallcaps
  #show "energy type": smallcaps
  #show "energy types": smallcaps
  #show "Test Luck": smallcaps
  #show "Test Skill": smallcaps
  #show "Roll versus": smallcaps
  #show "roll versus": smallcaps
  #show "test": smallcaps
  #show "testing": smallcaps
  #show "tests": smallcaps
  #show "damage": smallcaps
  #show "stamina": smallcaps
  #show "luck": smallcaps
  #show "skill": smallcaps
  #show "advanced skill": smallcaps
  #show "enemies": smallcaps
  #show "Roll under": smallcaps
  #show "Initiative": smallcaps
  #show "initiative": smallcaps
  #set strong(delta: 200)
  #it
]

#let rules_ref = gameterms[
  Roll under to test when unopposed: 2d6 + skill or luck. Roll versus when opposed: 2d6 + skill, highest total wins. Add a relevant advanced skill when testing skill. Reduce your luck by 1 after you test it. You can choose to fail instead of testing luck.

  *Initiative*: 2 tokens per player, 1 per accomplice, as listed per enemy, and 1 end of round token. The GM assembleds the stack and randomly draws a token to determine who holds the initiative. This character may perform one action, then a new token is drawn. The round ends when the end of round token is drawn -- no one knows exactly how long a round will last. If needed, start a new round by building a new stack. A round is 1-2 minutes or 1 two-page spread long.

  *Combat*: Adversaries roll versus: winner rolls 1d6 and deals their method's damage to target's stamina. Armor reduces incoming damage. No one is hurt on a tie (you can test luck to break it). After you hit, you may test your luck to add 2 to the damage roll (the d6, not the value). You may initiate an attack once per round. Characters die at 0 stamina -- PC's may be K.O.'d instead.

  *Recovery*: rest for 8 hours to recover 2d6 stamina and 2d6 luck. Three times a day, you can eat a meal to recover 1d6 stamina. Keep an eye out for other ways to regain stamina and luck like potions or bathhouses.
]

#let accent_cell = luma(90%)
#let mini_header(
  it,
) = table.cell(
  text(it, weight: 700, features: ("smcp": 0)),
  // fill: accent_cell,
  stroke: (bottom: 1pt),
  inset: (x: 2pt, y: 6pt),
)
#set table(
  fill: (x, y) => if y == 0 {
    accent_cell
  },
  stroke: (x, y) => if y == 0 {
    0.5pt
  } else {
    (bottom: 0.5pt)
  },
  inset: (x, y) => if y == 0 {
    (x: 2pt, y: 4pt)
  } else {
    (x: 4pt, y: 6pt)
  },
  align: center + horizon,
  // column-gutter: 4pt,
)
#show table.cell.where(y: 0): set text(
  weight: 800,
  features: ("smcp",),
  tracking: 0.05em,
)
#show table: set text(size: 10pt)

#let hand_to_hand_weapons = (
  "Sword",
  4,
  6,
  6,
  6,
  6,
  8,
  10,
  "Axe",
  2,
  2,
  6,
  6,
  8,
  10,
  12,
  "Knife",
  2,
  2,
  2,
  2,
  4,
  8,
  10,
  "Staff",
  2,
  4,
  4,
  4,
  4,
  6,
  8,
  "Hammer#",
  1,
  2,
  4,
  6,
  8,
  10,
  12,
  "Spear",
  4,
  4,
  6,
  6,
  8,
  8,
  10,
  "Longsword",
  4,
  6,
  8,
  8,
  10,
  12,
  14,
  "Mace#",
  2,
  4,
  4,
  6,
  6,
  8,
  10,
  "Polearm*#",
  2,
  4,
  4,
  8,
  12,
  14,
  18,
  "Maul*#",
  1,
  2,
  3,
  6,
  12,
  13,
  14,
  "Greatsword*",
  2,
  4,
  8,
  10,
  12,
  14,
  18,
  "Club",
  1,
  1,
  2,
  3,
  6,
  8,
  10,
  "Unarmed",
  1,
  1,
  1,
  2,
  2,
  3,
  4,
  "Shield",
  2,
  2,
  2,
  4,
  4,
  6,
  8,
  "Energy Strike†",
  4,
  6,
  6,
  8,
  12,
  22,
  38,
)

#let ranged_weapons = (
  "Rifle*#",
  4,
  6,
  6,
  10,
  12,
  18,
  24,
  "Machine Gun*#",
  4,
  6,
  10,
  14,
  22,
  26,
  30,
  "Bow*",
  2,
  4,
  6,
  8,
  8,
  10,
  12,
  "Crossbow*",
  4,
  4,
  6,
  8,
  8,
  8,
  10,
  "Pistol#",
  2,
  4,
  4,
  6,
  10,
  12,
  16,
  "Shotgun*#",
  1,
  1,
  6,
  6,
  10,
  22,
  30,
  "Explosive#†",
  4,
  6,
  10,
  14,
  20,
  28,
  38,
  "Energy Blast†",
  4,
  6,
  6,
  8,
  12,
  22,
  38,
  "Massive Blast†",
  8,
  12,
  16,
  20,
  28,
  36,
  44,
)

#let beastly_weapons = (
  "Small Beast",
  2,
  2,
  3,
  3,
  4,
  5,
  6,
  "Modest Beast",
  4,
  6,
  6,
  8,
  8,
  10,
  12,
  "Large Beast#",
  4,
  6,
  8,
  10,
  12,
  14,
  16,
  "Gigantic Beast#",
  4,
  8,
  12,
  12,
  16,
  18,
  24,
)

#let weapon_table(title, content) = table(
  columns: (auto, ..(1fr,) * 7),
  table.header(table.cell(title, colspan: 8)),
  mini_header[Damage Roll #sym.arrow.r],
  ..for x in range(1, 7) {
    (mini_header(str(x)),)
  },
  mini_header[7+],
  ..content.map(x => str(x))
)

#let stamina_table(
  ..children,
) = table(
  columns: (2fr, auto),
  align: (left, right),
  stroke: (bottom: 0.5pt),
  fill: none,
  mini_header[Name], mini_header[Cost],
  ..children,
)

#grid(
  columns: (1fr, 1fr, 2fr),
  column-gutter: 18pt,
  row-gutter: 8pt,
  weapon_table("Hand-to-Hand Weapons", hand_to_hand_weapons),
  stack(
    spacing: 4pt,
    weapon_table("Ranged Weapons", ranged_weapons),
    weapon_table("Beastly Weapons", beastly_weapons),
  ),
  grid.cell(
    rowspan: 2,
    table(
      columns: (auto, 1fr),
      align: (center, left),
      table.header(table.cell("Energy Types", colspan: 2)),
      [Psychic],
      gameterms[Only affects living beings. Choose: K.O., coma, kill, ignore armor.],

      [Heat], gameterms[Double damage vs cold enemies.],
      [Laser], gameterms[Reflected by mirrors.],
      [Electric], gameterms[Double damage vs robots. Ignores armor.],
      [Sonic], [Deafens and stuns.],
      [Cold],
      gameterms[Double damage vs heat elementals. Can choose to freeze a target in place instead of doing damage.],

      [Chemical],
      gameterms[Eats through target's armor, permanently lowering it by one point for each damage dealt. Targets with 0 armor take stamina damage instead.],

      [Kinetic],
      gameterms[Target tests their luck (or skill for enemies) or is knocked prone. Ignores one point of armor. Roll under instead to knock down inanimate objects.],

      [Entropic],
      gameterms[Double damage vs robots. Organic targets age rapidly.],

      table.cell(
        colspan: 2,
        align: bottom + left,
        stroke: none,
        inset: (x: 0pt, top: 8pt, bottom: 8pt),
        gameterms[\* indicates a weapon requires at least two hands to use.\
          \# indicates a weapon ignores 1 point of Armor.\
          † indicates an attack that has an additional effect (see energy types table).\
          The energy type for Explosives is Kinetic.],
      ),
      table.cell(
        colspan: 2,
        align: bottom + left,
        stroke: none,
        inset: (x: 0pt, top: 8pt, bottom: 0pt),
        rules_ref,
      ),
    ),
  ),
  grid.cell(
    colspan: 2,
    grid(
      columns: (1fr,) * 3,
      column-gutter: 18pt,
      grid.cell(
        colspan: 3,
        fill: accent_cell,
        align: center,
        inset: 4pt,
        stroke: 0.5pt,
        text(
          [Power Stamina Costs],
          weight: 800,
          features: ("smcp",),
          tracking: 0.05em,
        ),
      ),
      stamina_table(
        [Adjust Roll],
        [2],
        [Augury],
        [3],
        [Banishment],
        [4],
        par(leading: 2.815pt)[Command Elements],
        [4],
        par(leading: 2.815pt)[Channel Animal Power],
        [4],
        [Create Bomb],
        [4],
        [Elemental Form],
        [4],
        [Energy Blast],
        [3],
        [Energy Construct],
        [4],
      ), stamina_table(
        [Energy Shield],
        [1+],
        [Energy Strike],
        [2],
        [Leap],
        [1+],
        [Massive Blast],
        [6],
        [Mimic Power],
        [3],
        [Phasing],
        [1],
        [Precognition],
        [4],
        [Puppeteer],
        [6],
        [Shape Reality],
        [8],
        [Shapeshift],
        [4],
      ), stamina_table(
        [Size Manipulation],
        [3],
        [Stretch],
        [2],
        [Stun],
        [1],
        [Suggestion],
        [3],
        [Summoning],
        [4],
        [Telekinesis],
        [4],
        [Telepathy],
        [3],
        [Teleport],
        [1+],
        [Transmute Self],
        [3],
        [Web Spinning],
        [3],
      ),),
  ),
)
