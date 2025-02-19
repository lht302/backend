// Generated by CIRCT firtool-1.61.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

// Standard header to adapt well known macros for prints and assertions.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

module RoundAnyRawFNToRecFN_1(
  input         io_in_isZero,	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16]
                io_in_sign,	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16]
  input  [8:0]  io_in_sExp,	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16]
  input  [64:0] io_in_sig,	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16]
  input  [2:0]  io_roundingMode,	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16]
  output [64:0] io_out,	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16]
  output [4:0]  io_exceptionFlags	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:57:16]
);

  wire        roundingMode_near_even = io_roundingMode == 3'h0;	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:89:53]
  wire        common_inexact = io_in_sig[10] | (|(io_in_sig[9:0]));	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:116:{26,60}, :163:40, :165:36]
  wire [54:0] roundedSig = (roundingMode_near_even | io_roundingMode == 3'h4) & io_in_sig[10] | (io_roundingMode == 3'h2 & io_in_sign | io_roundingMode == 3'h3 & ~io_in_sign) & common_inexact ? {1'h0, io_in_sig[64:11]} + 55'h1 & {54'h3FFFFFFFFFFFFF, ~(roundingMode_near_even & io_in_sig[10] & ~(|(io_in_sig[9:0])))} : {1'h0, io_in_sig[64:12], io_in_sig[11] | io_roundingMode == 3'h6 & common_inexact};	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:89:53, :91:53, :92:53, :93:53, :94:53, :97:{27,42,63,66}, :105:31, :115:66, :116:{26,60}, :163:40, :165:36, :168:{38,67}, :169:31, :170:29, :172:16, :173:{49,57}, :174:{21,25,64}, :175:30, :176:35, :179:47, :180:42]
  assign io_out = {io_in_sign, {{3{io_in_sExp[8]}}, io_in_sExp} + {10'h0, roundedSig[54:53]} + 12'h780 & ~(io_in_isZero ? 12'hE00 : 12'h0), io_in_isZero ? 52'h0 : roundedSig[51:0]};	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:103:25, :116:60, :172:16, :184:{40,54}, :190:27, :251:24, :252:{14,18}, :276:16, :277:16, :279:12, :280:16, :285:33]
  assign io_exceptionFlags = {4'h0, ~io_in_isZero & common_inexact};	// @[generators/hardfloat/hardfloat/src/main/scala/RoundAnyRawFNToRecFN.scala:165:36, :236:64, :239:43, :287:{53,66}]
endmodule

