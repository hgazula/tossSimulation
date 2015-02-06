function tossSimulation(d)

% N = 1;
left = d(:,3:20);
right = d(:,21:38);

whole_body = [left right];

box = d(:,39:47);

hip_left = left(:,10:12);
hip_right = right(:,10:12);

shoulder_left = left(:,7:9);
shoulder_right = right(:,7:9);

box_center = box(:,1:3);
box_left = box(:,4:6);
box_right = box(:,7:9);

mov(1:length(whole_body)) = struct('cdata', [], 'colormap', []);

minbody = min(min(whole_body)) - 1;
maxbody = max(max(whole_body)) + 1;

for j = 1:size(left,1)
    
    left_part = left(j,:);
    right_part = right(j,:);
    c = length(left_part)/3;
    
    left_x = zeros(1, c);
    left_y = zeros(1, c);
    left_z = zeros(1, c);
    
    right_x = zeros(1, c);
    right_y = zeros(1, c);
    right_z = zeros(1, c);
    
    for i = 1 : c
        
        left_x(i) = left_part(3*i-2);
        left_y(i) = left_part(3*i-1);
        left_z(i) = left_part(3*i);
        
        right_x(i) = right_part(3*i-2);
        right_y(i) = right_part(3*i-1);
        right_z(i) = right_part(3*i);
        
    end
    
    hip_x(1) = hip_right(j,1);
    hip_y(1) = hip_right(j,2);
    hip_z(1) = hip_right(j,3);
    
    hip_x(2) = hip_left(j,1);
    hip_y(2) = hip_left(j,2);
    hip_z(2) = hip_left(j,3);
    
    shoulder_x(1) = shoulder_right(j,1);
    shoulder_y(1) = shoulder_right(j,2);
    shoulder_z(1) = shoulder_right(j,3);
    
    shoulder_x(2) = shoulder_left(j,1);
    shoulder_y(2) = shoulder_left(j,2);
    shoulder_z(2) = shoulder_left(j,3);
    
    box_x(1) = box_right(j,1);
    box_y(1) = box_right(j,2);
    box_z(1) = box_right(j,3);
    
    box_x(2) = box_left(j,1);
    box_y(2) = box_left(j,2);
    box_z(2) = box_left(j,3);
    
    plot3(right_x,right_y,right_z,'-r*');
    hold on;
    plot3(left_x,left_y,left_z,'-g*');
    hold on;
    plot3(hip_x,hip_y,hip_z,'-b*')
    hold on;
    plot3(shoulder_x,shoulder_y,shoulder_z,'-b*')
    hold on;
    plot3(box_x,box_y,box_z,'-b*')
    hold on;
    plot3(box_center(j,1),box_center(j,2),box_center(j,3),'-r*')
    hold off;
    grid on;
    axis([minbody maxbody minbody maxbody minbody maxbody]);
    
    %     view(-90, -90)
    mov(j) = getframe(gcf);
end
% movie(mov, -N)
% movie2avi(mov, 'toss.avi', 'compression', 'None', 'fps', 30, 'quality', 50);

end
