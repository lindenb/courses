BEGIN	{
	intag=0;
	}

/^\%\%BEGIN\(/ 	{
		name=substr($0,9);
		
		if(substr(name,length(tag)+1) !=")") next;
		name=substr(name,1,length(tag));
		
		if(name == tag) intag=1;
		}


	{
	if(intag==0) next;
	print;
	}

/^\%\%END\(/ 	{
		name=substr($0,7);
		if(substr(name,length(tag)+1) !=")") next;
		name=substr(name,1,length(tag));
		if(name == tag)
			{
			if(intag!=1) printf("ERROR TAG NOT OPEN %s\n",tag);
			intag=0;
			}
		}

END	{
	if(intag==1) printf("ERROR TAG NOT CLOSED %s\n",tag);
	}
