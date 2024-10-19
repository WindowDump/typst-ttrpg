// FIST - https://claymorerpgs.itch.io/fist
// character sheet & quick reference by window dump
// https://github.com/WindowDump/typst-ttrpg
// print, fold in half, give to player, start mission

// fonts used
// Orbitron
// https://www.theleagueofmoveabletype.com/orbitron
// Michroma (you can use Microgramma if you have it)
// https://github.com/googlefonts/Michroma-font
// Space Grotesk
// https://floriankarsten.github.io/space-grotesk/
// note: Typst does not support variable fonts

// possible alternates:
// Fivo Sans
// https://drive.google.com/file/d/0B47FBrwbA6rBNjlrbWtqTzVpWFU/view?resourcekey=0-qRw4aO0wviEA81Roy5wccw

#set document(
  title: "FIST Operative Handbook",
  author: "Window Dump",
  keywords: ("fist", "world of dungeons", "wodu", "pbta", "osr"),
)

#set page(
  paper: "us-letter",
  flipped: true,
  margin: (x: 36pt, top: 36pt, bottom: 36pt),
  footer-descent: 30%,
  footer: [
    #set text(
      font: "Space Grotesk",
      weight: 400,
      features: ("ss01": 1, "ss02": 0, "ss03": 0, "ss04": 1),
      size: 8pt,
      tracking: -0.01em,
    )

    Text adapted from FIST Ultra Edition by CLAYMORE Roleplaying Games,\ licensed under CC-BY-SA 4.0. #link("https://creativecommons.org/licenses/by-sa/4.0/")[creativecommons.org/licenses/by-sa/4.0/]
  ],
)

#let sheet-label(
  it,
) = text(
  font: "Space Grotesk",
  features: ("ss04",), // alternate "D"
  size: 8pt,
  tracking: 0.04em,
  weight: 500,
  ligatures: false,
  upper(it)
)

#let statbox(
  name,
  desc,
  box-fill: luma(100%),
  box-stroke: none,
  name-fill: luma(100%),
  text-fill: luma(100%),
  text-weight: 700,
) = grid(
  rows: (1fr, auto),
  row-gutter: 4pt,
  columns: (1fr, auto),
  column-gutter: 4pt,
  grid.cell(
    align: horizon + right,
    rowspan: 2,
  )[
    #block(
      spacing: (0pt),
      below: 4pt,
      text(
        font: "Orbitron",
        weight: "black",
        tracking: 0.05em,
        size: 18pt,
        features: ("kern": 1, "ss01": 0, "ss02": 0, "ss03": 0, "ss04": 0),
        spacing: 4pt,
        fill: name-fill,
      )[#name],
    )
    #block(
      spacing: 0pt,
      text(
        font: "Space Grotesk",
        tracking: -0.02em,
        features: ("ss01": 1, "ss02": 0, "ss03": 0, "ss04": 0),
        weight: text-weight,
        size: 8pt,
        fill: text-fill,
      )[#desc],
    )
  ],
  grid.cell(
    rowspan: 2,
    align: (center + horizon),
    rect(
      fill: box-fill,
      stroke: box-stroke,
      width: 34pt,
      height: 34pt,
      radius: 4pt,
    ),
  ),
)

#let statbox_light(
  name,
  desc,
  box-fill: luma(100%),
  box-stroke: none,
  name-fill: luma(0%),
  text-fill: luma(0%),
  text-weight: 500,
) = statbox(
  name,
  desc,
  box-fill: box-fill,
  box-stroke: box-stroke,
  name-fill: name-fill,
  text-fill: text-fill,
  text-weight: text-weight,
)

