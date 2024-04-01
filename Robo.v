module Robo (head, left, clock, reset, avancar, girar);
    input head, left, clock, reset;
    output reg avancar, girar;
    
    // Registrador de estado
    reg [1:0] state;
    
    // Codificação dos estados
    parameter procurandoMuro = 2'b00,
              rotacionando = 2'b01,
              acompanhandoMuro = 2'b10;
    
    // Inicialização da máquina
    initial begin
        state <= procurandoMuro;
        
        //avancar <= 0;
        //girar <= 0;
    end
    
    always @(negedge clock or negedge reset) begin
        if(reset == 1'b0) state <= procurandoMuro;
        else begin
            case(state)
                procurandoMuro: begin
                    if(!head && !left) state <= procurandoMuro;
                    else if(!head && left) state <= acompanhandoMuro;
                    else if(head && !left) state <= rotacionando;
						  else if(head && left)  state <= rotacionando;
                end
					 
                rotacionando: begin
                    if(!head && !left) state <= rotacionando;
                    else if(!head && left) state <= acompanhandoMuro;
                    else if(head && !left) state <= rotacionando;
						  else if(head && left)  state <= rotacionando;
                end
                acompanhandoMuro: begin
                    if(!head && !left) state <= procurandoMuro;
                    else if(!head && left) state <= acompanhandoMuro;
                    else if(head && !left) state <= procurandoMuro;
						  else if(head && left)  state <= rotacionando;
                end
            endcase
        end
    end
	 
	 always @(state, head, left) begin
		 case(state)
			 procurandoMuro: begin
				if(!head && !left) begin
					avancar = 1'b1;
					girar = 1'b0;
				end
				
				else if(!head && left) begin
					avancar = 1'b1;
					girar = 1'b0;
				end
				else if(head && !left) begin
					avancar = 1'b0;
					girar = 1'b1;
				end
				else if(head && left) begin
					avancar = 1'b0;
					girar = 1'b1;
				end 
			 end

			rotacionando: begin
			  if(!head && !left) begin
					avancar = 1'b0;
					girar = 1'b1;
			  end
			  else if(!head && left) begin
					avancar = 1'b1;
					girar = 1'b0;
			  end
			  else if(head && !left) begin
					avancar = 1'b0;
					girar = 1'b1;
			  end
			  else if(head && left) begin
					avancar = 1'b0;
					girar = 1'b1;
			  end
			end
			
			acompanhandoMuro: begin
			  if(!head && !left) begin
					avancar = 1'b0;
					girar = 1'b1;
			  end
			  else if(!head && left) begin
					avancar = 1'b1;
					girar = 1'b0;
			  end
			  else if(head && !left) begin
					avancar = 1'b0;
					girar = 1'b1;
			  end
			  
			  else if(head && left) begin
					avancar = 1'b0;
					girar = 1'b1;
			  end
			end
		
		endcase
	end
    
endmodule