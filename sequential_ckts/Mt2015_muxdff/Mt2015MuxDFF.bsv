/* This is a question found on the link https://hdlbits.01xz.net/wiki/Mt2015_muxdff */

package Mt2015MuxDFF;
	
	/* ---------------------------------- MUX-DFF MODULE ---------------------------------- */
	// Define the interface
	interface MuxDFF_Ifc;
		method Action update(Bit#(1) l, Bit#(1) r_in, Bit#(1) q_in);
		method Bit#(1) q_out();
	endinterface
	
	// Define the module
	module mkMuxDFF(MuxDFF_Ifc);
		Reg#(Bit#(1)) q_reg <- mkReg(0);
		method Action update(Bit#(1) l, Bit#(1) r_in, Bit#(1) q_in);
			q_reg <= (l == 1) ? r_in : q_in;
		endmethod
		
		method Bit#(1) q_out();
			return q_reg;
		endmethod
	endmodule
	
	/* ---------------------------------- FULL CIRCUIT ---------------------------------- */
	// Define the interface
	interface Mt2015MuxDFF_Ifc;
		method Action step(Bit#(1) l, Bit#(1) r0, Bit#(1) r1, Bit#(1) r2);
		method Bit#(3) outputs();
	endinterface
	
	// Define the module
	module mkMt2015MuxDFF(Mt2015MuxDFF_Ifc);
		MuxDFF_Ifc dff0 <- mkMuxDFF;
    		MuxDFF_Ifc dff1 <- mkMuxDFF;
    		MuxDFF_Ifc dff2 <- mkMuxDFF;
		
		method Action step(Bit#(1) l, Bit#(1) r0, Bit#(1) r1, Bit#(1) r2);
			dff0.update(l, r0, dff2.q_out);
			dff1.update(l, r1, dff0.q_out);
			let xor_val = dff1.q_out ^ dff2.q_out;
			dff2.update(l, r2, xor_val);
		endmethod
		
		method Bit#(3) outputs();
			return {dff2.q_out, dff1.q_out, dff0.q_out};
		endmethod
	endmodule
endpackage
