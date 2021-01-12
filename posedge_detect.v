`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////// 
//
// File Name: posedge_detect.v
// Project: Project 4-UART
// Created by <Dustin Nguyen> on <April 17th, 2020>
//
// In submitting this file for class work at CSULB
// I am confirming that this is my work and the work of no one else. 
// 
// In submitting this code I acknowledge that plagiarism in student project
// work is subject to dismissal from the class. 
////////////////////////////////////////////////////////////////////////////////

module posedge_detect(clk , reset , in , ped, p1) ;

	input  clk , reset ;
	input  in  ;
    input p1;
    
	output wire ped ;
	
	reg Q1, Q2;

	always @ (posedge clk, posedge reset)
		if(reset)
			{Q1, Q2} <= 2'b0;
		else
			{Q1, Q2} <= {in, Q1};
	
	
	assign ped = Q1 & ~Q2;
	
endmodule 