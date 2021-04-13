intro-guitar =  {
  \compressMMRests {
    <>_\markup \italic { Guitar solo... }
    \override MultiMeasureRest.expand-limit = #1
    R1*8
  }
}
build-up = \drummode {
  \stemUp <cymc sn>8^> <sn tomfh bd>\< \repeat unfold 6 <sn tomfh bd>
  {
    \tag #'(intro pre-solo solo) { \repeat unfold 4 <sn tomfh bd> }
    \tag #'outtro << { <tomh toml>4 4 } \\ { bd8 8 8 8 } >>
  }\!
  <<
    {
      \tag #'(intro pre-solo) { <sn tomfh>4 \grace sn8 sn4^> }
      \tag #'solo { <sn tomfh>8 8 \grace sn8 sn4^> }
      \tag #'outtro { \grace sn8 sn4^> \grace sn8 sn4^> }
    } \\
    {
      \tag #'(intro outtro) { r8 bd4 bd8 }
      \tag #'pre-solo { r8 bd4. }
      \tag #'solo { r4. bd8 }
    }
  >>
}
intro-drums = \drummode {
  \repeat percent 3 <<
    {
      cymc2..^>  \tuplet 3/2 { cymr16 16 16 }
      cymr1
    } \\ {
      <bd hhp>4 hhp4 4 4
      4 4 4 4
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
  <>_\markup \italic { Guitar solo... }
  << { cymc4 <cymr sn>8 cymr8 8 8 <cymr sn> cymr } \\ { <bd hhp>4 hhp <bd hhp> hhp8 bd } >>
  \repeat percent 2 << { cymr8 8 <cymr sn> cymr8 8 8 <cymr sn>8 cymr8 } \\ { <bd hhp>4 hhp <bd hhp> hhp8 bd } >>
  \repeat percent 3 << { cymr8 8 <cymr sn> cymr8 8 8 <cymr sn>8 cymr8 } \\ { <bd hhp>4 hhp8 bd <bd hhp>4 hhp } >>
  << { cymr8 8 <cymr sn> cymr8 8 8 <cymr sn>8 cymr8 } \\ { <bd hhp>4 hhp8 bd <bd hhp>4 hhp8 bd } >>
  \keepWithTag #'a-first-round \keepWithTag #'a-fill \A
}
Solo = \drummode {
  <>_\markup \italic { Guitar solo... }
  \repeat percent 3 << { cymc4 sn8 cymc8~ 8 cymr8 <cymr sn>8 cymr8 } \\ { bd4. 8~ 8 4. } >>
  << { <cymc cymr>8 cymr8 sn cymc cymr8 8 <cymr sn>8 cymr8 } \\ { bd4. 8~ 8 4. } >>
  \repeat percent 4 << { <cymc cymr>8 cymr8 <cymr sn> <cymc cymr> cymr8 8 <cymr sn>8 cymr8 } \\ { bd4. 8~ 8 4. } >>
  \bar "||"
  \repeat percent 7 << { <cymc cymr>8 cymr8 <cymr sn> <cymc cymr> cymr8 8 <cymr sn>8 cymr8 } \\ { bd4. 8~ 8 4. } >>
  \keepWithTag #'solo \build-up
  \set Score.repeatCommands = #'(start-repeat (volta "1.-4."))
  << { cymc4 sn8 cymc8~ 8 cymr8 <cymr sn>8 cymr8 } \\ { bd4. 8~ 8 4. } >>
  \repeat percent 2 << { <cymc cymr>8 cymr8 <cymr sn> <cymc cymr> cymr8 8 <cymr sn>8 cymr8 } \\ { bd4. 8~ 8 4. } >>
  << { <cymc cymr>8 cymr8 <cymr sn> cymr cymc4 4 } \\ { bd2 4 4 } >>
  \set Score.repeatCommands = #'(end-repeat (volta #f))
}
WhereDoWeGo = \drummode {

    << { hh8 8 ss hh8 8 8 <hh ss> hh } \\ { bd4. 8~ 2 } >>
    << { hh4 <hh ss>8 hh8 8 8 <hh ss> hh } \\ { bd4. 8~ 2 } >>
    << { hh4 <hh ss>8 hh8 8 8 <hh ss> hh } \\ { bd4. 8~ 2 } >>
    << { hh8 8 <hh ss>4 hh4  <hh ss>4 } \\ { r8 bd4 8 2 } >>

    << { hh4 ss8 hh8 8 8 <hh ss> hh } \\ { bd4. 8~ 2 } >>
    << { hh4 <hh ss>8 hh8 8 8 <hh ss>4 } \\ { bd4. 8~ 2 } >>
    << { hh4 <hh ss>4 r8 hh8  <hh ss>8 hh8 } \\ { bd4. 8~ 2 } >>
    << { hh8 8 <hh ss>4 hh8 8  <hh ss>4 } \\ { r8 bd4 8 2 } >>

    << { hh8 8 ss hh8 8 8 sn^> hh } \\ { bd4. 8~ 2 } >>
    << { hh4 <hh ss>4 hh8 8 sn4^>  } \\ { bd4. 8~ 2 } >>
    << { hh8 8 <hh ss>4 hh8 8 sn^> hh } \\ { bd4. 8~ 2 } >>
    << { hh8 8 <hh ss>8 hh8 8 8  \grace sn8 8^> \grace 8 8^> } \\ { bd4. 8 2 } >>

    << { hh4 <hh sn> hh <hh sn> } \\ { bd4. 8~ 8 4. } >>
    << { hh4 <hh sn> hh <hh sn> } \\ { bd4. 8~ 8 4 8 } >>
    \keepWithTag #'outtro \build-up
}
Outtro = \drummode {
  \repeat volta 3 {
    \repeat percent 2 << { cymc4 sn8 cymc8~ 8 cymr8 <cymr sn>8 cymr8 } \\ { bd4. 8~ 8 4. } >>
  }
  \alternative {
    {
      << { cymc4 sn8 cymc8~ 8 cymr8 <cymr sn>8 cymr8 } \\ { bd4. 8~ 8 4. } >>
      << { cymc8 cymr8 <cymr sn> cymr cymc4 4 } \\ { bd2 4 4 } >>
    }
    {
      << { cymc4 sn8 cymc8~ 4 \grace sn 8 4^> } \\ { bd4. 8~ 8 4. } >>
      << \tuplet 3/2 2 { cymc4 hhho4 4 4 4 4 } \\ \tuplet 3/2 2 { bd4 4 4 4 4 4 } >>
    }
  }
  << { cymc4 sn8 cymc8~ 4 <hh sn>8 hh8 } \\ { bd4. 8~ 8 4. } >>
  << { cymc4 sn8 cymc8~ 4 \grace sn 8 4^> } \\ { bd4. 8~ 8 4 8 } >>
  << { cymc1 } \\ { <bd hhp>4 hhp4 4 4 } >>
  <>_\markup \bold \italic { rit... }
  << { cymc2 2 } \\ { <bd hhp>4 hhp <bd hhp> hhp } >>
  << { cymc1 \fermata } \\ { bd1 \fermata } >>
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
  \bar "||"
  \Solo
  \WhereDoWeGo
  \Outtro
  \bar "|."
}
