const Self = @This();

const std = @import("std");
const apprt = @import("../../apprt.zig");
const CoreSurface = @import("../../Surface.zig");
const ApprtApp = @import("App.zig");
const Application = @import("class/application.zig").Application;
const Surface = @import("class/surface.zig").Surface;

/// The GObject Surface
surface: *Surface,

pub fn deinit(self: *Self) void {
    _ = self;
}

pub fn core(self: *Self) *CoreSurface {
    // This asserts the non-optional because libghostty should only
    // be calling this for initialized surfaces.
    return self.surface.core().?;
}

pub fn rtApp(self: *Self) *ApprtApp {
    _ = self;
    return Application.default().rt();
}

pub fn close(self: *Self, process_active: bool) void {
    _ = self;
    _ = process_active;
}

pub fn shouldClose(self: *Self) bool {
    _ = self;
    return false;
}

pub fn getTitle(self: *Self) ?[:0]const u8 {
    _ = self;
    return null;
}

pub fn getContentScale(self: *const Self) !apprt.ContentScale {
    return self.surface.getContentScale();
}

pub fn getSize(self: *const Self) !apprt.SurfaceSize {
    return self.surface.getSize();
}

pub fn getCursorPos(self: *const Self) !apprt.CursorPos {
    _ = self;
    return .{ .x = 0, .y = 0 };
}

pub fn clipboardRequest(
    self: *Self,
    clipboard_type: apprt.Clipboard,
    state: apprt.ClipboardRequest,
) !void {
    _ = self;
    _ = clipboard_type;
    _ = state;
}

pub fn setClipboardString(
    self: *Self,
    val: [:0]const u8,
    clipboard_type: apprt.Clipboard,
    confirm: bool,
) !void {
    _ = self;
    _ = val;
    _ = clipboard_type;
    _ = confirm;
}

pub fn defaultTermioEnv(self: *Self) !std.process.EnvMap {
    return try self.surface.defaultTermioEnv();
}
