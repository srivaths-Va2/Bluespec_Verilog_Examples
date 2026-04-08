package Fsm3comb;
	typedef enum {A, B, C, D} State deriving(Bits, Eq);
	
	// Define the interface
	interface Fsm3comb_Ifc;
		method Action step(Bit#(1) in);
		method Bit#(1) out();
	endinterface
	
	// Define the module
	module mkFsm3comb(Fsm3comb_Ifc);
		Reg#(State) state <- mkReg(A);
		
		method Action step(Bit#(1) in);
			if(state == A) begin
				if(in == 0) state <= A;
				else state <= B;
			end
			
			else if(state == B) begin
                                if(in == 0) state <= C;
                                else state <= B;
                        end

			else if(state == C) begin
                                if(in == 0) state <= A;
                                else state <= D;
                        end
			
			else if(state == D) begin
                                if(in == 0) state <= C;
                                else state <= B;
                        end
		endmethod
		
		method Bit#(1) out();
			return (state == D ? 1 : 0);
		endmethod
	endmodule
endpackage
