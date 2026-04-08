package Fsm1_sync;
	// Define the structure of the states
	typedef enum {StateA, StateB} State deriving(Bits, Eq);
	
	// Define the interface
	interface Fsm1_sync_Ifc;
		method Action step(Bit#(1) reset, Bit#(1) in_bit);
		method Bit#(1) out();
	endinterface
	
	// Define the module
	module mkFsm1_sync(Fsm1_sync_Ifc);
		Reg#(State) state <- mkReg(StateB);
		
		// Method-1
		method Action step(Bit#(1) reset, Bit#(1) in_bit);
			if(reset == 0) begin
				if(state == StateB) begin
					if(in_bit == 0) state <= StateA;
					else state <= StateB;
				end
				else if(state == StateA) begin
					if(in_bit == 0) state <= StateB;
					else state <= StateA;
				end
			end
			else begin
				state <= StateB;
			end
		endmethod	
		
		// Method-2
		method Bit#(1) out();
			return (state == StateB) ? 1 : 0;
		endmethod
	endmodule
endpackage
