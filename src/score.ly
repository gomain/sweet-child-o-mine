#(define mydrums '(
  (hihat cross #f 5)
  (halfopenhihat cross "halfopen" 5)
  (ridecymbal cross #f 4)
  (crashcymbal cross #f 6)
  (bassdrum default #f -3)
  (snare default #f 1)
  (hightom default #f 3)
  (lowtom default #f 2)
  (highfloortom default #f -1)
  (pedalhihat cross #f -5)
  (sidestick cross #f 1)))

\version "2.22.0"
\include "drums.ly"
\paper {
  top-margin = #12
  markup-system-spacing.basic-distance = #15
  system-system-spacing.basic-distance = #15
  print-all-headers = ##t
  #(include-special-characters)
  oddFooterMarkup = \markup {
    \fill-line {
      \center-column {
        \line { &copyright; All rights ignored.
                Transcribed by Joe Gomain Hoyes &ndash; gomain@gmail.com }
        \line \small { Music engraving by LiliyPond 2.22.0 &ndash; www.lilypond.org }
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}
\book {
  \score {
    \header {
      title = "Sweet Child O'Mine"
      subtitle = "(Alternate Version)"
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
        \override VerticalAxisGroup.default-staff-staff-spacing =
        #'((basic-distance . 6)
           (minimum-distance . 5)
           (padding . 2)
           (stretchability . 10))
      }
      \context {
        \Score
        \override SpacingSpanner.shortest-duration-space = #3
      }
    }
  }
}
