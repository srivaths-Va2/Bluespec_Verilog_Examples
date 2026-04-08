package Count15;
	// Define the interface
	interface Counter15_Ifc;
		method Bit#(4) q();
	endinterface
	
	// Define the module
	module mkCounter15(Counter15_Ifc);
		Reg#(Bit#(4)) counter_reg <- mkReg(0);
		
		// Fire a rule to keep incrementing count indefinitely
		rule increment;
			counter_reg <= counter_reg + 1;
		endrule
		
		method Bit#(4) q();
			return counter_reg;
		endmethod
	endmodule
endpackage
