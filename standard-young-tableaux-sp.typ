#set text(size: 12pt)

#import table: cell
#let standard-young-tableaux-sp(
  type: ((1,2,3), (4,5), (6,)),
  cellsize: 1.1em,
  fontsize: 0.7em,

) = {
  let tableaucells = calc.max(type.len(), type.at(0).len())
  let cells = ()
  let columnsize = ()
  let rowsize = ()
  let i = 0

  while i < type.at(0).len() {
    columnsize.push(cellsize)
    i += 1
  }
  i = 0
  while i < type.len() {
    rowsize.push(cellsize)
    i += 1
  }

  for (y, row-length) in type.enumerate() {
    let x = 0
    while x < type.at(0).len() {
      if x < type.at(y).len() {
        cells.push(
          cell(x: x,
              y: y,
          )[#text(size: fontsize)[#type.at(y).at(x)]],
        )
      } else {
        cells.push(
          cell(x: x,
              y: y,
              stroke: none
          )[],
        )
      }
      x += 1
    }
  }
  box(
    baseline: 50% - 0.5em,
    table(
      columns: columnsize,
      rows: rowsize,
      align: center + horizon,
      ..cells
    )
  )
}

#let my-tableau1 = (
  (1, 2, 3, 4),
)
#let my-tableau2 = (
  (1, 2, 3),
  (4,),
)
#let my-tableau3 = (
  (1, 2, 4),
  (3,),
)
#let my-tableau4 = (
  (1, 3, 4),
  (2,),
)
#let my-tableau5 = (
  (1, 2),
  (3, 4),
)
#let my-tableau6 = (
  (1, 3),
  (2, 4),
)
#let my-tableau7 = (
  (1, 2),
  (3,),
  (4,),
)
#let my-tableau8 = (
  (1, 3),
  (2,),
  (4,),
)
#let my-tableau9 = (
  (1, 4),
  (2,),
  (3,),
)
#let my-tableau10 = (
  (1,),
  (2,),
  (3,),
  (4,),
)

ブロック数4のStandard Young Tableaux をすべて列挙しよう。

(1) #standard-young-tableaux-sp(type: my-tableau1) と\
(2) #standard-young-tableaux-sp(type: my-tableau2) と  #standard-young-tableaux-sp(type: my-tableau3) と #standard-young-tableaux-sp(type: my-tableau4) と\
(3) #standard-young-tableaux-sp(type: my-tableau5) と 
#standard-young-tableaux-sp(type: my-tableau6) と\
(4) #standard-young-tableaux-sp(type: my-tableau7) と 
#standard-young-tableaux-sp(type: my-tableau8) と 
#standard-young-tableaux-sp(type: my-tableau9) と\
(5) #standard-young-tableaux-sp(type: my-tableau10) で以上である。

(1) の #standard-young-tableaux-sp(type: my-tableau1) は自明表現に対応する標準ヤング盤であるとする。このとき #standard-young-tableaux-sp(type: my-tableau10) に関しては符号表現に対応するものである。また、 #standard-young-tableaux-sp(type: my-tableau3) と #standard-young-tableaux-sp(type: my-tableau8) は転置の関係にある。ゆえにこれらから計算される$"Cont"(4)$の元は互いに$-1$倍の関係である。パッケージのすごさを伝えるために大きくしてみよう。 #standard-young-tableaux-sp(type: my-tableau7, cellsize: 1cm) 小さくもできるぞ！ #standard-young-tableaux-sp(type: my-tableau2, cellsize: 0.5em)

頑張れば巨大な標準ヤング盤も作れる。

#let my-tableau100 = (
  (1, 3, 7, 11, 15, 23, 29, 34, 41, 47, 52, 58, 63, 67, 72, 78, 83, 87, 91, 94, 97),
  (2, 5, 9, 18, 25, 31, 39, 44, 49, 55, 61, 66, 74, 79, 84, 89, 92, 95),
  (4, 8, 14, 21, 28, 35, 42, 48, 56, 62, 68, 75, 80, 85, 90, 93),
  (6, 12, 19, 26, 33, 40, 46, 53, 59, 64, 69, 76, 81, 99),
  (10, 16, 22, 30, 37, 43, 50, 57, 65, 70, 77),
  (13, 20, 27, 32, 38, 45, 51, 60),
  (17, 24, 36, 54, 98),
  (73,100),
)

#align(center)[
  #standard-young-tableaux-sp(type: my-tableau100, cellsize: 1.7em, fontsize: 10pt)
]

各正方形ブロックの大きさと文字の大きさはユーザーが指定できる。#standard-young-tableaux-sp(fontsize: 5pt)