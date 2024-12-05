#set document(
  title: "Disks & Daemons: the roguelite",
  author: "Window Dump",
  keywords: ("fist", "world of dungeons", "wodu", "pbta", "osr", "nsr"),
)

#import "template.typ": *

#set page(
  paper: "us-letter",
  flipped: true,
  margin: 12pt,
)

#show: rest => pamphlet_light(rest)

#let panel_template(
  content,
  fill: emph_gray,
  inset: 8pt,
  stroke: none,
  clip: false,
) = block(
  content,
  fill: fill,
  inset: inset,
  stroke: stroke,
  height: 100%,
  width: 100%,
  radius: 10pt,
  clip: clip,
)

#let floor_panel_template(
  content,
  fill: none,
) = block(
  // height: 100%,
  width: 100%,
  inset: 8pt,
  outset: 2pt,
  radius: 6pt,
  fill: fill,
)[
  #show heading.where(level: 1): it => block(
    pamph_l_h1_bar(it.body),
  )
  #show heading.where(level: 2): it => block(
    pamph_l_h1(it.body, size: 13pt),
    above: 1.0em,
    below: 0.75em,
  )
  #set par(spacing: 0.90em)
  #content
]

#let floor_desc_num(it) = text(
  it,
  size: 12pt,
  font: "Archivo",
  stretch: 50%,
  weight: 500,
  number-width: "tabular",
)
#let floor_desc(die1, count1, die2, count2, content) = grid(
  columns: (auto, 1fr),
  row-gutter: 2pt,
  column-gutter: 4pt,
  align: left + horizon,
  grid(
    columns: 2,
    row-gutter: 8pt,
    column-gutter: 3pt,
    die1, count1,
    die2, count2,
  ),
  content,
)

#let pamph_grid(
  ..children,
  columns: (auto, 1fr) * 2,
  column-gutter: 4pt,
  inset: (x, y) => if y == 0 {
    (bottom: 6pt)
  } else if y == 1 {
    (y: 6pt)
  } else {
    (top: 6pt)
  },
  align: left + horizon,
) = {
  set text(font: "Charter", size: 8pt, hyphenate: false, tracking: 0.005em)
  set par(justify: false, leading: 0.50em)
  grid(
    ..children,
    columns: columns,
    column-gutter: column-gutter,
    inset: inset,
    align: align,
  )
}

#let panel_1 = panel_template(fill: dd_grey, clip: false)[
  #block(
    width: 100%,
    inset: (x: 12pt, top: 12pt),
  )[
    // cool background gradient
    #place(
      horizon + center,
      dy: -25pt,
      circle(
        fill: gradient.radial(
          (black, 0%),
          (black, 5%),
          (accent_gray, 33%),
          (white, 38%),
          (accent_gray, 49%),
          (dd_grey, 100%),
        ),
        radius: 116pt,
      ),
    )

    #let cover_box_outline(
      content,
    ) = box(
      content,
      stroke: (paint: white, thickness: 1pt),
      inset: 1.8pt,
      radius: 2pt,
    )
    #let cover_tagline(content, dx: 0pt) = grid.cell(
      align: left,
      move(
        dx: dx,
        box(
          fill: white,
          inset: 3pt,
          radius: 2pt,
          text(
            upper(content),
            font: "Archivo",
            size: 10pt,
            weight: 500,
            stretch: 75%,
            tracking: 0.075em,
          ),
        ),
      ),
    )

    #text(
      font: "Latin Modern Roman Dunhill",
      size: 28pt,
      weight: 250,
      grid(
        align: center + horizon,
        row-gutter: 4pt,
        cover_box_outline(
          stack(
            ..boxify("Disks", inset: (x: 1pt, y: 2pt)).children,
            spacing: 0.5em,
            dir: ltr,
          ),
        ),
        box(
          text("&", font: "Latin Modern Roman", style: "italic"),
          fill: white,
          inset: (left: -0.05em, right: 0.1em, top: 0.1em, bottom: 0.1em),
        ),
        cover_box_outline(
          stack(
            ..boxify("Daemons", inset: (x: 1pt, y: 2pt)).children,
            spacing: 1fr,
            dir: ltr,
          ),
        ),
        cover_tagline(dx: -12pt)[Become a _rogue_ user],
        cover_tagline(dx: -6pt)[Infiltrate the net],
        cover_tagline(dx: 0pt)[Feed the daemons],
      ),
    )

    #place(
      bottom + right,
      // dy: -36pt,
      dx: 16pt,
      image("FIST_compatibility_mark_alpha_white.png", width: 96pt),
    )
  ]

  #show heading.where(level: 1): it => block(
    pamph_d_h1(it.body, size: 15pt),
    below: 0.5em,
  )
  #align(center)[= Incoming Transmission]

  #show: rest => block(
    rest,
    fill: white,
    height: 1fr,
    outset: (x: 4pt, top: 0pt, bottom: 4pt),
    inset: (top: 8pt, x: 1pt),
    radius: 6pt,
  )

  #align(center)[== Message received via electronic mail]

  Hey, FIST! It's J., your favorite "hacker!" Ha, that's what the news called me. We just got some "office productivity" chairs that beam your brain into the computer! I found some classified files with your name on them, you should take a look for yourself...

  #show heading.where(level: 2): it => block(
    pamph_l_h1_bar(it.body),
    above: 0.8em,
  )

  == Briefing

  The year is 198X. USA higher learning institutions and private defense contractors have linked their mainframe computers via the *ARPANET Project*. The stated goal is the sharing of resources and communication. A bug in the encryption protocol (possibly an intentional one) allows easy access to any system. You recently exploited this with the help of *J.*, a graduate student in Cambridge.

  A tool developed in Palo Alto, CA by a *CYCLOPS* proxy company allows beaming of human consciousness into a virtual office environment named the *Ideaspace*. Labs across the country have installed brain-beam chairs for development or demonstration, and some are used every day. Publicly, there are no known side effects...

  === Inside the Ideaspace

  State of the art technology provides high-res 2-bit monochromatic graphics. There is a lot of dithering, but text in particular looks good. Users can conduct common tasks like document editing, programming, or system administration. They can even access any ARPANET server.
]

