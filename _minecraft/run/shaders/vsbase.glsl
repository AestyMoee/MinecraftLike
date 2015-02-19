varying vec3 normal;
varying vec3 vertex_to_light_vector;
varying vec4 color;

uniform float elapsed;
uniform mat4 invertView;

bool augmente;

void main()
{
	gl_Vertex = invertView * gl_ModelViewMatrix * gl_Vertex;
	// Transforming The Vertex
	if(gl_Color.z> 0.9 && gl_Vertex.z>0){
		gl_Vertex.z += sin(elapsed + gl_Vertex.x*10)*8;
		}

	gl_Position = gl_ProjectionMatrix * inverse(invertView) * gl_Vertex;

	// Transforming The Normal To ModelView-Space
	normal = gl_NormalMatrix * gl_Normal; 

	//Direction lumiere
	vertex_to_light_vector = vec3(gl_LightSource[0].position);

	//Couleur
	color = gl_Color;
	//
	if(color.z> 0.9 && gl_Vertex.z>0){
		color.w = 0.5;
		gl_Vertex.z += sin(elapsed + gl_Vertex.x*10)*2;
		}



	
}