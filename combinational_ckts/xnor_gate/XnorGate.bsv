package XnorGate;
	// Define the interface
	interface XnorIfc;
		method Bit#(1) get_xnor(Bit#(1) x, Bit#(1) y);
	endinterface
	
	// Module delaration
	module mkXnor(XnorIfc);
		method Bit#(1) get_xnor(Bit#(1) x, Bit#(1) y);
			return x ~^ y;
		endmethod
	endmodule
endpackage