#let panel_2 = panel_template(
  fill: none,
  inset: (top: 8pt, x: 8pt, bottom: 4pt),
)[
  = Floor transmission

  You're breaching the network with homebrew protocols -- the system isn't designed for this. Noise masks your presence, but can hurt. Roll *1D6* to determine what happens when FIST moves to a new floor:

  + *Data corruption.* Consume a PARITY BIT or gain a level of DATA LOSS (see below).
  + *Noise.* Consume a PARITY BIT or take 1 DAMAGE.
  + *Interference.* Consume a PARITY BIT or lose an item.
  + *Big footprint.* Set the _CYBERCLOCK_ to *6*.
  + *Small footprint.* Reduce the _CYBERCLOCK_ by *1D6*.
  + Mercifully, a clean and quiet transmission.

  At 3 levels of *DATA LOSS* an operative is experiencing *Achiba Syndrome* and cannot return to their body. A separate rescue mission is required if this is undesired.

  = Users & Daemons

  *Users* are a representation of someone's session. Full beam users can interact with them as if they were also in the same chair. They are made of gray capsules in a roughly humanoid shape. J.'s hacks disguise you as one of them, but not all in the net are fooled.

  *Daemons* are a representation of a system process, spawned automatically and regenerated as needed. Most are simplistic single-purpose tools, given a task by a user like keyboard strokes, saving a file, messaging another user, etc. About half the height of a user and sporting conical horns, they appear as cute little guys to discourage new users from attacking them. They love *TOKENS* and use them as currency and treats, like cigarettes.

  == Inspiration & Touchstones

  #text(size: 7.5pt, tracking: 0.005em)[
    - *Procedures & Generation:* HAZARD FUNCTION, The Underclock, Wallet Dungeons, Five Torches Deep, #link("https://www.hedonic.ink/simple-diedrop-dungeon/")[die-drop dungeons]
    - *Games:* Rogue, DRL, Coded Arms, SMT NINE
    - *Books:* Hackers: Heroes of the Computer Revolution
    - *Sites:* The Hacker Jargon File, Textfiles.com
    - *Film:* TRON, Wargames

      Text and layout by Window Dump. Developed in Typst on a Corne. Set in Charter, Archivo, and Computer Modern Roman Dunhill.
      Based on #link("https://claymorerpgs.itch.io/fist")[FIST: Ultra Edition] by CLAYMORE RPGs, licensed under #link("https://creativecommons.org/licenses/by-sa/4.0/")[CC BY-SA 4.0] https://creativecommons.org/licenses/by-sa/4.0/.
      This document is licensed under #link("https://creativecommons.org/licenses/by-sa/4.0/")[CC BY-SA 4.0].

      greetz to the FIST server, the NSR Cauldron, & Explorer's Design.
  ]
]

