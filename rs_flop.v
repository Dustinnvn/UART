`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////// 
//
// File Name: rs_flop.v
// Project: Project 4-UART
// Created by <Dustin Nguyen> on <April 17th, 2020>
//
// In submitting this file for class work at CSULB
// I am confirming that this is my work and the work of no one else. 
// 
// In submitting this code I acknowledge that plagiarism in student project
// work is subject to dismissal from the class. 
////////////////////////////////////////////////////////////////////////////////

module rs_flop(clk, reset, r, s, Q);

	input      clk, reset, r,s;
	output reg Q;
	
	always @ (posedge clk, posedge reset)
		if(reset)
			Q <= 1'b0;
		else begin 
				casez({s,r})
				2'b00 : Q <= Q;
				2'b01 : Q <= 1'b0;
				2'b10 : Q <= 1'b1;
				2'b11 : Q <= 1'bz;
				default: Q <= 1'b0;
			endcase
		end 
endmodule 