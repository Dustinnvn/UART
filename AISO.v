`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////// 
//
// File Name: AISO.v
// Project: Project 4-UART
// Created by <Dustin Nguyen> on <April 17th, 2020>
//
// In submitting this file for class work at CSULB
// I am confirming that this is my work and the work of no one else. 
// 
// In submitting this code I acknowledge that plagiarism in student project
// work is subject to dismissal from the class. 
////////////////////////////////////////////////////////////////////////////////
module AISO ( clk , reset , reset_sync ) ;

	input      clk       , reset;
	
	output   wire  reset_sync;
	reg Q1 , Q2 ;
	
	always @ (posedge clk, posedge reset)
		if (reset)
			{Q1, Q2} <= 2'b0;
		else
			{Q1, Q2} <= {1'b1, Q1};

	assign reset_sync = ~Q2;

endmodule