#let panel_3 = panel_template(
  fill: emph_gray,
  inset: (top: 8pt, x: 8pt, bottom: 4pt),
)[
  = Encounters

  Use the _CYBERCLOCK_ to determine when FIST encounters a net denizen. It starts at *12* on a new floor. Subtract *1D6* when FIST enters a new room, travels through three visited rooms, or draws attention to themselves.\ _At 0 or 1_, foreshadow the next encounter, then set to 1.\ _Below 0_, the encounter occurs, then set to 12.

  If a denizen's reaction to FIST is not obvious, roll *1D6*:\ #d6_mini(1) hostile, #d6_mini(2) #d6_mini(3) wary, #d6_mini(4) #d6_mini(5) neutral, #d6_mini(6) curious, friendly.

  Roll *2D6* to determine an encounter. The third random encounter is always a *Cerberus*, or *CRO DIAL TONE* if FIST has defeated a random Cerberus.

  #let encounters = (
    [*CERBERUS* (10 HP, 1 ARMOR, 1D6+1 DAMAGE).\ A three-headed guard dog of the network. Demands a valid TOKEN from each member of FIST.],
    [*NAME DRAGON.* Greets users with the message of the day (funny picture) and accounts their actions.],
    [*PHANTOM.* Accounting, news wire, printer spooler],
    [*SERVER DAEMON*. Roll for job, it's doing it for a user.],
    [*D3 DAEMONS.* Lurking around, waiting for an assignment.],
    [*D6 BUGS* (3 HP, 3 DAMAGE). No matter how hard the programmers try, they can't get rid of them.],
    [*D3 USERS* (4 HP, 3 DAMAGE). Low clearance, low familiarity. Often annoying or downright stupid.],
    [*HACKER* (5 HP, 1D6 DAMAGE). Speaks the dialect of the daemons, knows little else.],
    [*MANAGER* (5 HP, 3 DAMAGE). High clearance, low familiarity. Has an ACCESS CARD.],
    [*SYSOP* (8 HP, 1D6+1 DAMAGE). A system operator. Wields a gun, loves excuses to use it.],
    [*CRO DIAL TONE* (15 HP, 1D6+1 DAMAGE).\ *DROPPED CALL:* A CYCLOPS analyst sent into the Ideaspace to secretly install monitoring software. They lingered too long and developed Achiba Syndrome. Now designated DIAL TONE, they speak with snippets from automated phone lines.\ *NO CARRIER (BOSS MOVE):* Attacks FIST's connection directly. Roll +TAC: 10+ you're fine, 7-9 you're dazed, 6-: gain a level of DATA LOSS.],
  )

  #grid(
    ..for x in range(0, 11) {
      (
        block(
          grid(
            columns: (16pt, 1fr),
            text(
              str(x + 2),
              font: "Archivo",
              weight: 500,
              number-width: "tabular",
            ),
            encounters.at(x),
          ),
          inset: (y: 0.4em, x: 0.2em),
          outset: (x: 4pt),
          fill: if calc.even(x) {
            white
          },
          radius: 6pt,
        ),
      )
    },
  )
]

#let panel_4 = panel_template(
  fill: none,
  inset: (x: 8pt, bottom: 8pt, top: 2pt),
)[
  = Floor plan generation

  The network is a series of floors. Every floor has stairs to the next floor, but not back up, so think twice before descending. See _Floor transmission_ for details, it's risky!

  Gather *12 D6's*. Choose 3 of the same color (i.e., black) to represent _negative space_. Other dice represent _rooms_.

  #grid(
    columns: (auto, 1fr),
    column-gutter: 6pt,
    row-gutter: 12pt,
    align: horizon,
    block(
      inset: 6pt,
      radius: 8pt,
      fill: dd_grey,
      // dicier_dark((4, 12, 23, 1, 24, 5, 6, 13, 36)),
      grid(
        columns: 3,
        gutter: 4pt,
        d6_maker(24, fill: black, dark: white),
        d6_maker(32, fill: black, dark: white),
        d6_maker(2, fill: none, paint: white),
        d6_maker(21, fill: black, dark: white),
        d6_maker(3, fill: none, paint: white),
        d6_maker(25, fill: black, dark: white),
        d6_maker(26, fill: black, dark: white),
        d6_maker(33, fill: black, dark: white),
        d6_maker(16, fill: none, paint: white),
      ),
    ),
    text(hyphenate: false)[To generate a floor, roll its dice and gather them into a 3x3 grid, like the one on the left. The floor describes which dice contain the entrance and exit, and the contents and theme of each room. Adjacent rooms are connected.],
  )

  // == Order of floors

  The Referee may use the floors in the presented order, choose another, or roll to pick (like D3 + floor number).

  == Contents of rooms

  Consult the floor description for special features.

  #box(stack(dir: ltr, spacing: 4pt, d6_mini(2), d6_mini(4), d6_mini(6))) *Even rooms* contain a denizen. Roll on the _encounter table_ to learn who is there when FIST arrives.

  #box(stack(dir: ltr, spacing: 4pt, d6_mini(1), d6_mini(3), d6_mini(5))) *Odd rooms* contain a text file on a disk. Choose or roll: #d6_mini(1) meeting minutes, #d6_mini(2) TPS reports, #d6_mini(3) bad puns,\ #d6_mini(4) documentation, #d6_mini(5) Usenet thread, #d6_mini(6) warez / philez

  #box(stack(dir: ltr, spacing: 4pt, d6_mini(1), d6_mini(2), d6_mini(3))) *Minor rooms* contain up to D3 digital facsimiles of _common items_ (_FIST Ultra Edition_, pg. 85). These are GUI wrappers over a similar utility program.

  #block(below: 0.60em)[#box(stack(dir: ltr, spacing: 4pt, d6_mini(4), d6_mini(5), d6_mini(6))) *Major rooms* contain an item. Choose or roll:]

  #pamph_grid(
    columns: (auto, 1fr) * 3,
    column-gutter: 2pt,
    inset: (x, y) => if y != 0 {
      (top: 6pt)
    } else {
      (bottom: 6pt)
    },
    d6_maker(1, size: 10pt, thickness: 0.5pt, radius: 1.5pt),
    [GUN.EXE\ (1D6 DAMAGE)],
    d6_maker(2, size: 10pt, thickness: 0.5pt, radius: 1.5pt),
    [Text file on disk\ (_2-in-6:_ illegal)],
    d6_maker(3, size: 10pt, thickness: 0.5pt, radius: 1.5pt),
    [Utility or game\ (advent, rogue)],
    grid.hline(stroke: 0.5pt),
    d6_maker(4, size: 10pt, thickness: 0.5pt, radius: 1.5pt),
    [Patch kit (heals 1D6 DAMAGE)],
    d6_maker(5, size: 10pt, thickness: 0.5pt, radius: 1.5pt),
    [D6 TOKENS (daemon money)],
    d6_maker(6, size: 10pt, thickness: 0.5pt, radius: 1.5pt),
    [D3 PARITY BITS\ (preserves data)],
  )

  #pamph_grid(
    inset: (x, y) => if y != 0 and y != 4 {
      (y: 6pt)
    } else {
      0pt
    },
    grid.cell(
      colspan: 4,
      pamph_l_h2[Negative space (same for all floors)],
    ),
    d6_maker(21),
    [Nothing. Solid concrete, an elevator shaft, or the digital void.],
    d6_maker(24),
    [A secret passage linking two adjacent rooms. No lighting, dark inside.],
    grid.hline(stroke: 0.5pt),
    d6_maker(22),
    [Pipes, wiring, air ducts; behind thick walls.\ Not user serviceable.],
    d6_maker(25),
    [A secret passage linking all adjacent rooms. Peepholes by doors.],
    grid.hline(stroke: 0.5pt),
    d6_maker(33),
    [An empty, florescent-lit corridor linking all adjacent rooms.],
    d6_maker(26),
    [As 5. Also contains something important, like an item or intel.],
    grid.cell(
      colspan: 4,
      par(justify: true)[If a room would be cut off due to negative space, replace a negative space die with a #d6_mini(33, size: 5.25pt, outset: 0.25pt) corridor so all rooms are reachable.],
    ),
  )


  // == Method BRAVO: Puzzle Cube (from 5TD)

  // The puzzle cube invented by Professor Rubik was not created to teach students about 3D objects, but to peer into other possible realities.

  // Shuffle a 3x3 puzzle cube, then roll it like a D6. Map the colors on the top side to rooms and negative space according to this table (or shuffle and reroll):

  // #pamph_grid(
  //   inset: (x, y) => if y == 0 {
  //     (bottom: 6pt)
  //   } else if y == 1 {omposed of
  //     (y: 6pt)
  //   } else {
  //     (top: 6pt)
  //   },
  //   align: (right, left),
  //   pamph_l_h3(size: 7pt)[RED],
  //   [uhhhh],
  //   pamph_l_h3(size: 7pt)[GREEN],
  //   [A general room],
  //   grid.hline(stroke: 0.5pt),
  //   pamph_l_h3(size: 7pt)[ORANGE],
  //   [Something else???],
  //   pamph_l_h3(size: 7pt)[BLUE],
  //   [Negative space],
  //   grid.hline(stroke: 0.5pt),
  //   pamph_l_h3(size: 7pt)[YELLOW],
  //   [A room with an item.],
  //   pamph_l_h3(size: 7pt)[WHITE],
  //   [Boring room],
  // )
]