#let character_sheet = grid( // character sheet
  columns: (1fr,)*6,
  rows: (
    auto, // header
    48pt, // identity
    48pt, // traits
    48pt,
    48pt,
    48pt, // inventory
    48pt,
    42pt, // stats box
    38pt,
    42pt, // secondary stats
    38pt,
    auto, // notes
  ),
  row-gutter: (
    0pt,
    0pt,
    0pt,
    0pt,
    0pt,
    0pt,
    0pt,
    0pt,
    4pt, // gap between stats boxes
    0pt,
    0pt,
    0pt,
  ),
  grid.cell( // header
    colspan: 6,
    align: bottom,
    grid(
      rows: (auto, 4pt),
      columns: (auto, auto),
      align: bottom,
      grid.cell(
        rowspan: 2,
        rect(
          fill: luma(0%),
          outset: (left: 2pt),
          inset: (y: 4pt, left: 4pt, right: 6pt),
          text(
            font: "Orbitron",
            weight: "black",
            fill: luma(100%),
            size: 40pt
          )[FIST]
        ),
      ),
      grid.cell(
        inset: (bottom: 4pt, left: 5pt, right: 2pt,),
        align: bottom + left,
        par(
          leading: 3.5pt,
          text(
            font: "Michroma",
            weight: "regular",
            size: 14pt,
          )[#upper[Operative Handbook]],
        )
      ),
      grid.cell(
        rect(
          fill: luma(0%),
          width: 100%,
          height: 4pt,
          outset: (left: 4pt, right: 2pt),
        )
      ),
    ),
  ),
  grid.cell( // identity
    colspan: 6,
    rowspan: 1,
    inset: (left: 2pt, bottom: 4pt, top: 50% - 8pt,),
    align: bottom,
    grid(
      columns: (3fr, 2fr),
      row-gutter: 1fr,
      sheet-label[Codename:],
      sheet-label[Pronouns:],
      sheet-label[Role:],
    )
  ),
  grid.hline(
    y: 2,
    stroke: (thickness: 0.5pt,),
  ),
  grid.cell(
    colspan: 6,
    rowspan: 3,
    align: left + top,
    inset: (top: 4pt, left: 2pt),
    sheet-label[Traits]
  ),
  grid.hline(
    y: 5,
    stroke: (thickness: 0.5pt,),
  ),
  grid.cell(
    colspan: 6,
    rowspan: 2,
    align: left + top,
    inset: (top: 4pt, left: 2pt),
    sheet-label[Inventory]
  ),
  grid.cell(
    colspan: 6,
    rowspan: 2,
    rect(
      fill: luma(0%),
      width: 100%,
      height: 100%,
      radius: 6pt,
      inset: 4pt,
      grid(
        rows: (1fr, 1fr),
        columns: (1fr, 1fr),
        row-gutter: 4pt,
        column-gutter: 4pt,
        align: (left + horizon),
        statbox("FRC", "Strength, brute force, threats"),
        statbox("TAC", "Knowledge, skill, intellect"),
        statbox("CRE", "Diplomacy, deceit, psionics"),
        statbox("RFX", "Precision, dexterity, aim"),
      )
    )
  ),
  grid.cell(
    colspan: 6,
    rowspan: 2,
    rect(
      fill: luma(85%),
      radius: 6pt,
      width: 100%,
      height: 100%,
      inset: 4pt,
      grid(
        rows: (1fr, 1fr),
        columns: (1fr, 1fr),
        row-gutter: 4pt,
        column-gutter: 4pt,
        align: (left + horizon),
        statbox_light("ARMOR", "Subtract from damage taken"),
        statbox_light("MAX HP", "Capacity to take damage"),
        statbox_light("WAR DICE", [Spend for +1D6 to *any* roll],
          name-fill: gradient.linear(
            (luma(45%), 0%),
            (luma(40%), 5%),
            (luma(15%), 90%),
            (luma(0%), 100%),
            angle: 90deg,
          ),
        ),
        statbox_light("HP", "Operative death occurs at 0 HP"),
      )
    )
  ),
  grid.cell(
    colspan: 6,
    align: (left + top),
    inset: (top: 4pt, left: 2pt),
    sheet-label[Notes]
  ),
)

#let body_cols(it) = {
  set text(
    font: "Space Grotesk",
    size: 9pt,
    weight: "regular",
    tracking: -0.01em,
    spacing: 100%,
    ligatures: true,
    features: ("ss04", "ss03", "ss02"), // alternate "D", "y", "g",
  )
  columns(
    2,
    gutter: 72pt,
    it,
  )
}

#let gray_block(it) = block(
  stroke: (paint: luma(65%), thickness: 1.5pt),
  inset: (x: 4pt, y: 8pt),
  outset: (x: 2pt),
  width: 100%,
  radius: 2pt,
  it,
)

#let emph_block(it) = block(
  fill: luma(0%),
  inset: (x: 4pt, y: 8pt),
  outset: (x: 2pt),
  width: 100%,
  radius: 2pt,
  text(
    fill: luma(100%),
    it,
  ),
)

