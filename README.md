animationGroup holds:
  - the sprite sheet texture
  - quad sequences in the form of spriteQuadSequence
  - update time
  - update interval

animationGroup can:
  - draw to the screen
  - be set to a spriteQuadSequence
  - increment a spriteQuadSequence's current quad based on timer


animationSequence holds:
  - quads in an animation sequence
  - number of quads
  - loop/oneshot
  - the current quad

animationSequence can:
  - increment the current quad
  - config for reverse/loop/oneshot/remove from tail


animationMotionHandler holds:
  - sprites current position
  - update time
  - update interval

