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


timer holds:
  - a time interval
  - a current time
  - an update flag
  - fire function

timer can:
  - set update flag to true based off time
  - set update flag to false once read for the first time

animationMotionHandler holds:
  - sprites current continuous position
  - update time
  - update interval

animationMotionHandler can:
  - update the sprites discrete (drawable) position
