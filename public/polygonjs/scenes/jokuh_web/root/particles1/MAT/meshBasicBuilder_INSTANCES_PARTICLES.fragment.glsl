uniform vec3 diffuse;
uniform float opacity;
#ifndef FLAT_SHADED
	varying vec3 vNormal;
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




#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_pars_fragment>
#include <fog_pars_fragment>
#include <specularmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );



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



	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <specularmap_fragment>
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	#ifdef USE_LIGHTMAP
		vec4 lightMapTexel = texture2D( lightMap, vLightMapUv );
		reflectedLight.indirectDiffuse += lightMapTexel.rgb * lightMapIntensity * RECIPROCAL_PI;
	#else
		reflectedLight.indirectDiffuse += vec3( 1.0 );
	#endif
	#include <aomap_fragment>
	reflectedLight.indirectDiffuse *= diffuseColor.rgb;
	vec3 outgoingLight = reflectedLight.indirectDiffuse;
	#include <envmap_fragment>
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}