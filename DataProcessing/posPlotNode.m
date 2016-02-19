        function label=posPlotNode(a,b,num,howmany)
        %辅助函数：给定两点得到两点组成的线段上均匀分布的num-1个点的坐标
        label=[];
            for i=1:1:howmany
                if(a(i)==b(i))
                    label(i,:)=kron(a(i),ones(1,num+1));
                else
                    label(i,:)=a(i):(b(i)-a(i))/50:b(i);
                end
            end
        end