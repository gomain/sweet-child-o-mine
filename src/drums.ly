intro-guitar =  {
  \compressMMRests {
    <>_\markup { \italic "Guitar solo..." }
    \override MultiMeasureRest.expand-limit = #1 R1*8  }
    \bar "||"
  }

intro-drums = \drummode {
  \repeat percent 3 <<
    {
      cymc4^> hh4 4 8 \tuplet 3/2 { cymr16 16 16 }
      cymr4 hh4 4 4
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
APreFill = \drummode << { hh4 <hh sn>^> cymr8 8 <cymr sn>8^> cymr } \\ { bd4. 8 2 } >>
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
A = \drummode <<
  {
    \repeat percent 6 \A-p
    \A-fill
  }
  \new DrumVoice { \voiceFour \magnifyMusic #2/3 {
    s1*3
    \tag #'first-round {
      <>_\markup \italic { first time }
    }
    \tag #'second-round {
      <>_\markup \italic { second time }
    }
    bd4. 8 8 4 8

  }}
>>
BFirstSix = \drummode {
  << { cymc4 sn8 cymc8~ 4 <hh sn>8 hh8 } \\ { bd4. 8~ 8 4. } >>
  \tag #'first-round << { cymc4 sn8 cymc8~ 8 hh8 <hh sn>4 } \\ { bd4. 8~ 8 4 8 } >>
  \tag #'second-round << { cymc4 sn8 cymc8~ 8 hh8 <hh sn>4 } \\ { bd4. 8~ 8 4. } >>
  << { cymc4 <hh sn>8 hh cymr8 8 <cymr sn> cymr } \\ \A-f >>
  << \repeat unfold 2 { cymr8 8 <cymr sn> cymr } \\
     { bd4. 8 2 } \\
     \tag #'second-round {
       \voiceFour
       \magnifyMusic #2/3 {
         s2
         <>_\markup \italic { second time }
         bd8 4 8
       }
     }
  >>
  << { cymc4 sn8 cymc8~ 4 <hh sn>8 hh8 } \\ { bd4. 8~ 8 4. } >>
  << { cymc4 sn8 cymc8~ 8 hh8 <hh sn>4 } \\ { bd4. 8~ 8 4. } >>
}
BLastTwo = \drummode {
  \tag #'normal {
    << { cymc4 <hh sn>8 hh cymr8 8 <cymr sn> cymr } \\ \A-f >>
    << { cymr8 8 <cymr sn> cymr 8 8 <cymc sn>8 4} \\ { bd4. 8 4 r } >>
  }
  \tag #'pre-solo {
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
B = {
  \BFirstSix
  \BLastTwo
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

drumsMusic = \drummode {
  \intro
  \repeat volta 2 \keepWithTag #'first-round \A
  \keepWithTag #'(first-round normal) \B
  \bar "||"
  \InstruOne
  \repeat volta 2 \keepWithTag #'second-round \A
  \repeat volta 2 \keepWithTag #'second-round \BFirstSix
  \alternative {
    \keepWithTag #'normal \BLastTwo
    \keepWithTag #'pre-solo \BLastTwo
  }
}
