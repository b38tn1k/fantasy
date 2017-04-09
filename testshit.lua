local lg = love.graphics
dirtmap = { 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
              10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
              10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
              10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
              10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
              10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
              10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
              10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
              10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
              10, 10, 10, 10, 10, 10, 10, 10, 10, 10}

topdirtmap = {
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 2, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 2, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 1, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 2, 25, 25, 25, 25, 25, 25, 1, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25
              }
grassmap = { 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
              10, 10, 7, 13, 10, 10, 10, 10, 10, 10,
              10, 10, 16, 4, 10, 10, 10, 10, 10, 10,
              10, 10, 16, 4, 10, 10, 10, 10, 10, 10,
              10, 10, 16, 4, 10, 10, 7, 11, 13, 10,
              10, 10, 16, 4, 10, 10, 16, 25, 4, 10,
              10, 10, 16, 4, 10, 10, 8, 9, 14, 10,
              10, 10, 16, 4, 10, 10, 10, 10, 10, 10,
              10, 10, 8, 14, 10, 10, 10, 10, 10, 10,
              10, 10, 10, 10, 10, 10, 10, 10, 10, 10}

topgrassmap = {
              1, 25, 25, 25, 25, 25, 25, 25, 25, 25,
              25, 25, 25, 25, 25, 2, 25, 25, 25, 25,
              25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
              25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
              25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
              25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
              25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
              25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
              25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
              25, 25, 25, 25, 25, 25, 25, 25, 25, 25
            }

tile0 = tiler.create(assets.terrainTextures.dirt, 32, 32)
dirtTest = tile0:getCanvasFromBlockMap(10, 10, dirtmap)
topDirtTest = tile0:getCanvasFromBlockMap(10, 10, topdirtmap)
tile1 = tiler.create(assets.terrainTextures.grass, 32, 32)
terrainTest = tile1:getCanvasFromBlockMap(10, 10, grassmap)
topGrassTest = tile1:getCanvasFromBlockMap(10, 10, topgrassmap)
tile3 = tiler.create(assets.itemTextures.treetop, 96, 96)
tree = tile3:getCanvasFromBlockMap(1, 1, {1})
tile4 = tiler.create(assets.itemTextures.trunk, 96, 96)
trunk = tile4:getCanvasFromBlockMap(1, 1, {1})

canvas = lg.newCanvas(500, 500)
lg.setCanvas(canvas)
lg.draw(dirtTest, 128, 128)
lg.draw(terrainTest, 128, 128)
lg.draw(topDirtTest, 128, 128)
lg.draw(topGrassTest, 128, 128)
lg.draw(trunk, 160, 160)
lg.draw(tree, 160, 96)
lg.setCanvas()

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
