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

intro-drums = {
  \repeat percent 3 <<
    \new DrumVoice { \stemUp \drummode {
      cymca4^> hh4 4 8 cymr16 16
      cymr4 hh4 4 8 cymr16 16
    }}
    \new DrumVoice { \stemDown \drummode {
      bd1~
      1
    }}
  >>
  \new DrumVoice { \stemUp \drummode {
    <cymca bd>8 \repeat unfold 7 <tomfh bd>
    \repeat unfold 4 <tomfh bd> <<
      \drummode {
        tomfh4 \grace sn8 sn4
      }
      \new DrumVoice { \stemDown \drummode {
        r8 bd4 bd8
      }}
    >>
  }}
  \bar "||"
}

intro = {
  \intro-guitar
  \intro-drums
}


\new DrumStaff {
  \time 4/4
  \tempo 4 = 120
  \intro
}
