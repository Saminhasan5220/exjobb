far = 1000;
lidarResH = degtorad(0.16);
lidarResV = degtorad(1.33);
cameraWidth = 2000;
cameraHeight = 1000;
fovH = degtorad(90);
%centerDistance = cameraWidth/(2*tan(fovH/2));

% Decode image data to depth map
head = DecodeDepth(imread('head/image_00001.png'),far);
tail = DecodeDepth(imread('tail/image_00001.png'),far);
left = DecodeDepth(imread('left/image_00001.png'),far);
right = DecodeDepth(imread('right/image_00001.png'),far);

[distanceV, distanceH, anglesV, anglesH] = GetRelevantPixels(lidarResH,lidarResV,cameraWidth,cameraHeight,fovH);

[xH,yH,zH] = GetCoordinates(head,anglesV,anglesH,distanceV,distanceH);
[xT,yT,zT] = GetCoordinates(tail,anglesV,anglesH,distanceV,distanceH);
[xL,yL,zL] = GetCoordinates(left,anglesV,anglesH,distanceV,distanceH);
[xR,yR,zR] = GetCoordinates(right,anglesV,anglesH,distanceV,distanceH);

[xT,yT,zT] = ZAxisRotation(xT,yT,zT,degtorad(180));
[xL,yL,zL] = ZAxisRotation(xL,yL,zL,degtorad(-90));
[xR,yR,zR] = ZAxisRotation(xR,yR,zR,degtorad(90));

x = [xH;xT;xL;xR];
y = [yH;yT;yL;yR];
z = [zH;zT;zL;zR];

%c = zeros(length(headV)*length(headH),3);
%for i = 1:length(headV)
%   for j = 1:length(headH)
%       v = anglesV(i);
%       h = anglesH(j);
%       r = head(headV(i),headH(j));
%       
%       pointIndex = (i-1)*length(headH) + j;
%       
%       c(pointIndex,1) = r * sin(v) * cos(h);
%       c(pointIndex,2) = r * sin(v) * sin(h);
%       c(pointIndex,3) = r * cos(v);
%   end
%end

figure;
%subplot(1,2,1)
scatter3(xT,yT,zT,'.');
hold on
scatter3(xH,yH,zH,'.');
hold on
scatter3(xL,yL,zL,'.');
hold on
scatter3(xR,yR,zR,'.');
set(gca,'Color','k'); % Set background color

%intensity = data(:,4);
%color = jet(256);
%size = 4;
%roi = 60;
%scatter3D(x,y,z,'filled');
%set(gca,'Color','k'); % Set background color
%pbaspect([1 1 1]); % Set aspect ratio of plot box
%ylim([-roi roi]);
%xlim([-roi roi]);



img = zeros(cameraHeight,cameraWidth);

for i=1:length(distanceH)
    for j=1:length(distanceV)
        img(distanceV(j),distanceH(i)) = head(distanceV(j),distanceH(i));
    end
end
%subplot(1,2,2)
%image(img)