#show heading.where(level: 1): it => {
  set align(left + bottom)
  block(
    width: 100%,
    inset: (bottom: 8pt),
    outset: (x: 2pt),
    below: 12pt,
    stroke: (bottom: (2pt)),
    text(
      font: "Michroma",
      size: 14pt,
      tracking: 0.04em,
    )[#upper(it.body)],
  )
}

#show heading.where(level: 2): it => block(
  width: 100%,
  above: 13pt,
  text(
    font: "Space Grotesk",
    size: 9pt,
    weight: "bold",
    tracking: 0pt,
    ligatures: false,
    it.body,
  ),
)

#show par: set block(
  below: 12pt,
  fill: luma(50%),
)
#set par(leading: 7pt)

#show link: it => text(
  weight: 500,
  fill: luma(20%),
  // underline(it)
  it
)

// just two character sheets
// #body_cols[#character_sheet #character_sheet]

#body_cols[
  = Character creation

  #grid(
    columns: (3fr, 2fr),
    column-gutter: 12pt,
    rows: 1,
    gray_block[
      #block(below: 7pt)[Create a *FIST* operative as follows:]
      #enum(
        tight: true,
        [Choose two *traits*, or roll 2D666],
        [Based on your traits, fill out your stats:\ ATTRIBUTES (FRC, TAC, CRE, RFX), ARMOR, WAR DICE start at 0,\ MAX HP starts at 6, HP at MAX],
        [Choose one: +1D6 additional MAX HP,\
          +1D6 WAR DICE, 1 standard issue item],
        [Choose a *role* not already in use],
        [Choose an appropriate *codename*, and a real name only the player knows],
      )
    ],
    gray_block[
      #block(below: 7pt)[
        *Standard issue items*\
        Roll 1D6 or choose:
      ]
      #enum(
        tight: true,
        [Balaclava\ (hides identity)],
        [Flashlight (can be used as an attachment)],
        [Knife (1D6 DAMAGE)],
        [MRE (+1D6 HP, one use)],
        [Pistol (1D6 DAMAGE)],
        [Riot shield (1 ARMOR, equip as weapon)],
      )
    ],
  )

  Traits and roles index available online at #link("https://fistref.com")[fistref.com] or in FIST Ultra Edition.\
  You are encouraged to reflavor traits and items.

  *Traits* are snippets of special rules for individual characters which cover a unique talent, ability, or advantage, usually accompanied by a downside, boundary, or caveat if the trait's beneficial aspects are particularly powerful. Traits may offer narrative background, add new mechanics, alter pre-existing mechanics, or involve entire mini-games. Traits come packaged with an item (like a weapon, tool, or piece of clothing) and a modification to your base stats.

  *Roles* define your character's narrative archetype. Roles come with a relevant backstory prompt (usually beginning with “Describe...") and a difficult condition which must be fulfilled by mission completion to advance (e.g. a pacifist cannot be violent, a wildcard must behave unpredictably). When a character *advances*, they can take another trait, +1D6 MAX HP, or +1D6 WAR DICE. Traits may change these rules.

  #grid(
    columns: (5fr, 4fr),
    column-gutter: 8pt,
    rows: 1,
    [
      == Emergency insertion
      If your character dies, or you're joining in the middle of a mission, create a fresh character while play continues. When you're ready to deploy, signal the referee - note that boss battles and other dangerous areas may be no-insertion zones. When prompted, roll on the table on the right and jump into the fray.
    ],
    emph_block[
      Roll *2D6* to emergency insert:
      #list(
        tight: true,
        [*6 OR LESS:* Deployment goes wrong somehow.],
        [*7-9:* Deploy normally.],
        [*10 OR ABOVE:* Deploy with\ an extra standard issue item.],
        [*DOUBLE SIXES:* As above,\ and +3 to your first roll.],
      )
    ],
  )

  #colbreak()

  #character_sheet

]

#pagebreak()

