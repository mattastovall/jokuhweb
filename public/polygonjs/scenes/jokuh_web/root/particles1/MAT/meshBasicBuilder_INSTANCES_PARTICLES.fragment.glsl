uniform vec3 diffuse;
uniform float opacity;
#ifndef FLAT_SHADED
	varying vec3 vNormal;
#endif
#include <common>



// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/hsvToRgb1
// https://github.com/hughsk/glsl-hsv2rgb
// https://stackoverflow.com/questions/15095909/from-rgb-to-hsv-in-opengl-glsl
vec3 hsv2rgb(vec3 c) {
	vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}







// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/attribute1
varying float v_POLY_attribute_idn;

// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/instanceTransform1
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



	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/attribute1
	float v_POLY_attribute1_val = v_POLY_attribute_idn;
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/multAdd1
	float v_POLY_multAdd1_val = (1000.0*(v_POLY_attribute1_val + 0.0)) + 0.0;
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/round1
	float v_POLY_round1_val = sign(v_POLY_multAdd1_val)*floor(abs(v_POLY_multAdd1_val)+0.5);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/floatToVec2_1
	vec2 v_POLY_floatToVec2_1_vec2 = vec2(v_POLY_round1_val, 0.1);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/random1
	float v_POLY_random1_rand = rand(v_POLY_floatToVec2_1_vec2);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/mult1
	float v_POLY_mult1_product = (v_POLY_random1_rand * 0.1);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/exp1
	float v_POLY_exp1_val = exp(v_POLY_random1_rand);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/divide1
	float v_POLY_divide1_divide = (v_POLY_exp1_val / 0.59);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/floatToVec3_1
	vec3 v_POLY_floatToVec3_1_vec3 = vec3(v_POLY_mult1_product, v_POLY_exp1_val, v_POLY_divide1_divide);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/hsvToRgb1
	vec3 v_POLY_hsvToRgb1_rgb = hsv2rgb(v_POLY_floatToVec3_1_vec3);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/output1
	diffuseColor.xyz = v_POLY_hsvToRgb1_rgb;



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