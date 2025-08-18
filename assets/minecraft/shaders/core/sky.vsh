#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>

in vec3 Position;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;

out float vertexDistance;
out vec4 rawPos;

void main() {
    //gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    vec4 pos = ProjMat * vec4(Position, 1.0);
	pos.y = -pos.z;

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);
	
	gl_Position = pos;

    vertexDistance = length((ModelViewMat * vec4(Position, 1.0)).xyz);
    rawPos = vec4(Position, 1.0);
}
