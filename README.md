#fantasy

spriteTextureHandler holds:

  - the sprite sheet texture
  - quad sequences in the form of spriteQuadSequence
  - a timer

spriteTextureHandler can:

  - draw to the screen
  - be set to a spriteQuadSequence
  - increment frame

spriteQuadSequence holds:

  - quads in an animation sequence
  - number of quads
  - loop/oneshot
  - the current quad

spriteQuadSequence can:

  - config for reverse/loop/oneshot/remove from tail


TODO:

  - make motion sick to frame rate also! (stop the bat from bluring)
