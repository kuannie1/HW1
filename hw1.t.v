`include "hw1.v"
module demorgan_test ();
	//Instantiate device/module under test
	reg A, B;		// Primary test inputs
	wire nA, nB, nAandnB; 	//Test outputs
	wire AandB, nAandB;	//negateaandb test outputs
	wire nAornB;
	wire AorB, nAorB;

	// Modules to be tested
	demorgan dut1(A, B, nA, nB, nAandnB);

	negateaandb dut2(A, B, AandB, nAandB);
	
	notaornotb dut3(A, B, nA, nB, nAornB);
	
	negateaorb dut4(A, B, AorB, nAorB);
	
	// Run sequence of test stimuli
	initial begin
		$display("A B | ~A ~B | ~A~B ");            // Prints header for truth table
    		A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    		A=0;B=1; #1                                 // Set A and B, wait for new update
    		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    		A=1;B=0; #1
    		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    		A=1;B=1; #1
    		$display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
		
		
		$display("");

		$display("A B | AB | ~(AB) ");                  // Prints header for negateaandb truth table
                A=0; B=0; #1                                    // Set Aand B, wait for update (#1)
                $display("%b %b | %b  | %b ", A, B, AandB, nAandB);
                A=0; B=1; #1                                    // Set A and B, wait for new update
                $display("%b %b | %b  | %b ", A, B, AandB, nAandB);
                A=1; B=0; #1
                $display("%b %b | %b  | %b ", A, B, AandB, nAandB);
                A=1; B=1; #1
                $display("%b %b | %b  | %b ", A, B, AandB, nAandB);	
		
		$display("");

		$display("A B | ~A ~B | ~A + ~B ");            // Prints header for truth table
                A=0;B=0; #1                                 // Set A and B, wait for update (#1)
                $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAornB);
                A=0;B=1; #1                                 // Set A and B, wait for new update
                $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAornB);
                A=1;B=0; #1
                $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAornB);
                A=1;B=1; #1 
                $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAornB);


		$display("");

		$display("A B | A+B | ~(A+B) ");                  // Prints header for negateaandb truth table
                A=0; B=0; #1                                    // Set Aand B, wait for update (#1)
                $display("%b %b |  %b  | %b ", A, B, AorB, nAorB);
                A=0; B=1; #1                                    // Set A and B, wait for new update
                $display("%b %b |  %b  | %b ", A, B, AorB, nAorB);
                A=1; B=0; #1
                $display("%b %b |  %b  | %b ", A, B, AorB, nAorB);
                A=1; B=1; #1
                $display("%b %b |  %b  | %b ", A, B, AorB, nAorB);

                $display("");


	end
endmodule	//End demorgan test
