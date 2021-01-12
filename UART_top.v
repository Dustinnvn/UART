`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////// 
//
// File Name: UART_top.v
// Project: Project 4-UART
// Created by <Dustin Nguyen> on <April 17th, 2020>
//
// In submitting this file for class work at CSULB
// I am confirming that this is my work and the work of no one else. 
// 
// In submitting this code I acknowledge that plagiarism in student project
// work is subject to dismissal from the class. 
////////////////////////////////////////////////////////////////////////////////

module UART_top(clk, rst, sw, RX, TX, LED);
	
	input clk, rst, RX;
	input [7:0] sw;
	
	output TX;
	output reg [15:0] LED;
	
	wire reset, int_ack, read_strobe, write_strobe, interrupt;
	wire [7:0] read, write;
	wire [15:0] out_port, port_id, in_port; 
	
	AISO aiso (.clk(clk),
					 .reset(rst),
					 .reset_sync(reset));
		
	UART uart (.clk(clk),
					.reset(reset),
					.switches(sw),
					.Rx(RX),
					.read(read),
					.write(write),
					.out_port(out_port),
					.interrupt_ack(int_ack),
					.interrupt(interrupt),
					.Tx(TX),
					.in_port(in_port));
	
	tramelblaze_top TB(.CLK(clk),
							  .RESET(reset),
							  .IN_PORT(in_port),
							  .INTERRUPT(interrupt),
							  .OUT_PORT(out_port),
							  .PORT_ID(port_id),
							  .READ_STROBE(read_strobe),
							  .WRITE_STROBE(write_strobe),
							  .INTERRUPT_ACK(int_ack));
	
	addr_decode read_decode (.en(~port_id[15]), 
								    .sel(port_id[2:0]),
									 .signal(read_strobe),
									 .out(read));
	
	addr_decode write_decode (.en(~port_id[15]), 
								    .sel(port_id[2:0]), 
									 .signal(write_strobe),
									 .out(write));
	
	always @(posedge clk, posedge reset)
		if (reset)
			LED <= 16'b0;
		else if (write[2])
			LED <= out_port;
		else
			LED <= LED;
			
endmodule