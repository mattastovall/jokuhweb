
// INSERT DEFINES


#if DEPTH_PACKING == 3200

	uniform float opacity;

#endif

#include <common>



// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/complement1
float complement(float x){return 1.0-x;}
vec2 complement(vec2 x){return vec2(1.0-x.x, 1.0-x.y);}
vec3 complement(vec3 x){return vec3(1.0-x.x, 1.0-x.y, 1.0-x.z);}
vec4 complement(vec4 x){return vec4(1.0-x.x, 1.0-x.y, 1.0-x.z, 1.0-x.w);}








// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/attribute3
uniform sampler2D texture_instancePosition_x_state;

// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/attribute3
varying vec2 particlesSimUvVarying;




#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>

varying vec2 vHighPrecisionZW;

void main() {

	#include <clipping_planes_fragment>

	vec4 diffuseColor = vec4( 1.0 );

	#if DEPTH_PACKING == 3200

		diffuseColor.a = opacity;

	#endif


	#include <map_fragment>
	#include <alphamap_fragment>



	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/attribute3
	float v_POLY_attribute3_val = texture2D( texture_instancePosition_x_state, particlesSimUvVarying ).w;
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/constant1
	vec3 v_POLY_constant1_val = vec3(0.059511238155621766, 0.059511238155621766, 0.059511238155621766);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/complement1
	float v_POLY_complement1_val = complement(v_POLY_attribute3_val);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/floatToVec3_3
	vec3 v_POLY_floatToVec3_3_vec3 = vec3(v_POLY_attribute3_val, v_POLY_complement1_val, 0.0);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/vec3ToFloat1
	float v_POLY_vec3ToFloat1_x = v_POLY_floatToVec3_3_vec3.x;
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/multScalar1
	vec3 v_POLY_multScalar1_val = (v_POLY_vec3ToFloat1_x*v_POLY_floatToVec3_3_vec3);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/clamp1
	vec3 v_POLY_clamp1_val = clamp(v_POLY_multScalar1_val, vec3(0.0, 0.0, 0.0), vec3(10.0, 10.0, 10.0));
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/multAdd2
	vec3 v_POLY_multAdd2_val = (vec3(50.0, 50.0, 50.0)*(v_POLY_clamp1_val + vec3(0.0, 0.0, 0.0))) + v_POLY_constant1_val;
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/output1
	diffuseColor.xyz = v_POLY_multAdd2_val;




	// INSERT BODY
	// the new body lines should be added before the alphatest_fragment
	// so that alpha is set before (which is really how it would be set if the alphamap_fragment above was used by the material node parameters)

	#include <alphatest_fragment>

	#include <logdepthbuf_fragment>


	// Higher precision equivalent of gl_FragCoord.z. This assumes depthRange has been left to its default values.
	float fragCoordZ = 0.5 * vHighPrecisionZW[0] / vHighPrecisionZW[1] + 0.5;

	#if DEPTH_PACKING == 3200

		gl_FragColor = vec4( vec3( 1.0 - fragCoordZ ), diffuseColor.a );

	#elif DEPTH_PACKING == 3201

		gl_FragColor = packDepthToRGBA( fragCoordZ );

	#endif

}
