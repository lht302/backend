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

module INToRecFN_1(
  input         io_signedIn,	// @[generators/hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16]
  input  [63:0] io_in,	// @[generators/hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16]
  input  [2:0]  io_roundingMode,	// @[generators/hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16]
  output [64:0] io_out,	// @[generators/hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16]
  output [4:0]  io_exceptionFlags	// @[generators/hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16]
);

  wire         intAsRawFloat_sign = io_signedIn & io_in[63];	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:51:{29,34}]
  wire [63:0]  intAsRawFloat_absIn = intAsRawFloat_sign ? 64'h0 - io_in : io_in;	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:51:29, :52:{24,31}, :53:44]
  wire [5:0]   intAsRawFloat_adjustedNormDist =
    intAsRawFloat_absIn[63]
      ? 6'h0
      : intAsRawFloat_absIn[62]
          ? 6'h1
          : intAsRawFloat_absIn[61]
              ? 6'h2
              : intAsRawFloat_absIn[60] ? 6'h3 : intAsRawFloat_absIn[59] ? 6'h4 : intAsRawFloat_absIn[58] ? 6'h5 : intAsRawFloat_absIn[57] ? 6'h6 : intAsRawFloat_absIn[56] ? 6'h7 : intAsRawFloat_absIn[55] ? 6'h8 : intAsRawFloat_absIn[54] ? 6'h9 : intAsRawFloat_absIn[53] ? 6'hA : intAsRawFloat_absIn[52] ? 6'hB : intAsRawFloat_absIn[51] ? 6'hC : intAsRawFloat_absIn[50] ? 6'hD : intAsRawFloat_absIn[49] ? 6'hE : intAsRawFloat_absIn[48] ? 6'hF : intAsRawFloat_absIn[47] ? 6'h10 : intAsRawFloat_absIn[46] ? 6'h11 : intAsRawFloat_absIn[45] ? 6'h12 : intAsRawFloat_absIn[44] ? 6'h13 : intAsRawFloat_absIn[43] ? 6'h14 : intAsRawFloat_absIn[42] ? 6'h15 : intAsRawFloat_absIn[41] ? 6'h16 : intAsRawFloat_absIn[40] ? 6'h17 : intAsRawFloat_absIn[39] ? 6'h18 : intAsRawFloat_absIn[38] ? 6'h19 : intAsRawFloat_absIn[37] ? 6'h1A : intAsRawFloat_absIn[36] ? 6'h1B : intAsRawFloat_absIn[35] ? 6'h1C : intAsRawFloat_absIn[34] ? 6'h1D : intAsRawFloat_absIn[33] ? 6'h1E : intAsRawFloat_absIn[32] ? 6'h1F : intAsRawFloat_absIn[31] ? 6'h20 : intAsRawFloat_absIn[30] ? 6'h21 : intAsRawFloat_absIn[29] ? 6'h22 : intAsRawFloat_absIn[28] ? 6'h23 : intAsRawFloat_absIn[27] ? 6'h24 : intAsRawFloat_absIn[26] ? 6'h25 : intAsRawFloat_absIn[25] ? 6'h26 : intAsRawFloat_absIn[24] ? 6'h27 : intAsRawFloat_absIn[23] ? 6'h28 : intAsRawFloat_absIn[22] ? 6'h29 : intAsRawFloat_absIn[21] ? 6'h2A : intAsRawFloat_absIn[20] ? 6'h2B : intAsRawFloat_absIn[19] ? 6'h2C : intAsRawFloat_absIn[18] ? 6'h2D : intAsRawFloat_absIn[17] ? 6'h2E : intAsRawFloat_absIn[16] ? 6'h2F : intAsRawFloat_absIn[15] ? 6'h30 : intAsRawFloat_absIn[14] ? 6'h31 : intAsRawFloat_absIn[13] ? 6'h32 : intAsRawFloat_absIn[12] ? 6'h33 : intAsRawFloat_absIn[11] ? 6'h34 : intAsRawFloat_absIn[10] ? 6'h35 : intAsRawFloat_absIn[9] ? 6'h36 : intAsRawFloat_absIn[8] ? 6'h37 : intAsRawFloat_absIn[7] ? 6'h38 : intAsRawFloat_absIn[6] ? 6'h39 : intAsRawFloat_absIn[5] ? 6'h3A : intAsRawFloat_absIn[4] ? 6'h3B : intAsRawFloat_absIn[3] ? 6'h3C : intAsRawFloat_absIn[2] ? 6'h3D : {5'h1F, ~(intAsRawFloat_absIn[1])};	// @[generators/hardfloat/hardfloat/src/main/scala/primitives.scala:91:52, generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:52:24, :53:53, src/main/scala/chisel3/util/Mux.scala:50:70]
  wire [126:0] _intAsRawFloat_sig_T = {63'h0, intAsRawFloat_absIn} << intAsRawFloat_adjustedNormDist;	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:52:24, :56:22, src/main/scala/chisel3/util/Mux.scala:50:70]
  RoundAnyRawFNToRecFN_1 roundAnyRawFNToRecFN (	// @[generators/hardfloat/hardfloat/src/main/scala/INToRecFN.scala:59:15]
    .io_in_isZero      (~(_intAsRawFloat_sig_T[63])),	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:56:{22,41}, :62:{23,28}]
    .io_in_sign        (intAsRawFloat_sign),	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:51:29]
    .io_in_sExp        ({3'h2, ~intAsRawFloat_adjustedNormDist}),	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:64:{36,72}, src/main/scala/chisel3/util/Mux.scala:50:70]
    .io_in_sig         ({1'h0, _intAsRawFloat_sig_T[63:0]}),	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:52:31, :56:{22,41}, :65:20]
    .io_roundingMode   (io_roundingMode),
    .io_out            (io_out),
    .io_exceptionFlags (io_exceptionFlags)
  );
endmodule

