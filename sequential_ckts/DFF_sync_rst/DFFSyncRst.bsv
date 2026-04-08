// D Flip-Flop with synchronous reset

package DFFSyncRst;
	interface DFF_Ifc;
		method ActionValue#(Bit#(1)) step(Bit#(1) d, Bit#(1) rst);
	endinterface
	
	// Module logic for the DFF
	module mkDFFSyncRst(DFF_Ifc);
		Reg#(Bit#(1)) q <- mkReg(0);
		
		method ActionValue#(Bit#(1)) step(Bit#(1) d, Bit#(1) rst);
			if(rst == 1) q <= 0;
			else q <= d;
			
			return q;
		endmethod
	endmodule
endpackage
