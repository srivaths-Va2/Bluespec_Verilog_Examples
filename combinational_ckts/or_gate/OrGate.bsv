package OrGate;
	interface OrIfc;
		method Bit#(1) get_or(Bit#(1) x, Bit#(1) y);
	endinterface
	
	module mkOr(OrIfc);
		method Bit#(1) get_or(Bit#(1) x, Bit#(1) y);
			return x | y;
		endmethod
	endmodule
endpackage
