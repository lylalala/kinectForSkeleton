clear
clc

%% 1.read data
filename='data.txt';
fid=fopen(filename);
if(fid<=0)
    error(['error: The file named "',filename,'" was not open!']);
end
DS = textscan(fid,'%n %s %n %n %n %n %n');
fclose(fid);
XY.SHOULDER=[];
XY.ELBOW=[];
XY.WRIST=[];
XY.SHOULDER_CENTER=[];
XY.SPINE=[];
XY.SHOULDER_RIGHT=[];
XY.HIP_CENTER=[];
XY.HEAD=[];
XY.HIP_LEFT=[];
XY.HIP_RIGHT=[];
XYZ.dataSHOULDER=[];
XYZ.dataELBOW=[];
XYZ.dataWRIST=[];
XYZ.dataSHOULDER_CENTER=[];
XYZ.dataSPINE=[];
XYZ.dataSHOULDER_RIGHT=[];
XYZ.dataHIP_CENTER=[];
XYZ.dataHEAD=[];
XYZ.dataHIP_LEFT=[];
XYZ.dataHIP_RIGHT=[];
for j=1:1:floor(length(DS{1})/10)*10
    whichone=DS{2}(j);
    eval(['XYZ.data',whichone{1},'=[XYZ.data',whichone{1},';(DS{1}(j)-DS{1}(1))/1000,DS{5}(j),DS{6}(j),DS{7}(j)];']);
    eval(['XY.',whichone{1},'=[XY.',whichone{1},';DS{3}(j),-DS{4}(j)];']);
end
timeline=XYZ.dataSHOULDER(:,1);
XYZ.dataELBOW=XYZ.dataELBOW(:,2:4);
XYZ.dataSHOULDER=XYZ.dataSHOULDER(:,2:4);
XYZ.dataWRIST=XYZ.dataWRIST(:,2:4);
XYZ.dataSHOULDER_CENTER=XYZ.dataSHOULDER_CENTER(:,2:4);
XYZ.dataSPINE=XYZ.dataSPINE(:,2:4);
XYZ.dataSHOULDER_RIGHT=XYZ.dataSHOULDER_RIGHT(:,2:4);
XYZ.dataHIP_CENTER=XYZ.dataHIP_CENTER(:,2:4);
XYZ.dataHEAD=XYZ.dataHEAD(:,2:4);
XYZ.dataHIP_LEFT=XYZ.dataHIP_LEFT(:,2:4);
XYZ.dataHIP_RIGHT=XYZ.dataHIP_RIGHT(:,2:4);
clearvars DS fid filename j whichone ans