#body_cols[
  = Rules Summary

  Full rules available at #link("https://claymorerpgs.itch.io/fist")[claymorerpgs.itch.io/fist]

  In *FIST* (Freelance Infantry Strike Team), you portray a team of paranormal mercenaries doing the jobs that no one else can (or wants) in the military-espionage ecosystem of the Cold War. You are an unconventional kind of mercenary who cares more about being true to yourself, your community, or your ideals than turning a profit, and you may have been forced into this line of work due to incompatibility with non-violent, non-paranormal society.

  Gameplay involves deploying your mercenary character on missions with other players, where you talk to people, solve problems, and engage in espionage and combat. The story and reality of your FIST game exists as an ongoing conversation between the players and the referee, and it's everyone's job to treat this game world like it actually exists, then act accordingly.

  == Playing the game

  Players and the referee take turns talking. The referee describes the scene the players are in (along with portraying people and providing background info), and the players respond by describing their actions within the game world. If an action would be risky or the outcome is otherwise uncertain, the referee establishes possible consequences of a failure, then the player rolls *2D6* and adds their most relevant *ATTRIBUTE* score: FORCEFUL (*FRC*),\
  TACTICAL (*TAC*), CREATIVE (*CRE*), or REFLEXIVE (*RFX*). Don't roll the dice if the action described is easily accomplished or totally impossible.

  #block(
    stroke: (paint: luma(75%), thickness: 1pt),
    inset: (x: 4pt, y: 8pt),
    outset: (x: 2pt),
    width: 100%,
    radius: 2pt,
  )[
    When a character *does something risky*, the player rolls *2D6+ATTRIBUTE* and the referee narrates how the situation changes based on the total:
    #list(
      tight: true,
      [*6- / FAILURE:* Things go wrong somehow],
      [*7-9 / PARTIAL:* Things go right but with a complication or downside],
      [*10+ / SUCCESS:* Things go right with no additional headaches],
      [*DOUBLE SIXES / ULTRA:* Things go right with some spectacular bonus],
    )
  ]
  The referee never uses this system for non-player characters, but may roll the dice to determine damage, random behavior, content, etc. Referee controlled characters simply take action, and the players are given a chance to react or respond by roleplaying and/or rolling the dice.

  Players can spend one *WAR DIE* to add +1D6 to *any* type of dice roll in the game, no matter who makes it (including the referee). WAR DICE are *consumable* -- when you use a WAR DIE, it's gone.

  #colbreak()

  == Combat and death

  Attacking someone or dealing with being attacked is the same as any other risky action and handled accordingly with a 2D6 roll. Characters deal their weapon's *DAMAGE* (if rolling to attack) on a success and may take DAMAGE from their target on a failure.

  If the players are engaged in active combat, rolling a failure always incurs DAMAGE. Using stealth, tricks, and tactical retreats to avoid active combat leads to better chances of survival. Players do not take regimented turns but should avoid hogging the spotlight with combat actions. Enemies controlled by the referee never roll to attack, but telegraph attacks for the players to respond to.

  DAMAGE is subtracted from the victim's *HP*. *ARMOR* is subtracted from DAMAGE taken (e.g. 6 DAMAGE vs. 2 ARMOR subtracts 4 HP). Reaching 0 HP means a character has died. If a player's character dies, they are encouraged to insert a new character as soon as the story allows. Some characters may be revived through complex science or magic.

  == Items

  Items marked with a number of uses are unavailable when depleted, but replenish between missions; they are common and easily replaceable. Items marked *consumable* never return once used; they are uncommon, irreplaceable, or unique. Some items can be used indefinitely, like simple tools or trinkets. All items carry over from mission to mission, but items not granted by traits or standard issue are lost if left behind or destroyed.

  Baseline FIST characters can wield one *weapon* at a time. Weapon damage depends on the type and size of the weapon, ranging from 3 DAMAGE for small holdout weapons, to 1D6+2 DAMAGE for heavy weapons, and possibly more. Unarmed/non-weapon attacks deal the worst of 2D6 DAMAGE.

  Baseline FIST characters can wear one piece of body-sized *armor* at a time, in addition to an unlimited amount of non-armoring clothes and accessories that grant ARMOR (like helmets or shields). Some wearable items (capes, helmets, small shields) are *accessories*, which can be voluntarily destroyed to negate DAMAGE once.

  == Rendezvous points

  Once per mission, the players may request a rendezvous point, and the referee will describe a nearby but difficult-to-reach safe location where the players can recuperate. At the rendezvous point, each player chooses one: REST (heal 1D6 HP), RESTOCK (replenish one item or resource),\
  or INTEL (one useful fact about the mission).
]
