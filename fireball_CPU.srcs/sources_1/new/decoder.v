`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// The Fireball CPU - Instruction Decoder
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



module decoder(
    input CLK100MHZ,       // 100MHz clock source from board oscillator
    input[7:0] instr,      // 8 bit opcode
    output enableALU,      // enable line for ALU
    output enableMulti,    // enable line for multiplier unit
    output enableMove,     // enable line for mem move unit
    output enableJump,     // enable line for jump (buffer to AGU)
    output jumpMode,       // high if jump (abs address), low if branch (PC+jump addr)
    output moveMode,       // high if to memory, low if from mem
    output immMode        // high if instruction uses immediate value  
    );
    
    //internal "Pre-Buffer" signals
    wire pb_enableMath, pb_enableMove, pb_enableALU, pb_enableMulti, pbEnableJump;
    
    // 2 to 4 line decoder for primary function bits (I6, I5)
    // No need to decode for NOP
    assign pb_enableMath = instr[6] & (~instr[5]);
    assign pb_enableMove = (~instr[6]) & instr[5];
    assign pb_enableJump = instr[6] & instr[5];
    
    // decode bit 1 to determine add/sub or multiplication
    assign pb_enableALU = pb_enableMath & (~instr[1]);
    assign pb_enableMulti = pb_enableMath & instr[1];
    
    // output buffers to execution stage
    always @(posedge CLK100MHZ) begin
        enableALU <= pb_enableALU;
        enableMulti <= pb_enableMulti;
        enableMove <= pb_enableMove;
        enableJump <= pb_enableJump;
    end
    
    // Prettify instruction bit names for code clarity
    assign immMode = instr[0];
    
endmodule
