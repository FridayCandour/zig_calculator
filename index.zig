const std = @import("std");
const print = std.debug.print;
const ct = @import("constants.zig");

fn ask_user(stdin: *const std.fs.File) !i64 {
    var buf: [20]u8 = undefined;
    const len = stdin.*.read(&buf) catch |err| {
        print("Error while reading number: {}\n", .{err});
        std.os.exit(1);
    };

    if (len == buf.len) {
        print("Input is too big!\n", .{});
        std.os.exit(1);
    }

    const line = std.mem.trimRight(u8, buf[0..len], "\r\n");
    const val = std.fmt.parseInt(i64, line, 10) catch |err| {
        print("Hey! That's a wrong input  {} ", .{err});
        std.os.exit(1);
    };
    print("you inputed  {} \n", .{val});
    return val;
}

fn ask_operation(stdin: *const std.fs.File) !i64 {
    var buf: [1]u8 = undefined;
    _ = stdin.*.read(&buf) catch |err| {
        print("Error while getting operation value trt again: {}\n", .{err});
        std.os.exit(1);
    };
    return buf[0];
}

pub fn main() !void {
    const stdin = std.io.getStdIn();
    // explanations
    print("All your maths are belong to us \n \n ", .{});

    print("first step input the first value: \n ", .{});

    print("second step the second value for the operation: \n ", .{});

    print("third step input an operation * + - / % \n \n \n ", .{});

    print("A number please: ", .{});
    var a: i64 = try ask_user(&stdin);

    print("A number please: ", .{});
    var b: i64 = try ask_user(&stdin);

    print("An operation please: ", .{});
    var c = try ask_operation(&stdin);

    if (c == 43) {
        print("runnning operation: +  \n", .{});
        var sol: i64 = a + b;
        print("the solution is :  {} \n \n \n ", .{sol});
    }

    if (c == 45) {
        print("runnning operation: -  \n", .{});
        var sol: i64 = a - b;
        print("the solution is :  {} \n \n \n ", .{sol});
    }

    if (c == 42) {
        print("runnning operation: *  \n", .{});
        var sol: i64 = a * b;
        print("the solution is :  {} \n \n \n ", .{sol});
    }

    if (c == 47) {
        print("runnning operation: /  \n", .{});
        var sol: i64 = @divExact(a, b);
        print("the solution is :  {} \n \n \n ", .{sol});
    }

    if (c == 37) {
        print("runnning operation: %  \n", .{});
        var sol: i64 = @mod(a, b);
        print("the solution is :  {} \n \n \n ", .{sol});
    }

    print(" calculator exited with operation code {} \n", .{c});
}