%%
angle=[];
for i=1:1:length(XYZ.dataELBOW)
    %% 2.plot
    subplot(1,3,1)
    plot3(XYZ.dataELBOW(i,1),XYZ.dataELBOW(i,2),XYZ.dataELBOW(i,3),'b*');
    hold on
    plot3(XYZ.dataWRIST(i,1),XYZ.dataWRIST(i,2),XYZ.dataWRIST(i,3),'r*');
    plot3(XYZ.dataSHOULDER(i,1),XYZ.dataSHOULDER(i,2),XYZ.dataSHOULDER(i,3),'k*');
    plot3(XYZ.dataSHOULDER_CENTER(i,1),XYZ.dataSHOULDER_CENTER(i,2),XYZ.dataSHOULDER_CENTER(i,3),'k*');
    plot3(XYZ.dataSPINE(i,1),XYZ.dataSPINE(i,2),XYZ.dataSPINE(i,3),'k*');
    plot3(XYZ.dataSHOULDER_RIGHT(i,1),XYZ.dataSHOULDER_RIGHT(i,2),XYZ.dataSHOULDER_RIGHT(i,3),'k*');
    plot3(XYZ.dataHIP_CENTER(i,1),XYZ.dataHIP_CENTER(i,2),XYZ.dataHIP_CENTER(i,3),'k*');
    plot3(XYZ.dataHEAD(i,1),XYZ.dataHEAD(i,2),XYZ.dataHEAD(i,3),'b*');
    plot3(XYZ.dataHIP_LEFT(i,1),XYZ.dataHIP_LEFT(i,2),XYZ.dataHIP_LEFT(i,3),'k*');
    plot3(XYZ.dataHIP_RIGHT(i,1),XYZ.dataHIP_RIGHT(i,2),XYZ.dataHIP_RIGHT(i,3),'k*');  
    ll=posPlotNode(XYZ.dataSHOULDER(i,:),XYZ.dataSHOULDER_CENTER(i,:),50,3);
    plot3(ll(1,:),ll(2,:),ll(3,:),'k');
    ll=posPlotNode(XYZ.dataSHOULDER_RIGHT(i,:),XYZ.dataSHOULDER_CENTER(i,:),50,3);
    plot3(ll(1,:),ll(2,:),ll(3,:),'k');
    ll=posPlotNode(XYZ.dataSPINE(i,:),XYZ.dataSHOULDER_CENTER(i,:),50,3);
    plot3(ll(1,:),ll(2,:),ll(3,:),'k');
    ll=posPlotNode(XYZ.dataHEAD(i,:),XYZ.dataSHOULDER_CENTER(i,:),50,3);
    plot3(ll(1,:),ll(2,:),ll(3,:),'k');
    ll=posPlotNode(XYZ.dataSHOULDER(i,:),XYZ.dataELBOW(i,:),50,3);
    plot3(ll(1,:),ll(2,:),ll(3,:),'r');
    ll=posPlotNode(XYZ.dataELBOW(i,:),XYZ.dataWRIST(i,:),50,3);
    plot3(ll(1,:),ll(2,:),ll(3,:),'b');
    xlabel('x')
    ylabel('y')
    zlabel('z')
    axis([-0.5 0.5 -0.4 0.4 1 2])
    hold off
    
    subplot(1,3,2);
    plot(XY.HEAD(i,1),XY.HEAD(i,2),'b*');
    hold on
    plot(XY.ELBOW(i,1),XY.ELBOW(i,2),'r*');
    plot(XY.WRIST(i,1),XY.WRIST(i,2),'r*');
    plot(XY.SHOULDER_CENTER(i,1),XY.SHOULDER_CENTER(i,2),'b*');
    plot(XY.SPINE(i,1),XY.SPINE(i,2),'b*');
    plot(XY.SHOULDER_RIGHT(i,1),XY.SHOULDER_RIGHT(i,2),'b*');
    plot(XY.HIP_CENTER(i,1),XY.HIP_CENTER(i,2),'b*');
    plot(XY.HIP_LEFT(i,1),XY.HIP_LEFT(i,2),'b*');
    plot(XY.HIP_RIGHT(i,1),XY.HIP_RIGHT(i,2),'b*');
    plot(XY.SHOULDER(i,1),XY.SHOULDER(i,2),'r*');
    ll=posPlotNode(XY.HEAD(i,:),XY.SHOULDER_CENTER(i,:),50,2);
    plot(ll(1,:),ll(2,:),'k');
    ll=posPlotNode(XY.SHOULDER(i,:),XY.SHOULDER_CENTER(i,:),50,2);
    plot(ll(1,:),ll(2,:),'k');
    ll=posPlotNode(XY.SHOULDER_RIGHT(i,:),XY.SHOULDER_CENTER(i,:),50,2);
    plot(ll(1,:),ll(2,:),'k');
    ll=posPlotNode(XY.SHOULDER(i,:),XY.ELBOW(i,:),50,2);
    plot(ll(1,:),ll(2,:),'k');
    ll=posPlotNode(XY.WRIST(i,:),XY.ELBOW(i,:),50,2);
    plot(ll(1,:),ll(2,:),'k');
    xlabel('x')
    ylabel('y')
    hold off
    
    subplot(1,3,3);
    plot(XYZ.dataHEAD(i,1),XYZ.dataHEAD(i,2),'b*');
    hold on
    plot(XYZ.dataELBOW(i,1),XYZ.dataELBOW(i,2),'r*');
    plot(XYZ.dataWRIST(i,1),XYZ.dataWRIST(i,2),'r*');
    plot(XYZ.dataSHOULDER_CENTER(i,1),XYZ.dataSHOULDER_CENTER(i,2),'b*');
    plot(XYZ.dataSPINE(i,1),XYZ.dataSPINE(i,2),'b*');
    plot(XYZ.dataSHOULDER_RIGHT(i,1),XYZ.dataSHOULDER_RIGHT(i,2),'b*');
    plot(XYZ.dataHIP_CENTER(i,1),XYZ.dataHIP_CENTER(i,2),'b*');
    plot(XYZ.dataHIP_LEFT(i,1),XYZ.dataHIP_LEFT(i,2),'b*');
    plot(XYZ.dataHIP_RIGHT(i,1),XYZ.dataHIP_RIGHT(i,2),'b*');
    plot(XYZ.dataSHOULDER(i,1),XYZ.dataSHOULDER(i,2),'r*');
    ll=posPlotNode(XYZ.dataHEAD(i,:),XYZ.dataSHOULDER_CENTER(i,:),50,2);
    plot(ll(1,:),ll(2,:),'k');
    ll=posPlotNode(XYZ.dataSHOULDER(i,:),XYZ.dataSHOULDER_CENTER(i,:),50,2);
    plot(ll(1,:),ll(2,:),'k');
    ll=posPlotNode(XYZ.dataSHOULDER_RIGHT(i,:),XYZ.dataSHOULDER_CENTER(i,:),50,2);
    plot(ll(1,:),ll(2,:),'k');
    ll=posPlotNode(XYZ.dataSHOULDER(i,:),XYZ.dataELBOW(i,:),50,2);
    plot(ll(1,:),ll(2,:),'k');
    ll=posPlotNode(XYZ.dataWRIST(i,:),XYZ.dataELBOW(i,:),50,2);
    plot(ll(1,:),ll(2,:),'k');
    xlabel('x')
    ylabel('y')
    hold off
    pause(0.0001);
    
    %% 3.get a plane
    plane=XYZ.dataSHOULDER(i,3)+XYZ.dataSHOULDER_CENTER(i,3)+XYZ.dataSHOULDER_RIGHT(i,3)+XYZ.dataHIP_CENTER(i,3)+XYZ.dataHIP_LEFT(i,3)+XYZ.dataHIP_RIGHT(i,3);
    plane=plane/6;
    
    %% 4.caculate
    %4.1
    if(XYZ.dataSHOULDER(i,2)-XYZ.dataELBOW(i,2)<0.001)
        angle1=90;
    else
        angle1=atan((XYZ.dataSHOULDER(i,1)-XYZ.dataELBOW(i,1))/(XYZ.dataSHOULDER(i,2)-XYZ.dataELBOW(i,2)))/pi*180;
    end
    %4.2
    if(XYZ.dataSHOULDER(i,2)-XYZ.dataELBOW(i,2)>0)
        angle2=atan((XYZ.dataSHOULDER(i,3)-XYZ.dataELBOW(i,3))/(XYZ.dataSHOULDER(i,2)-XYZ.dataELBOW(i,2)))/pi*180;
    elseif(XYZ.dataSHOULDER(i,2)-XYZ.dataELBOW(i,2)<0)
        angle2=atan((XYZ.dataSHOULDER(i,3)-XYZ.dataELBOW(i,3))/(XYZ.dataSHOULDER(i,2)-XYZ.dataELBOW(i,2)))/pi*180+180;
    else
        angle2=90;
    end
    %4.4
    A=XYZ.dataELBOW(i,:)-XYZ.dataSHOULDER(i,:);
    B=XYZ.dataWRIST(i,:)-XYZ.dataELBOW(i,:);
    angle4=acos(dot(A,B)/(norm(A)*norm(B)))/pi*180;
    %4.3
    shoulderNew=[0,0,0];%肩膀位置
    elbowNew=XYZ.dataELBOW(i,:)-XYZ.dataSHOULDER(i,:);%手肘位置
    wristNew=XYZ.dataWRIST(i,:)-XYZ.dataSHOULDER(i,:);%手腕位置
    lengthARM1=sqrt(sum(elbowNew.^2));%大臂长度
    lengthARM2=sqrt(sum((wristNew-elbowNew).^2));%小臂长度
    %得到旋转之前的法向量
    array=angle2dcm(-angle1,0,angle2,'ZYX');%旋转矩阵
    positionNew=[0,-lengthARM1,0;0,-lengthARM1,-1];%在新坐标系的位置
    positionOld=(array'*positionNew')';%在旧坐标系的位置
    normalVector1=positionOld(2,:)-positionOld(1,:);
    %得到旋转之后的法向量
    if(angle4<90)
        alpha=lengthARM1/(lengthARM1-lengthARM2*sin(90-angle4));
        wrist2=(wristNew-elbowNew)*alpha+elbowNew;
        destination=(shoulderNew+wrist2)/2;
    elseif(angle4>90)
        shoulder2=2*elbowNew-shoulderNew;
        alpha=lengthARM1/(lengthARM1-lengthARM2*sin(angle4-90));
        wrist2=(wristNew-elbowNew)*alpha+elbowNew;
        destination=(shoulder2+wrist2)/2;
    else
        destination=(wristNew-elbowNew)/lengthARM2+elbowNew;
    end
    normalVector2=destination-elbowNew;
    %求向量夹角
    A=normalVector1;
    B=normalVector2;
    angle3=acos(dot(A,B)/(norm(A)*norm(B)))/pi*180;
    
    angle=[angle;angle1,angle2,angle3,angle4];
end

clearvars alpha A B angle1 angle2 angle3 angle4 array elbowNew shoulderNew wristNew positionNew positionOld i ll lengthARM1 lengthARM2 plane
clearvars destination normalVector1 normalVector2 shoulder2 wrist2