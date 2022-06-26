const std = @import("std");
/// Zig version. When writing code that supports multiple versions of Zig, prefer
/// feature detection (i.e. with `@hasDecl` or `@hasField`) over version checks.
pub const zig_version = std.SemanticVersion.parse("0.9.1") catch unreachable;
/// Temporary until self-hosted is feature complete.
pub const zig_is_stage2 = false;
/// Temporary until self-hosted supports the `cpu.arch` value.
pub const stage2_arch: std.Target.Cpu.Arch = .arm;
/// Temporary until self-hosted can call `std.Target.x86.featureSetHas` at comptime.
pub const stage2_x86_cx16 = false;

pub const output_mode = std.builtin.OutputMode.Exe;
pub const link_mode = std.builtin.LinkMode.Static;
pub const is_test = false;
pub const single_threaded = false;
pub const abi = std.Target.Abi.musl;
pub const cpu: std.Target.Cpu = .{
    .arch = .arm,
    .model = &std.Target.arm.cpu.cortex_a53,
    .features = std.Target.arm.featureSet(&[_]std.Target.arm.Feature{
        .aclass,
        .acquire_release,
        .aes,
        .crc,
        .crypto,
        .d32,
        .db,
        .dsp,
        .fp16,
        .fp64,
        .fp_armv8,
        .fp_armv8d16,
        .fp_armv8d16sp,
        .fp_armv8sp,
        .fpao,
        .fpregs,
        .fpregs64,
        .has_v4t,
        .has_v5t,
        .has_v5te,
        .has_v6,
        .has_v6k,
        .has_v6m,
        .has_v6t2,
        .has_v7,
        .has_v7clrex,
        .has_v8,
        .has_v8m,
        .hwdiv,
        .hwdiv_arm,
        .mp,
        .neon,
        .perfmon,
        .sha2,
        .thumb2,
        .trustzone,
        .v8a,
        .vfp2,
        .vfp2sp,
        .vfp3,
        .vfp3d16,
        .vfp3d16sp,
        .vfp3sp,
        .vfp4,
        .vfp4d16,
        .vfp4d16sp,
        .vfp4sp,
        .virtualization,
    }),
};
pub const os = std.Target.Os{
    .tag = .linux,
    .version_range = .{ .linux = .{
        .range = .{
            .min = .{
                .major = 4,
                .minor = 4,
                .patch = 146,
            },
            .max = .{
                .major = 4,
                .minor = 4,
                .patch = 146,
            },
        },
        .glibc = .{
            .major = 2,
            .minor = 19,
            .patch = 0,
        },
    }},
};
pub const target = std.Target{
    .cpu = cpu,
    .os = os,
    .abi = abi,
};
pub const object_format = std.Target.ObjectFormat.elf;
pub const mode = std.builtin.Mode.Debug;
pub const link_libc = false;
pub const link_libcpp = false;
pub const have_error_return_tracing = true;
pub const valgrind_support = false;
pub const position_independent_code = false;
pub const position_independent_executable = false;
pub const strip_debug_info = false;
pub const code_model = std.builtin.CodeModel.default;
