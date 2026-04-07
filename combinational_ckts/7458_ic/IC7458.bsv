package IC7458;
	// Interface declaration
	interface IC7458_Ifc;
		method Bit#(1) get_p1y(Bit#(1) p1a, Bit#(1) p1b, Bit#(1) p1c, Bit#(1) p1d, Bit#(1) p1e, Bit#(1) p1f);
		method Bit#(1) get_p2y(Bit#(1) p2a, Bit#(1) p2b, Bit#(1) p2c, Bit#(1) p2d);
	endinterface
	
	// Module definition
	module mkIC7458(IC7458_Ifc);
		method Bit#(1) get_p1y(Bit#(1) p1a, Bit#(1) p1b, Bit#(1) p1c, Bit#(1) p1d, Bit#(1) p1e, Bit#(1) p1f);
			Bit#(1) p1_abc = p1a & p1b & p1c;
			Bit#(1) p1_def = p1d & p1e & p1f;
			return p1_abc | p1_def;
		endmethod
		
		method Bit#(1) get_p2y(Bit#(1) p2a, Bit#(1) p2b, Bit#(1) p2c, Bit#(1) p2d);
			Bit#(1) p2_ab = p2a & p2b;
			Bit#(1) p2_cd = p2c & p2d;
			return p2_ab | p2_cd;
		endmethod
	endmodule
endpackage
