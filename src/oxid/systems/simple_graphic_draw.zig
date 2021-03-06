const Draw = @import("../../draw.zig");
const Gbe = @import("../../gbe.zig");
const GbeSystem = @import("../../gbe_system.zig");
const GameSession = @import("../game.zig").GameSession;
const Constants = @import("../constants.zig");
const C = @import("../components.zig");
const Prototypes = @import("../prototypes.zig");
const GameUtil = @import("../util.zig");
const Graphic = @import("../graphics.zig").Graphic;

const SystemData = struct{
  transform: *const C.Transform,
  phys: ?*const C.PhysObject,
  simple_graphic: *const C.SimpleGraphic,
};

pub const run = GbeSystem.build(GameSession, SystemData, think);

fn think(gs: *GameSession, self: SystemData) bool {
  _ = Prototypes.EventDraw.spawn(gs, C.EventDraw{
    .pos = self.transform.pos,
    .graphic = self.simple_graphic.graphic,
    .transform =
      if (self.simple_graphic.directional)
        if (self.phys) |phys|
          GameUtil.getDirTransform(phys.facing)
        else
          Draw.Transform.Identity
      else
        Draw.Transform.Identity,
    .z_index = self.simple_graphic.z_index,
  });
  return true;
}