#let panel_5 = floor_panel_template(fill: emph_gray)[
  == Office of the future

  #floor_desc(
    d6_maker(33, size: 16pt),
    floor_desc_num[x 3],
    d6_maker(6, size: 16pt),
    floor_desc_num[x 6],
    [
      *Decor:* Ultra-modern office, with fake windows displaying views from real skyscrapers.\
      *Entrance:* _Lowest_ room die. You awake in a brain-beam chair like the one you sat in.\
      *Exit:* #d6_mini(5) or _highest_ room die. Spiral staircase.
    ],
  )

  #pamph_grid(
    // column-gutter: 5pt,
    d6_maker(1),
    [Computer room. Rows of mainframes along the walls, across the floor.],
    // d6_maker(4),
    d6_maker(4),
    [Cafeteria. Only food is a daemon-operated sandwich machine.],
    grid.hline(stroke: 0.5pt),
    // d6_maker(12),
    d6_maker(12),
    [An open-plan office. Smells like burnt coffee. No coffee to be found.],
    // d6_maker(5),
    d6_maker(5),
    [Reception area. Piles of technical magazines, uncomfortable chairs.],
    grid.hline(stroke: 0.5pt),
    // d6_maker(3),
    d6_maker(3),
    [A conference room or meeting room, no users. Plastic fruit on table.],
    // d6_maker(16),
    d6_maker(16),
    [Middle manager office. Bookshelves hold blank encyclopedia set.],
  )

  #block(
    fill: white,
    outset: (x: 6pt, y: 8pt),
    radius: 4pt,
    above: 1.8em,
    below: 1.8em,
  )[
    == Network traffic hub

    #floor_desc(
      d6_maker(32, size: 16pt),
      floor_desc_num[x 2],
      d6_maker(16, size: 16pt),
      floor_desc_num[x 7],
      [
        *Decor:* A bustling post office, a cubic honeycomb of boxes and machinery. Lines on the floor.\
        *Entrance:* _Lowest_ room die. Automatic door.\
        *Exit:* _Highest_ room die. Has a big "EXIT" sign leading to a fire stairwell.
      ],
    )

    #pamph_grid(
      d6_maker(1),
      [Mail counter. A cordoned queue of users snakes around.],
      d6_maker(4),
      [Logistical office. Screens flash nonsensical data, everything on the wire.],
      grid.hline(stroke: 0.5pt),
      d6_maker(2),
      [Computer room. Rows of mainframes along the walls, across the floor.],
      d6_maker(5),
      [Cafeteria. Only food is a daemon-operated sandwich machine.],
      grid.hline(stroke: 0.5pt),
      d6_maker(3),
      [Departure lounge. Rows of benches, filled with glassy-eyed daemons.],
      d6_maker(6),
      [Data validation. Stand on a circular platform to generate a PARITY BIT.],
    )
  ]

  == Data warehouse

  #floor_desc(
    d6_maker(21, size: 16pt),
    floor_desc_num[x 1],
    d6_maker(5, size: 16pt),
    floor_desc_num[x 8],
    [
      *Decor:* A warehouse, weapons depot, or dockyard. Shipping containers and shelves of crates.\
      *Entrance:* _Lowest_ room die. Main entrance.\
      *Exit:* _Lowest_ negative space die. Access hatch with OSHA-approved ladder.
    ],
  )

  #pamph_grid(
    d6_maker(1),
    [An open-plan office. Smells like burnt coffee. No coffee to be found.],
    d6_maker(4),
    [Reception area. Piles of technical magazines, uncomfortable chairs.],
    grid.hline(stroke: 0.5pt),
    d6_maker(12),
    [Computer room. Rows of mainframes along the walls, across the floor.],
    d6_maker(5),
    [Cafeteria. Only food is a daemon-operated sandwich machine.],
    grid.hline(stroke: 0.5pt),
    d6_maker(3),
    [A conference room or meeting room, no users. Plastic fruit on table.],
    d6_maker(16),
    [Middle manager office. Bookshelves hold blank encyclopedia set.],
  )
]

