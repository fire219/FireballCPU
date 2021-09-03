`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// The Fireball CPU - Main (Glue)
// 
// Created by Matthew Petry (fireTwoOneNine)
// firetwoonenine@gmail.com
// 
// Copyright © 2021 Matthew Petry
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//////////////////////////////////////////////////////////////////////////////////


module core(
    input CLK100MHZ,       // 100MHz clock from board osc
    input [31:0] data,     // 32 bit data bus
    output [17:0] address // 18 bit address bus 
);
 
 wire pb_enableMath, pb_enableMove, pb_enableALU, pb_enableMulti, pbEnableJump;
 
decoder decoder_imp (
    .instr(fetchedInstr[31:24]),
    .enableALU(enableALU),
    .enableMulti(enableMulti),
    .enableMove(enableMove),
    .enableJump(enableJump),
    .jumpMode(jumpMode),
    .moveMode(moveMode),
    .immMode(immMode),
    );
endmodule