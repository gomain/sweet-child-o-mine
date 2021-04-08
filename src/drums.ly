intro-guitar =  {
  \compressMMRests {
    <>_\markup { \italic "Guitar solo..." }
    \override MultiMeasureRest.expand-limit = #1 R1*8  }
    \bar "||"
  }

intro-drums = \drummode {
  \repeat percent 3 <<
    {
      cymc4^> hh4 4 8 cymr16 16
      cymr4 hh4 4 8 cymr16 16
    } \\ {
      bd1~
      1
    }
  >>
  {
    \stemUp {
      <cymc sn>8^> <sn tomfh bd>\< \repeat unfold 6 <sn tomfh bd>
      \repeat unfold 3 <sn tomfh bd> <sn tomfh bd>\! } <<
        {
          <sn tomfh>4 \grace sn8 sn4
        } \\
        {
          r8 bd4 bd8
        }
      >>
  }
}

intro = {
  \intro-guitar
  \intro-drums
}

A-h = \drummode { hh4 <hh sn>^> hh <hh sn>^> }
A-f = \drummode { bd4. 8 4. 8 }
A-p = << \A-h \\ \A-f >>
APreFill = \drummode << { hh4 <hh sn>^> cymr8 8 <cymr sn>8^> cymr } \\ \A-f >>
AFill = \drummode <<
  {
    cymr8 <cymc sn>8^> cymr8 8 <sn cymc>4^> 4^>
  } \\ {
    bd4. 8~ 8 4 8
  }
>>

A-fill = {
  \APreFill
  \AFill
}
A = \drummode {
  \repeat percent 6 \A-p 
  \A-fill
}
B = \drummode {
  << { r4 sn8 cymc8~ 4 <hh sn>8 hh8 } \\ { bd4. 8~ 8 4. } >>
  << { cymc4 sn8 cymc8~ 8 hh8 <hh sn>4 } \\ { bd4. 8~ 8 4 8 } >>
  << { cymc4 <hh sn>8 hh cymr8 8 <cymr sn> cymr } \\ \A-f >>
  << \repeat unfold 2 { cymr8 8 <cymr sn> cymr } \\ \A-f >>
  << { cymc4 sn8 cymc8~ 4 <hh sn>8 hh8 } \\ { bd4. 8~ 8 4. } >>
  << { cymc4 sn8 cymc8~ 8 hh8 <hh sn>4 } \\ { bd4. 8~ 8 4 8 } >>
  << { cymc4 <hh sn>8 hh cymr8 8 <cymr sn> cymr } \\ \A-f >>
  << { cymr8 8 <cymr sn> cymr 8 8 <cymc sn>8 4} \\ { bd4. 8 4 r } >>
}
InstruOneHandsHalfBar = \drummode { cymr8 8 <cymr sn> cymr }
InstruOneHands = \drummode { \repeat unfold 2 \InstruOneHandsHalfBar }
InstruOneFeet = \drummode { bd2 4. 8 }
InstruOnePattern = << \InstruOneHands \\ \InstruOneFeet >>
InstruOne = \drummode {
  << { cymc8 cymr8 <cymr sn> cymr \InstruOneHandsHalfBar } \\ \InstruOneFeet >>
  \repeat percent 2 \InstruOnePattern
  \repeat percent 3 << \InstruOneHands \\ { bd4. 8 2 } >>
  << \InstruOneHands \\ \A-f >>
  \AFill
}

drumsMusic = \displayMusic \drummode {
  \intro
  \repeat volta 2 << \A \\
    \new DrumVoice \with { fontSize = #-3 } {
      s1*3
      { \voiceTwo bd4._\markup \italic { first round } 8 8 4 8 }
    }
  >>
  \B \bar "||"
  \InstruOne
  \repeat volta 2 \A
  \repeat valto 2 \B
}
