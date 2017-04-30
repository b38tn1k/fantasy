test1 = animator.create(assets.spriteTextures.princess, 64, 64, timer.create(0.2))
test1:setCurrentSequence(LPC.walk.right)
config = {}
config7 = {}
config7["ONESHOT"] = false
config7["RETROGRADE"] = false
config7["REMOVE_FROM_TAIL"] = 2
config[LPC.walk.right] = config7
test1:configureSpriteSheet(config)
test1:setFrameDuration(0.2)

test2 = animator.create(assets.spriteTextures.bat, 32, 32, timer.create(0.2))
test2:setCurrentSequence(1)
test2:setFrameDuration(0.2)

batMotion = motion.create(timer.create(0.2))
batMotion:init(300 + 50*math.sin(0), 200 + 50*math.cos(0))
