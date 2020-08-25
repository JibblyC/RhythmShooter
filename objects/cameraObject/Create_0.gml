camera = camera_create();

//View Matrix - Where our camera is and where it is looking at (standard setup for basic 2D)
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
//Perpsective Matrix
var pm = matrix_build_projection_ortho(640,480,1,10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);
view_camera[0] = camera;

follow = playerObject;
xTo = x;
yTo = y;