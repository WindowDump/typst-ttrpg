#set document(
  title: "Disks & Daemons - Screen Version",
  author: "Window Dump",
  keywords: ("fist", "world of dungeons", "wodu", "pbta", "osr", "nsr"),
)

#import "template.typ": *

#show: rest => pamphlet_light(rest)

#show link: it => underline(it, stroke: 0.25pt)

#let panel_1 = panel_template(fill: dd_grey, clip: true)[
  #block(
    width: 100%,
    inset: (x: 12pt, top: 12pt),
  )[
    // background radial gradient
    // TODO: replace with a cool SVG or something, graphic design is hard
    #place(
      horizon + center,
      dy: -28pt,
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
        row-gutter: (4pt, 4pt, 12pt, 4pt),
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
        cover_tagline(dx: -6pt)[Breach the firewall],
        cover_tagline(dx: 0pt)[Feed the daemons],
      ),
    )

    #place(
      bottom + right,
      dx: 16pt,
      image(
        "FIST_compatibility_mark_alpha_white.png",
        width: 96pt,
        alt: "Compatible with FIST",
      ),
    )
  ]

  #show heading.where(level: 1): it => block(
    pamph_d_h1(it.body, size: 13pt),
    below: 8pt,
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

  Hey, FIST! It's JRH, your favorite "hacker!" Ha, that's what the news called me. The lab just got some "office productivity" chairs that beam your brain into the mainframe! I found some classified files with your name on them. You should take a look for yourself...

  #show heading.where(level: 2): it => block(
    pamph_l_h1_bar(it.body),
    above: 8pt,
  )

  == Briefing

  The year is 198X. Higher learning institutions and private defense contractors have linked mainframe computers via the *ARPANET Project*. The stated goal is sharing of resources and communication. A (likely intentional) bug in the encryption scheme allows easy access to any system. You recently exploited this with the help of *JRH*, a graduate student in Cambridge.

  A tool developed in Palo Alto, CA by a *CYCLOPS* proxy company allows beaming of human consciousness into a virtual office environment named the *Ideaspace*, a digital skyscraper visualized as an endless series of floors. State of the art technology provides high-resolution 2-bit monochromatic graphics. There is a lot of dithering, but text looks really good. Users can conduct common tasks like document editing, programming, or system administration. They can even access any ARPANET server.

  Computer labs have installed these beaming chairs for development or demonstration, and some are used every day. Publicly, there are no known side effects...
]

#let panel_2 = panel_template(
  fill: none,
  inset: (top: 8pt, x: 8pt, bottom: 4pt),
)[
  = Users & Daemons

  *Users* represent a person's Ideaspace session, full-beam or otherwise: gray capsules in a roughly humanoid shape. JRH's hacks disguise you as one of them, but not all are fooled - you're _rogue_, not authorized to be there.

  *Daemons* represent a system process, (re)generated as needed. Common Daemons are "cute" to discourage attacks from new Users: about three feet tall, rotund, with conical horns. They love *TOKENS*, eating them like candy or cigarettes, and perform their only programmed task (save a file, message a User, fetch news, etc.) in exchange for one. Other Daemons are modeled after fantasy creatures and have more complex programming.

  = Floor transmission <floor-transmission>

  FIST is breaching the Ideaspace with a hacked up tech demo -- don't expect to go unnoticed with all your bits intact. Transmitting between floors can cause *DATA LOSS* -- *PARITY BITS* can be found to correct errors. When FIST transmits to a new floor, roll *1D6* for complications:

  + *Data corruption.* Consume a PARITY BIT or gain a level of DATA LOSS (see below).
  + *Noise.* Consume a PARITY BIT or take 1 DAMAGE.
  + *Interference.* Consume a PARITY BIT or lose an item.
  + *Big footprint.* Set the #link(<cyberclock>)[_CYBERCLOCK_] to *4*.
  + *Session logged.* Reduce the _CYBERCLOCK_ by *1D6*.
  + Mercifully, a clean and quiet transmission.

  At 3 levels of *DATA LOSS* an operative is experiencing *Achiba Syndrome* - their mind treats the Ideaspace as real and cannot return to their original body. A separate rescue mission is required if this is undesired.

  == Inspiration & Touchstones

  #set text(size: 8pt, tracking: 0.005em)

  - *Procedures & Generators:* #link("https://claymorerpgs.itch.io/hazard-function")[_HAZARD FUNCTION_], #link("https://goblinpunch.blogspot.com/2023/04/the-underclock-fixing-random-encounter.html")[The Under-clock], #link("https://awkwardturtle.itch.io/wallet-dungeons")[_Wallet Dungeons_], #link("https://www.fivetorchesdeep.com")[_Five Torches Deep_], #link("https://www.hedonic.ink/simple-diedrop-dungeon/")[die-drop dungeons]
  - *Games:* #link("https://www.roguebasin.com/index.php/Rogue")[_Rogue_], #link("https://drl.chaosforge.org")[_DRL_], _Coded Arms_, _SMT NINE_
  - *Books:* _Hackers: Heroes of the Computer Revolution_
  - *Sites:* #link("https://github.com/agiacalone/jargonfile/blob/main/historical/jarg1-88-10-04.txt")[The Hacker Jargon File], #link("http://textfiles.com")[TEXTFILES.COM]
  - *Films:* _TRON_ (1982), _WarGames_ (1983)

  Text & layout by Window Dump, 2025. Written in #link("https://typst.app")[Typst] on a #link("https://github.com/foostan/crkbd/tree/v4.0")[Corne].\
  // Set in #link("https://practicaltypography.com/charter.html")[Charter], #link("https://github.com/Omnibus-Type/Archivo")[Archivo], and #link("https://tug.org/FontCatalogue/cmrfonts.html")[Computer Modern Roman Dunhill].\
  Based on #link("https://claymorerpgs.itch.io/fist")[_FIST: Ultra Edition_] by CLAYMORE RPGs, licensed under\ #link("https://creativecommons.org/licenses/by-sa/4.0/")[CC BY-SA 4.0]: https://creativecommons.org/licenses/by-sa/4.0/.\
  This document is licensed under #link("https://creativecommons.org/licenses/by-sa/4.0/")[CC BY-SA 4.0].

  greetz to the FIST server, the NSR Cauldron, and Dice Exploder.
]

