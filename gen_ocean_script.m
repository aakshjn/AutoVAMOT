function gen_ocean_script(input_arr)
% input_arr is 7X1 array, each row gives a parameter value

str = string(input_arr);
% for i=1:size(input_arr,2)
%     for j=1:size(input_arr,1)
%     str(i)=str(i)+input_arr(j,i)+" ";
%     end
% end
fin = fopen('init.ocn','r');
fout = fopen('simulate.ocn','w');
idk=0;
while ~feof(fin)
    idk=idk+1;
    s = fgetl(fin);
    if idk==14                 
        s = "desVar(	  " + '"NL" '+ str(1) + "	)";
    end
      if idk==15
        s = "desVar(	  " + '"NR" '+ str(2) + "	)";
      end
      if idk==16
        s = "desVar(	  " + '"NT" '+ str(3) + "	)";
      end
      if idk==17
        s = "desVar(	  " + '"PL" '+ str(4) + "	)";     
      end
      if idk==18
        s = "desVar(	  " + '"PR" '+ str(5) + "	)";
      end
      if idk==19
        s = "desVar(	  " + '"L" '+ str(6) + "	)";
      end
      if idk==20
        s = "desVar(	  " + '"C" '+ str(7) + "	)";
      end
      fprintf(fout,'%s\n',s);
end
fclose(fin);
fclose(fout);
end

