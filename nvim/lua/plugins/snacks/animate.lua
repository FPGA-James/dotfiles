-- =============================================================================
-- lua/plugins/snacks/animate.lua
-- Shared animation engine used by scroll, indent, and dim.
-- You rarely need to touch this — it's a library module for other snacks.
-- =============================================================================
return {
  enabled = true,

  -- Frames per second for all animations.
  fps = 60,

  -- Default easing function applied when a module doesn't specify one.
  -- Available: "linear","inQuad","outQuad","inOutQuad","inCubic","outCubic",
  --            "inOutCubic","inQuart","outQuart","inOutQuart","inSine",
  --            "outSine","inOutSine","inExpo","outExpo","inOutExpo",
  --            "inCirc","outCirc","inOutCirc","inBack","outBack","inOutBack",
  --            "inBounce","outBounce","inOutBounce","inElastic","outElastic",
  --            "inOutElastic","spring"
  easing = "linear",

  -- Duration in milliseconds for the default animation.
  -- Individual modules override this with their own duration.
  duration = {
    step  = 20,   -- ms per animation step (for step-based animations)
    total = 300,  -- total ms for the full animation
  },
}
