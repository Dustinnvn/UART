`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////// 
//
// File Name: ld_reg.v
// Project: Project 4-UART
// Created by <Dustin Nguyen> on <April 17th, 2020>
//
// In submitting this file for class work at CSULB
// I am confirming that this is my work and the work of no one else. 
// 
// In submitting this code I acknowledge that plagiarism in student project
// work is subject to dismissal from the class. 
////////////////////////////////////////////////////////////////////////////////

module ld_reg(clk, reset, D, Q, load);
	
	input            clk, reset, load;
	input      [7:0] D;
	output reg [7:0] Q;
	
	always @(posedge clk, posedge reset)
		if(reset)
			Q <= 8'b0;
		else begin
			if(load)
				Q <= D;
			else
				Q <= Q;
		end 
		
endmodule