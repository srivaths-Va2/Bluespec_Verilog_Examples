package Fsm1;
	// Instantiate the states of the FSM
	typedef enum {StateA, StateB} State deriving(Bits, Eq);
	
	// Define the interface
	interface Fsm1_Ifc;
		method Action step(Bit#(1) in_bit);
		method Bit#(1) out();
	endinterface

	// Define the module
	module mkFsm1(Fsm1_Ifc);	
		Reg#(State) state <- mkReg(StateB);
		
		method Action step(Bit#(1) in_bit);
			if (state == StateB) begin
				if(in_bit == 0) state <= StateA;
				else state <= StateB;
			end
			
			else begin
				if(in_bit == 0) state <= StateB;
				else state <= StateA;
			end
		endmethod
		
		method Bit#(1) out();
			return (state == StateB) ? 1 : 0;
		endmethod
	endmodule
endpackage