#let panel_3 = panel_template(
  fill: emph_gray,
  inset: (top: 8pt, x: 8pt, bottom: 4pt),
)[
  = Encounters <encounters>

  Use the _CYBERCLOCK_ <cyberclock> to determine when FIST encounters a wandering net denizen. It starts at *10* on a new floor. Subtract *1D6* when FIST enters a new room, travels through three visited rooms, or causes notable chaos.\ _At 0 or 1_, foreshadow the next encounter, then set to 1.\ _Below 0_, the encounter occurs. After, set to *10*.

  #block(below: 1fr)[
    Roll *2D6* to determine an encounter. The third random encounter is always a *CERBERUS* or *CRO DIAL TONE*.\
    If a denizen's reaction to FIST is not obvious, roll *1D6*:\ #d6_mini(1)~hostile, #d6_mini(2)~#d6_mini(3)~wary, #d6_mini(4)~#d6_mini(5)~neutral, #d6_mini(6)~curious or friendly.
  ] <encounter-table>

  #let encounters = (
    [*CERBERUS* (10 HP, 1 ARMOR, 1D6+1 DAMAGE). Three-headed guard dog. Demands a valid TOKEN from each member of FIST, attacks if unsatisfied.],
    [*NAME DRAGON* (8 HP, 1D6 DAMAGE). Greets Users with the message of the day (funny picture) and accounts their name and actions. Wise and curious.],
    [*PHANTOM* (7 HP, 1D6 DAMAGE). A long-lived Daemon spawned by the system. Watches an external connection of some kind - news wire, printer spooler, etc.],
    [*SERVER DAEMON* (5 HP, 1D6 DAMAGE). Single-minded and determined. Performing a job for a User: #d6_mini(1)~mail, #d6_mini(2)~#d6_mini(3)~save/load file, #d6_mini(4)~#d6_mini(5)~math, #d6_mini(6)~networking],
    [*D3 DAEMONS* (4 HP, 1D6 DAMAGE). Lurking around, waiting for a task, itching for a TOKEN.],
    [*D6 BUGS* (3 HP, 3 DAMAGE). No matter how hard the programmers try, these things keep showing up.],
    [*D3 USERS* (4 HP, 3 DAMAGE). Low clearance, low familiarity. Often annoying or downright stupid.],
    [*HACKER* (5 HP, 1D6 DAMAGE). Speaks the dialect of the Daemons, likes puzzles, knows little else. More loyal to the system than to their employer.],
    [*MANAGER* (5 HP, 3 DAMAGE). High clearance, not hired for technical skills. Has an ACCESS CARD.],
    [*SYSOP* (8 HP, 1D6+1 DAMAGE). A system operator. Wields a custom GUN.EXE, loves excuses to use it.],
    [
      *CRO DIAL TONE* (15 HP, 1D6+1 DAMAGE).\
      *DROPPED CALL:* A CYCLOPS analyst sent into the Ideaspace to covertly install monitoring software. They lingered too long and developed Achiba Syndrome. Now designated DIAL TONE, they speak with snippets from automated phone lines.\
      *NO CARRIER (BOSS MOVE):* Attacks FIST's connection directly. Roll *+TAC*: *10+* you're fine, *7--9* dazed for one round, *6-* gain a level of DATA LOSS.
    ],
  )

  #set par(justify: false, leading: 0.575em)

  #grid(
    ..for x in range(0, 11) {
      (
        block(
          grid(
            columns: (8pt, 1fr),
            column-gutter: 4pt,
            align: (right, left),
            text(
              str(x + 2),
              font: "Archivo",
              weight: 500,
              number-width: "tabular",
            ),
            text(
              encounters.at(x),
              size: 9pt,
            ),
          ),
          inset: (y: 0.45em, x: 0.2em),
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

  The Ideaspace is visualized as a series of floors. Decide the number of floors until vital intel relating to a member of FIST's Roles is found. Use the presented floor order or choose another (like D3+floor number). Each floor has "stairs" that transmit to the next floor, but not back. See #link(<floor-transmission>)[_Floor transmission_] for the risks.

  Gather *12 D6's*. Choose 3 of the same color to represent #d6_mini(21)~_negative space_. Other dice represent #d6_mini(1)~_rooms_. Themes for floors and their rooms are described on the right. Each floor shows how much of each dice to use, the locations of the entrance and exit, and six room types.

  #grid(
    columns: (auto, 1fr),
    column-gutter: 6pt,
    row-gutter: 12pt,
    align: horizon,
    block(
      inset: 4pt,
      radius: 6pt,
      fill: dd_grey,
      grid(
        columns: 3,
        gutter: 3pt,
        d6_maker(24, fill: black, dark: white, size: 12pt),
        d6_maker(32, fill: black, dark: white, size: 12pt),
        d6_maker(02, fill: none, paint: white, size: 12pt),

        d6_maker(21, fill: black, dark: white, size: 12pt),
        d6_maker(03, fill: none, paint: white, size: 12pt),
        d6_maker(25, fill: black, dark: white, size: 12pt),

        d6_maker(26, fill: black, dark: white, size: 12pt),
        d6_maker(33, fill: black, dark: white, size: 12pt),
        d6_maker(16, fill: none, paint: white, size: 12pt),
      ),
    ),
    text(
      hyphenate: false,
    )[To generate a floor, roll its dice and gather them into a 3 by 3 grid, like the one on the left. Each die's number indicates which type of room it is, based on the floor. Adjacent rooms are connected via doors.],
  )

  // == Contents of rooms

  In addition to the special features of a room:

  #box(stack(dir: ltr, spacing: 4pt, d6_mini(2), d6_mini(4), d6_mini(6))) *Even rooms* contain a denizen. Roll on the #link(<encounter-table>)[_encounter table_] to learn who is there when FIST arrives.

  #box(stack(dir: ltr, spacing: 4pt, d6_mini(1), d6_mini(3), d6_mini(5))) *Odd rooms* contain a text file on a disk. Choose or roll: #d6_mini(1)~meeting minutes, #d6_mini(2)~TPS reports, #d6_mini(3)~bad puns,\ #d6_mini(4)~documentation, #d6_mini(5)~Usenet thread, #d6_mini(6)~warez or philez

  #box(stack(dir: ltr, spacing: 4pt, d6_mini(1), d6_mini(2), d6_mini(3))) *Minor rooms* have a _4-in-6_ chance of containing a _common item_ (#link("https://claymorerpgs.itch.io/fist")[_FIST: Ultra Edition_], pg. 85). These are GUI wrappers over an appropriate utility program.

  #block(
    below: 0.60em,
  )[#box(stack(dir: ltr, spacing: 4pt, d6_mini(4), d6_mini(5), d6_mini(6))) *Major rooms* contain an item. Choose or roll:]

  #pamph_grid(
    columns: (auto, 1fr) * 3,
    column-gutter: 3.0pt,
    inset: (x, y) => if y != 0 {
      (top: 6pt)
    } else {
      (bottom: 6pt)
    },
    d6_maker(1, size: 11pt, thickness: 0.5pt, radius: 1.5pt),
    [GUN.EXE (1D6 DAMAGE)],
    d6_maker(2, size: 11pt, thickness: 0.5pt, radius: 1.5pt),
    [Obscure source code or script],
    d6_maker(3, size: 11pt, thickness: 0.5pt, radius: 1.5pt),
    [Game (advent, rogue, spacewar)],
    grid.hline(stroke: 0.5pt),
    d6_maker(4, size: 11pt, thickness: 0.5pt, radius: 1.5pt),
    [Patch kit (heals 1D6 DAMAGE)],
    d6_maker(5, size: 11pt, thickness: 0.5pt, radius: 1.5pt),
    [D6 TOKENS (Daemon treat)],
    d6_maker(6, size: 11pt, thickness: 0.5pt, radius: 1.5pt),
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
      inset: (top: 4pt, bottom: 2pt),
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
      inset: (top: 2pt),
      par(
        justify: true,
      )[If a room would be cut off due to negative space, replace a negative space die with a #d6_mini(33, size: 5.25pt, outset: 0.25pt)~corridor so all rooms are reachable.],
    ),
  )

  // If a room would be cut off due to negative space, replace a negative space die with a #d6_mini(33, size: 5.25pt, outset: 0.25pt) corridor so all rooms are reachable.


  // == Method BRAVO: Puzzle Cube (from 5TD)

  // The puzzle cube invented by Professor Rubik was not created to teach students about 3D objects, but to peer into other possible realities.

  // Shuffle a 3x3 puzzle cube, then roll it like a D6. Map the colors on the top side to rooms and negative space according to this table (or shuffle and reroll):

  // #pamph_grid(
  //   inset: (x, y) => if y == 0 {
  //     (bottom: 6pt)
  //   } else if y == 1 {
  //     (y: 6pt)
  //   } else {
  //     (top: 6pt)
  //   },
  //   align: (right, left),
  //   pamph_l_h3(size: 7pt)[RED],
  //   [stuff],
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
      *Entrance:* _Lowest_ room die. You awake in a chair, surrounded by tutorial messages.\
      *Exit:* #d6_mini(5)~or _highest_ room die. Spiral staircase.
    ],
  )

  #pamph_grid(
    d6_maker(1),
    [Computer room. Rows of mainframes along the walls, across the floor.],
    d6_maker(4),
    [Break room. Only food is a Daemon-operated sandwich machine.],
    grid.hline(stroke: 0.5pt),
    d6_maker(12),
    [An open-plan office. Smells like burnt coffee. No coffee to be found.],
    d6_maker(5),
    [Reception area. Piles of technical magazines, uncomfortable chairs.],
    grid.hline(stroke: 0.5pt),
    d6_maker(3),
    [A conference room or meeting room, no Users. Plastic fruit on table.],
    d6_maker(6),
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
      d6_maker(23, size: 16pt),
      floor_desc_num[x 3],
      d6_maker(16, size: 16pt),
      floor_desc_num[x 6],
      [
        *Decor:* Bustling post office, a cubic honeycomb of boxes and machinery. Lines on the floor.\
        *Entrance:* _Lowest_ room die. Automatic door.\
        *Exit:* _Highest_ negative space die. Has a big "EXIT" sign leading to a fire stairwell.
      ],
    )

    #pamph_grid(
      d6_maker(1),
      [Mail counter. A cordoned queue snakes around, Daemons waiting in line.],
      d6_maker(4),
      [Monitoring room. Screens flash data, faster than you can read.],
      grid.hline(stroke: 0.5pt),
      d6_maker(2),
      [Mail box room. Reinforced locked doors cover the walls.],
      d6_maker(5),
      [Data validation. Stand on a circular platform to generate a PARITY BIT.],
      grid.hline(stroke: 0.5pt),
      d6_maker(3),
      [Receiving room. Large crates of packets stacked to the ceiling.],
      d6_maker(16),
      [Sorting room. High speed machines move mail towards destination.],
    )
  ]

  == Data warehouse

  #floor_desc(
    d6_maker(21, size: 16pt),
    floor_desc_num[x 1],
    d6_maker(5, size: 16pt),
    floor_desc_num[x 8],
    [
      *Decor:* Warehouse, weapons depot, or dockyard. Shipping containers and shelves of crates.\
      *Entrance:* _Lowest_ room die. Garage door.\
      *Exit:* #d6_mini(3)~or _highest_ room die. Access hatch with OSHA-approved ladder (very long).
    ],
  )

  #pamph_grid(
    d6_maker(1),
    [A maze of shelves filled with crates. Close angles and small gaps.],
    d6_maker(4),
    [Armory. Holds 2 items inside a cage -- door requires ACCESS CARD.],
    grid.hline(stroke: 0.5pt),
    d6_maker(12),
    [Random data source -- a Daemon constantly rolling a pile of dice.],
    d6_maker(5),
    [Punch card catalog, meticulously organized. Personnel data.],
    grid.hline(stroke: 0.5pt),
    d6_maker(13),
    [Forklift garage. Machines and parts in various stages of assembly.],
    d6_maker(16),
    [Guard post. Daemon on duty demands to see an ACCESS CARD or bribe.],
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
      *Decor:* Military base, lots of fences. Users here carry an ACCESS CARD, Daemons expect one.\
      _3-in-6:_ walls appear to be literally made of fire.\
      *Entrance:* _Highest_ room die. High-security door.\
      *Exit:* _Lowest_ room die. Very clean garbage chute.
    ],
  )

  #pamph_grid(
    d6_maker(1),
    [Gateways sealing off ports on walls. No one is allowed through.],
    d6_maker(4),
    [Data encryption center. Long line of Users. JRH can decrypt anything.],
    grid.hline(stroke: 0.5pt),
    d6_maker(2),
    [Inspection station. Packet-sniffing Daemons can tell you're _rogue_.],
    d6_maker(5),
    [A CERBERUS' den. Dog bed and jars of TOKENS it can track by scent.],
    grid.hline(stroke: 0.5pt),
    d6_maker(13),
    [An empty corridor, modified with a trap (_FIST_ p.92).],
    d6_maker(6),
    [Security camera office. Monitors display views of other rooms and floors.],
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
      d6_maker(32, size: 16pt),
      floor_desc_num[x 2],
      d6_maker(2, size: 16pt),
      floor_desc_num[x 7],
      [
        *Decor:* Series of laboratories littered with equipment and chunks of half-finished Daemons.\
        *Entrance:* _Lowest_ room die. Airlock.\
        *Exit:* _Highest_ room die. An excessively ornate doorway labeled "PRODUCTION READY."
      ],
    )

    #pamph_grid(
      d6_maker(1),
      ["The Clean Room." Empty, plain white, fullbright lighting.],
      d6_maker(4),
      [Media room. A screen plays pirate recordings of various TV shows.],
      grid.hline(stroke: 0.5pt),
      d6_maker(12),
      [Physics debug room with a basketball and hoop. Encounter wants a game.],
      d6_maker(5),
      [Global thermonuclear war simulation room. Neural nets battle.],
      grid.hline(stroke: 0.5pt),
      d6_maker(13),
      [/dev/null -- the garbage room. Poorly secured hatch to oblivion.],
      d6_maker(6),
      [Patch room. Automated machine heals 1D6 HP if you hold still under it.],
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
      *Entrance:* #d6_mini(2)~or _lowest_ room die. Double doors.\
      *Exit:* _Next lowest_ room die. Stairs into a dark room with files on a pedestal. Not a trap. :)
    ],
  )

  #pamph_grid(
    d6_maker(1),
    [Indoor hot tub, lounge chairs, muzak. Empty bottles of champagne.],
    d6_maker(4),
    [Situation room. Screens display stock tickers and news feeds.],
    grid.hline(stroke: 0.5pt),
    d6_maker(12),
    [Reception desk. Encounter asks to check your ACCESS CARD.],
    d6_maker(5),
    [Cigar room. Digital stogies make cool smoke clouds, but little else.],
    grid.hline(stroke: 0.5pt),
    d6_maker(3),
    [City planning room. Highly detailed diorama of a major American city.],
    d6_maker(16),
    [Lavishly decorated office, potted plants and a desk with a carapace chair.],
  )
]

#set page(
  paper: "us-letter",
  flipped: true,
  margin: 12pt,
)

#let panel_holder(..panels) = grid(
  columns: (1fr,) * 3,
  column-gutter: 12pt,
  ..panels
)

// actually set up the page, assemble for screen viewing
// see pamphlet-print.typ and pamphlet-singles.typ for other layouts

#panel_holder(panel_1, panel_2, panel_3)

#pagebreak()

#panel_holder(panel_4, panel_5, panel_6)
