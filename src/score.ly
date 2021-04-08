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
  top-margin = #12
  markup-system-spacing.basic-distance = #15
  system-system-spacing.basic-distance = #15
  print-all-headers = ##t
  oddFooterMarkup = \markup {
    \fill-line {
      \center-column {
        \line { Transcribed by Joe Gomain Hoyes - gomain@gmail.com }
        \line \small { Music engraving by LiliyPond 2.22.0 - www.lilypond.org }
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
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
