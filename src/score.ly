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
      <cymca sn>8^> <sn tomfh bd>\< \repeat unfold 6 <sn tomfh bd>
      \repeat unfold 3 <sn tomfh bd> <sn tomfh bd>\! } <<
        {
          <sn tomfh>4 \grace sn8 sn4
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

A-h = \drummode { hh4 <hh sn> hh <hh sn> }
A-f = \drummode { bd4. 8 4. 8 }
A-p = << \A-h \\ \A-f >>
A-fill = \drummode <<
  {
    hh8 <hh sn>8 hh8 8 <sn cymca>4 4
  } \\ {
    bd4. 8~ 8 4 8
  }
>>
A.1 = \drummode {
  \repeat percent 3 \A-p
  << \A-h \\ { bd4. 8 8 4 8 } >>
  \repeat percent 3 \A-p
  \A-fill \bar "||"
}
A.2 = \drummode {
  \repeat percent 7 \A-p
  \A-fill \bar "||"
}
B = \drummode {
  << { r4 sn8 cymca8~ 4 <hh sn>8 hh8 } \\ { bd4. 8~ 8 4. } >>
  << { cymca4 sn8 cymca8~ 4 <hh sn>4 } \\ { bd4. 8~ 8 4 8 } >>
  << { cymca4 <hh sn> cymr8 8 8 8 } \\ \A-f >>
  << { \repeat unfold 8 cymr8 } \\ \A-f >>
  << { cymca4 sn8 cymca8~ 4 <hh sn>8 hh8 } \\ { bd4. 8~ 8 4. } >>
  << { cymca4 sn8 cymca8~ 4 <hh sn>4 } \\ { bd4. 8~ 8 4 8 } >>
  << { cymca4 <hh sn> cymr8 8 8 8 } \\ \A-f >>
  << { cymr8 8 8 8 8 <cymca sn>8 4 } \\ { bd4. 8 4 r } >> \bar "||"
}

\new DrumStaff {
  \time 4/4
  \tempo 4 = 120
  \intro
  \A.1
  \A.2
  \B
}
