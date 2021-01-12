`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////// 
//
// File Name: baud_decoder.v
// Project: Project 4-UART
// Created by <Dustin Nguyen> on <April 17th, 2020>
//
// In submitting this file for class work at CSULB
// I am confirming that this is my work and the work of no one else. 
// 
// In submitting this code I acknowledge that plagiarism in student project
// work is subject to dismissal from the class. 
////////////////////////////////////////////////////////////////////////////////
module baud_decoder(baud_val, baud_out);

	input [3:0] baud_val;
	
	output reg [18:0] baud_out;
	
	always@(*) begin
		case(baud_val)
			4'b0000: baud_out = 19'd333_333;     //     300
			4'b0001: baud_out = 19'd83_333;      //   1200
			4'b0010: baud_out = 19'd41_667;      //   2400
			4'b0011: baud_out = 19'd20_833;      //   4800
			4'b0100: baud_out = 19'd10_417;      //   9600
			4'b0101: baud_out = 19'd5_208;       //  19200
			4'b0110: baud_out = 19'd2_604;       //  38400
			4'b0111: baud_out = 19'd1_736;       //  57600
			4'b1000: baud_out = 19'd868;         // 115200
			4'b1001: baud_out = 19'd434;         // 230400
			4'b1010: baud_out = 19'd217;         // 460800
			4'b1011: baud_out = 19'd109;         // 921600
			default: baud_out = 19'd333_333;
		endcase
	end 
	
endmodule 