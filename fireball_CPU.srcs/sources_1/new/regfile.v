`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// The Fireball CPU - Register File
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


module regfile(
    input CLK100MHZ,       // 100MHz clock source from board oscillator
    input[16:0] w_A,       // "w_" prefixed inputs are the write-in bus for registers (MSB is write enable)
    input[16:0] w_P,
    input[16:0] w_G0,
    input[16:0] w_G1,
    input[16:0] w_G2,
    input[16:0] w_G3,
    input[16:0] w_G4,
    input[16:0] w_G5,
    input[16:0] w_G6,
    input[16:0] w_G7,
    input[16:0] w_GJ,
    input[1:0] w_OF,
    input[16:0] w_PC,
    output[15:0] A,
    output[15:0] P,
    output[15:0] G0,
    output[15:0] G1,
    output[15:0] G2,
    output[15:0] G3,
    output[15:0] G4,
    output[15:0] G5,
    output[15:0] G6,
    output[15:0] G7,
    output[15:0] GJ,
    output OF,
    output[15:0] PC
    );


    always @(posedge CLK100MHZ) begin
        if (w_A[16]) w_A[15:0] <= A;
        if (w_P[16]) w_P[15:0] <= P;
        if (w_G0[16]) w_G0[15:0] <= G0;
        if (w_G1[16]) w_G1[15:0] <= G1;
        if (w_G2[16]) w_G2[15:0] <= G2;
        if (w_G3[16]) w_G3[15:0] <= G3;
        if (w_G4[16]) w_G4[15:0] <= G4;
        if (w_G5[16]) w_G5[15:0] <= G5;
        if (w_G6[16]) w_G6[15:0] <= G6;
        if (w_G7[16]) w_G7[15:0] <= G7;
        if (w_GJ[16]) w_GJ[15:0] <= GJ;
        if (w_G0[1]) w_G0[0] <= OF;
        if (w_PC[16]) w_PC[15:0] <= PC;
    end
endmodule