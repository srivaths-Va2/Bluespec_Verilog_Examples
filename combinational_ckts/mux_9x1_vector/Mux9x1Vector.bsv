package Mux9x1Vector;
	// Interace declaration
	interface Mux9x1_Ifc;
		method Bit#(16) get_mux_output(Bit#(16) a, Bit#(16) b, Bit#(16) c, Bit#(16) d, Bit#(16) e, Bit#(16) f, Bit#(16) g, Bit#(16) h, Bit#(16) i, Bit#(4) sel);
	endinterface
	
	// Module declaration
	module mkMux9x1Vector(Mux9x1_Ifc);
		method Bit#(16) get_mux_output(Bit#(16) a, Bit#(16) b, Bit#(16) c, Bit#(16) d, Bit#(16) e, Bit#(16) f, Bit#(16) g, Bit#(16) h, Bit#(16) i, Bit#(4) sel);
			// Bit#(16) output = mkReg(0);
			// Case statements
			Bit#(16) mux_res = case(sel)
						4'd0: a;
						4'd1: b;
						4'd2: c;
						4'd3: d;
						4'd4: e;
						4'd5: f;
						4'd6: g;
						4'd7: h;
						4'd8: i;
						default: 16'b0;
					endcase;
			return mux_res;
		endmethod
	endmodule
endpackage
