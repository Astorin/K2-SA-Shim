local flib_table = require("__flib__.table")

local item_sounds = require("__base__.prototypes.item_sounds")
local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local tile_sounds = require("__k2-sa-shim__.tile-sounds")

require("__k2-sa-shim__.mech-armor-animations")

-- Required to load space-travel feature flag without space age
if not data.raw.tile["empty-space"] then
    local empty_space = table.deepcopy(data.raw.tile["out-of-map"])
    empty_space.name = "empty-space"
    data:extend { empty_space }
end

function turnIntoMechArmor(armor)
    armor.provides_flight = true
    armor.takeoff_sound = {
        filename = "__k2-sa-shim__/sound/mech-armor-takeoff.ogg",
        volume = 0.2,
        aggregation = {
            max_count = 2,
            remove = true,
            count_already_playing = true
        }
    }
    armor.landing_sound = {
        filename = "__k2-sa-shim__/sound/mech-armor-land.ogg",
        volume = 0.3,
        aggregation = {
            max_count = 2,
            remove = true,
            count_already_playing = true
        }
    }
    armor.flight_sound = {
        sound = {
            filename = "__k2-sa-shim__/sound/mech-armor-flight.ogg",
            volume = 0.2
        }
    }
    armor.steps_sound = sound_variations("__k2-sa-shim__/sound/mech-armor-steps-metallic", 5, 0.2)
    armor.moving_sound = sound_variations("__k2-sa-shim__/sound/mech-armor-moves", 10, 0.4)
    armor.collision_box = { { -0.25, -0.25 }, { 0.25, 0.25 } }
    armor.drawing_box = { { -0.4, -2 }, { 0.4, 0 } }
    armor.open_sound = { filename = "__base__/sound/armor-open.ogg", volume = 1 }
    armor.close_sound = { filename = "__base__/sound/armor-close.ogg", volume = 1 }
    armor.weight = 1 * tons
end

data:extend {
    smoke_animations.trivial_smoke {
        name = "mech-armor-smoke",
        color = { r = 0.5, g = 0.5, b = 0.5, a = 0.5 },
        duration = 50,
        spread_duration = 50,
        fade_in_duration = 10,
        fade_away_duration = 40,
        start_scale = 0.1,
        end_scale = 0.3
    }
}

turnIntoMechArmor(data.raw.armor["kr-power-armor-mk3"])
turnIntoMechArmor(data.raw.armor["kr-power-armor-mk4"])

data.raw.armor["kr-power-armor-mk3"].icon = "__k2-sa-shim__/graphics/icons/mech-armor.png"
data.raw.armor["kr-power-armor-mk4"].icon = "__k2-sa-shim__/graphics/icons/mech-armor-mk2.png"

-- add stacking to superior inserter tech
-- flib_table.insert(data.raw.technology["kr-superior-inserters"].effects, {
--     type = "belt-stack-size-bonus",
--     modifier = 3
-- })

-- add stacking to superior loader
data.raw["loader-1x1"]["kr-superior-loader"].max_belt_stack_size = 4
data.raw["loader-1x1"]["kr-superior-loader"].adjustable_belt_stack_size = true

-- add stacking to superior inserter
data.raw.inserter["kr-superior-inserter"].grab_less_to_match_belt_stack = true
data.raw.inserter["kr-superior-inserter"].wait_for_full_hand = false
data.raw.inserter["kr-superior-inserter"].max_belt_stack_size = 4

-- add stacking to superior long inserter
data.raw.inserter["kr-superior-long-inserter"].grab_less_to_match_belt_stack = true
data.raw.inserter["kr-superior-long-inserter"].wait_for_full_hand = false
data.raw.inserter["kr-superior-long-inserter"].max_belt_stack_size = 4

data.raw.tile["water-shallow"].landing_steps_sound = tile_sounds.landing.wet
data.raw.tile["grass-1"].landing_steps_sound = tile_sounds.landing.grass
data.raw.tile["grass-2"].landing_steps_sound = tile_sounds.landing.grass
data.raw.tile["grass-3"].landing_steps_sound = tile_sounds.landing.grass
data.raw.tile["grass-4"].landing_steps_sound = tile_sounds.landing.grass
data.raw.tile["dry-dirt"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-1"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-2"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-3"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-4"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-5"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-6"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-7"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["sand-1"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["sand-2"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["sand-3"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["red-desert-0"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["red-desert-1"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["red-desert-2"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["red-desert-3"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["nuclear-ground"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["stone-path"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["lab-dark-1"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["lab-dark-2"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["lab-white"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["tutorial-grid"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["concrete"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["hazard-concrete-left"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["hazard-concrete-right"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["refined-concrete"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["refined-hazard-concrete-left"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["refined-hazard-concrete-right"].landing_steps_sound = tile_sounds.landing.concrete