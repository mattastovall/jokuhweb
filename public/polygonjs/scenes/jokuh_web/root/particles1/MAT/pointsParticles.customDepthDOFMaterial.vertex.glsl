
uniform float size;
uniform float scale;
#include <common>

varying float vViewZDepth;

// INSERT DEFINES



void main() {

	// INSERT BODY



	// /particles1/MAT/pointsParticles/constant_point_size
	float v_POLY_constant_point_size_val = 0.0059000000000000025;
	
	// /particles1/MAT/pointsParticles/output1
	vec3 transformed = position;
	vec3 objectNormal = normal;
	#ifdef USE_TANGENT
		vec3 objectTangent = vec3( tangent.xyz );
	#endif
	gl_PointSize = v_POLY_constant_point_size_val * size * 10.0;





	#include <project_vertex>

	vViewZDepth = - mvPosition.z;
	#ifdef USE_SIZEATTENUATION
		bool isPerspective = ( projectionMatrix[ 2 ][ 3 ] == - 1.0 );
		if ( isPerspective ) gl_PointSize *= ( scale / - mvPosition.z );
	#endif

}