#let panel_6 = floor_panel_template[
  == Security layer (firewall)

  #floor_desc(
    d6_maker(22, size: 16pt),
    floor_desc_num[x 2],
    d6_maker(13, size: 16pt),
    floor_desc_num[x 7],
    [
      *Decor:* A military base, lots of fences.\ _3-in-6:_ walls appear to be literally made of fire.\
      *Entrance:* _Lowest_ room die. High-security door.\
      *Exit:* _Highest_ room die. Exceptionally clean garbage chute leads to next floor.
    ],
  )

  #pamph_grid(
    d6_maker(1),
    [Gateways sealing off ports. Not even daemons are allowed through.],
    d6_maker(4),
    [Data encryption center. Long line of users. You have the master key.],
    grid.hline(stroke: 0.5pt),
    d6_maker(2),
    [Inspection station. Packet-sniffing daemons can tell you're _rogue_.],
    d6_maker(5),
    [A Cerberus' den. Dog bed and jars of TOKENS it can track by scent.],
    grid.hline(stroke: 0.5pt),
    d6_maker(3),
    [An empty corridor, modified with a trap (_FIST_ p.92).],
    d6_maker(6),
    [Security camera office. Monitors display views of other rooms.],
  )

  #block(
    fill: emph_gray,
    outset: (x: 6pt, y: 8pt),
    radius: 4pt,
    above: 1.8em,
    below: 1.8em,
  )[
    == Research & development

    #floor_desc(
      d6_maker(21, size: 16pt),
      floor_desc_num[x 1],
      d6_maker(2, size: 16pt),
      floor_desc_num[x 8],
      [
        *Decor:* A series of garages littered with chunks of half-finishged daemons and digital cruft.\
        *Entrance:* _Lowest_ room die. Mail sorting.\
        *Exit:* _Highest_ room die. Has a big "EXIT" sign leading to a fire escape.
      ],
    )

    #pamph_grid(
      d6_maker(1),
      [An empty, plain white room. No lighting fixtures, still fullbright.],
      d6_maker(4),
      [Reception area. Piles of technical magazines, uncomfortable chairs.],
      grid.hline(stroke: 0.5pt),
      d6_maker(12),
      [Computer room. Rows of mainframes along the walls, across the floor.],
      d6_maker(5),
      [Cafeteria. Only food is a daemon-operated sandwich machine.],
      grid.hline(stroke: 0.5pt),
      d6_maker(13),
      [A conference room or meeting room, no users. Plastic fruit on table.],
      d6_maker(16),
      [Engineering planning room. Obscure code tacked up on walls.],
    )
  ]

  == C-Suite (restricted access)

  #floor_desc(
    d6_maker(20, size: 16pt),
    floor_desc_num[x 0],
    d6_maker(4, size: 16pt),
    floor_desc_num[x 9],
    [
      *Decor:* Skyscraper penthouse, a superyacht, a private island, etc. Overuse of marble and silver.\
      *Entrance:* _Lowest_ room die. Reception desk.\
      *Exit:* _Next lowest_ room die. A dark room with important files on a pedastal. Not a trap. :)
    ],
  )

  #pamph_grid(
    d6_maker(1),
    [Check-in & ticketing. A cordoned queue of users snakes around.],
    d6_maker(4),
    [Reception area. Piles of technical magazines, uncomfortable chairs.],
    grid.hline(stroke: 0.5pt),
    d6_maker(2),
    [Computer room. Rows of mainframes along the walls, across the floor.],
    d6_maker(5),
    [Cafeteria. Only food is a daemon-operated sandwich machine.],
    grid.hline(stroke: 0.5pt),
    d6_maker(3),
    [Departure lounge. Rows of benches, filled with glassy-eyed daemons.],
    d6_maker(6),
    [Transit security office. Monitors display views of all other rooms.],
  )
]

#let panel_holder(..panels) = grid(
  columns: (1fr,) * 3,
  column-gutter: 12pt,
  ..panels
)

// actually set up the page, assemble for printing or screen reading.
// TODO: make a singles version too

#panel_holder(panel_3, panel_2, panel_1)

#pagebreak()

#panel_holder(panel_4, panel_5, panel_6)
