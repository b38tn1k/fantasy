I wanna refactor (already) and make it a bit more structured

spriteTextureHandler holds:
  - the sprite sheet texture
  - quad sequences in the form of spriteQuadSequence
  - a timer
spriteTextureHandler can:
  - draw to the screen
  - be set to a spriteQuadSequence
  - increment a spriteQuadSequence's current quad based on timer
spriteQuadSequence holds:
  - quads in an animation sequence
  - number of quads
  - loop/oneshot
  - the current quad
spriteQuadSequence can:
  - increment the current quad
  - config for reverse/loop/oneshot/remove from tail
