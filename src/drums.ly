intro-guitar =  {
  \compressMMRests {
    <>_\markup { \italic "Guitar solo..." }
    \override MultiMeasureRest.expand-limit = #1
    R1*8
  }
}
build-up = \drummode {
  \stemUp {
      <cymc sn>8^> <sn tomfh bd>\< \repeat unfold 6 <sn tomfh bd>
      \repeat unfold 3 <sn tomfh bd> <sn tomfh bd>\! } <<
        {
          <sn tomfh>4 \grace sn8 sn4^>
        } \\
        {
          r8 \tag #'intro { bd4 bd8 } \tag #'pre-solo { bd4. }
        }
      >>
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
  \keepWithTag #'intro \build-up
}

intro = {
  \intro-guitar
  \bar "||"
  \intro-drums
}

A = \drummode {
  \tagGroup #'(a-first-six a-pre-fill a-fill)
  \tagGroup #'(a-first-round a-second-round)
  \tag #'a-first-six <<
    \repeat percent 6 << { hh4 <hh sn>^> hh <hh sn>^> } \\ { bd4. bd8 bd4. bd 8 } >>
    \new DrumVoice { \voiceFour \magnifyMusic #2/3 {
      s1*3
      \tag #'a-first-round {
        <>_\markup \italic { first time }
      }
      \tag #'a-second-round {
        <>_\markup \italic { second time }
      }
      { bd4. 8 8 4 8 }
    }}
  >>
  \tag #'a-pre-fill
    \tag #'a-first-round << { hh4 <hh sn>^> cymr8 8 <cymr sn> cymr } \\ { bd4. 8 <bd hhp>4 hhp } >>
    \tag #'a-second-round << { hh4 <hh sn>^> hh4 <hh sn>^> } \\ { bd4. 8 2 } >>
  \tag #'a-fill
    \tag #'a-first-round << { cymr8 <cymc sn>8^> cymr8 8 <sn cymc>4^> 4^> } \\ { <bd hhp>4. bd8~ 8 4 8 } >>
    \tag #'a-second-round << { hh8 <cymc sn>8^> hh8 8 <sn cymc>4^> 4^> } \\ { bd4. bd8~ 8 4 8 } >>
}
B = \drummode {
  \tagGroup #'(b-first-six b-last-two)
  \tagGroup #'(b-first-round b-second-round)
  \tag #'b-first-six {
    << { cymc4 sn8 cymc8~ 4 <hh sn>8 hh8 } \\ { bd4. 8~ 8 4. } >>
    << { cymc4 sn8 cymc8~ 4 <hh sn>4 } \\
         \tag #'b-first-round { bd4. 8~ 8 4 8 }
         \tag #'b-second-round { bd4. 8~ 8 4. }
    >>
    << { cymc4 <cymr sn>8 cymr8 8 8 <cymr sn> cymr } \\ { bd4 hhp8 bd8 <bd hhp>4 hhp8 bd8 } >>
    << \repeat unfold 2 { cymr8 8 <cymr sn> cymr } \\
       { <bd hhp>4 hhp8 bd8 <bd hhp>4 hhp } \\
       \tag #'b-second-round {
         \voiceFour
         \magnifyMusic #2/3 {
           s2
           <>_\markup \italic { second time }
           \override NoteColumn.force-hshift = #1.0 <bd hhp>8 bd hhp bd
         }
       }
    >>
    << { cymc4 sn8 cymc8~ 4 <hh sn>8 hh8 } \\ { bd4. 8~ 8 4. } >>
    << { cymc4 sn8 cymc8~ 8 hh8 <hh sn>4 } \\ { bd4. 8~ 8 4. } >>
  }
  \tag #'b-last-two {
    << { cymc4 <cymr sn>8 cymr8 8 8 <cymr sn> cymr } \\ { bd4 hhp8 bd8 <bd hhp>4 hhp8 bd8 } >>
    << { cymr8 8 <cymr sn> cymr 8 8 <cymc sn>8 4} \\ { <bd hhp>4 hhp8 bd8 <bd hhp>4 r } >>
  }
}
InstruOne = \drummode {
  << { cymc4 <cymr sn>8 cymr8 8 8 <cymr sn> cymr } \\ { <bd hhp>4 hhp <bd hhp> hhp8 bd } >>
  \repeat percent 2 << { cymr8 8 <cymr sn> cymr8 8 8 <cymr sn>8 cymr8 } \\ { <bd hhp>4 hhp <bd hhp> hhp8 bd } >>
  \repeat percent 3 << { cymr8 8 <cymr sn> cymr8 8 8 <cymr sn>8 cymr8 } \\ { <bd hhp>4 hhp8 bd <bd hhp>4 hhp } >>
  << { cymr8 8 <cymr sn> cymr8 8 8 <cymr sn>8 cymr8 } \\ { <bd hhp>4 hhp8 bd <bd hhp>4 hhp8 bd } >>
  \keepWithTag #'a-first-round \keepWithTag #'a-fill \A
}
  
drumsMusic = \drummode {
  \intro
  \repeat volta 2 \keepWithTag #'a-first-round \A
  \keepWithTag #'b-first-round \B
  \bar "||"
  \InstruOne
  \repeat volta 2 \keepWithTag #'a-second-round \A
  \repeat volta 2 \keepWithTag #'b-second-round \keepWithTag #'b-first-six \B
  \alternative {
    \keepWithTag #'b-last-two \B
    \keepWithTag #'pre-solo \build-up
  }
}
