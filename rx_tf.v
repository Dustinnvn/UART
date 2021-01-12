`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////// 
//
// File Name: UART_top.v
// Project: Projwct 4-UART
// Created by <Dustin Nguyen> on <April 17th, 2020>
//
// In submitting this file for class work at CSULB
// I am confirming that this is my work and the work of no one else. 
// 
// In submitting this code I acknowledge that plagiarism in student project
// work is subject to dismissal from the class. 
////////////////////////////////////////////////////////////////////////////////
module rxe_tf;

	// Inputs
	reg clk;
	reg reset;
	reg eight;
	reg pen;
	reg ohel;
	reg [18:0] k;
	reg read_0;
	reg Rx;

	// Outputs
	wire RxRdy;
	wire OVF;
	wire FERR;
	wire PERR;
	wire [7:0] rx_data;

	// Instantiate the Unit Under Test (UUT)
	receiveEngine uut (
		.clk(clk), 
		.reset(reset), 
		.eight(eight), 
		.pen(pen), 
		.ohel(ohel), 
		.k(k), 
		.read_0(read_0), 
		.Rx(Rx), 
		.RxRdy(RxRdy), 
		.OVF(OVF), 
		.FERR(FERR), 
		.PERR(PERR), 
		.rx_data(rx_data)
	);

	always #5 clk = ~clk;
	
	initial begin
		clk = 0;
		reset = 1;
		eight = 0;
		pen = 0;
		ohel = 1;
		k = 109;
		read_0 = 0;
		Rx = 1;

		#100;
		reset = 0; 
		eight = 0;
		Rx = 0;
		rx_data = 8'hA5;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;

		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;

		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;

		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;

		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		// stop bit 
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		wait(uut.done == 1);
		
		$finish; 
		
	end       
endmodule 