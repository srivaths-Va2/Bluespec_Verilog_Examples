package DFFSyncRstVector;
	// Interace
	interface DFFSyncRstVector_Ifc;
		method ActionValue#(Bit#(8)) step(Bit#(8) d, Bit#(1) rst);
	endinterface
	
	// Module
	module mkDFFSyncRstVector(DFFSyncRstVector_Ifc);
		Reg#(Bit#(8)) q <- mkReg(0);
	
		method ActionValue#(Bit#(8)) step(Bit#(8) d, Bit#(1) rst);
			if(rst == 1) q <= 0;
			else q <= d;
			return q;
		endmethod
	endmodule
endpackage
