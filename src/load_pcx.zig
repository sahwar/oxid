const std = @import("std");
const HunkSide = @import("zigutils").HunkSide;
const image = @import("zigutils").image;
const pcx = @import("zig-pcx");

pub const LoadPcxError = error{
  PcxLoadFailed,
  EndOfStream,
  OutOfMemory,
};

pub fn loadPcx(
  hunk_side: *HunkSide,
  comptime filename: []const u8,
  transparent_color_index: ?u8,
) LoadPcxError!*image.Image {
  const filedata = @embedFile(filename);

  var slice_stream = std.io.SliceInStream.init(filedata);
  var stream = &slice_stream.stream;
  const Loader = pcx.Loader(std.io.SliceInStream.Error);

  const preloaded = try Loader.preload(stream);
  const img = try image.createImage(&hunk_side.allocator, image.Info{
    .width = preloaded.width,
    .height = preloaded.height,
    .format = image.Format.RGBA,
  });
  try Loader.loadRGBA(stream, preloaded, transparent_color_index, img.pixels);

  return img;
}
