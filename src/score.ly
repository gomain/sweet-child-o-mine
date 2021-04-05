\version "2.22.0"
\header {
  title = "Sweet Child O'Mine"
  composer = "Guns N' Roses"
}
\layout {
}

intro-guitar =  {
  \compressMMRests {
    <>_\markup { \italic "Guitar solo..." }
    \override MultiMeasureRest.expand-limit = #1 R1*8  }
    \bar "||"
  }

intro-drums = \drummode {
  \repeat percent 3 <<
    {
      cymca4^> hh4 4 8 cymr16 16
      cymr4 hh4 4 8 cymr16 16
    } \\ {
      bd1~
      1
    }
  >>
  {
    \stemUp {
      <cymca bd>8 \repeat unfold 7 <tomfh bd>
      \repeat unfold 4 <tomfh bd> } <<
        {
          tomfh4 \grace sn8 sn4
        } \\
        {
          r8 bd4 bd8
        }
      >>
  }
  \bar "||"
}

intro = {
  \intro-guitar
  \intro-drums
}

A-h = \drummode {
  hh4 <hh sn> hh <hh sn>
                }
A-f = \drummode {
  bd4. 8 4. 8
}

       A-p = << \A-h \\ \A-f >>
A-fill = \drummode << {
    hh8 <hh sn>8 hh8 8 <sn cymca>4 4
       } \\ {
         bd4. 8~ 8 4 8
       }
  >>

A = \drummode {
  \repeat percent 3 \A-p
  << \A-h \\ { bd4. 8 8 4 8 } >>
  \repeat percent 3 \A-p
  \A-fill \bar "||"
  \repeat percent 7 \A-p
  \A-fill
}

\new DrumStaff {
  \time 4/4
  \tempo 4 = 120
  \intro
  \A
}
