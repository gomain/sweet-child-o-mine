#(define mydrums '(
  (hihat cross #f 5)
  (ridecymbal cross #f 4)
  (crashcymbal cross #f 6)
  (bassdrum default #f -3)
  (snare default #f 1)
  (highfloortom default #f -1)))

\version "2.22.0"
\include "drums.ly"
\paper {
  system-system-spacing.basic-distance = #15
}
\book {
  \score {
    \header {
      title = "Sweet Child O'Mine"
      composer = "Guns N' Roses"
    }
    \new DrumStaff \with { instrumentName = "Drums" } {
      \time 4/4
      \tempo 4 = 120
      \drumsMusic
    }
    \layout {
      \context {
        \DrumStaff
        drumStyleTable = #(alist->hash-table mydrums)
      }
      \override Score.SpacingSpanner.shortest-duration-space = #3
    }
  }
}
