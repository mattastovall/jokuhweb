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


// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/rgbToHsv1
// https://stackoverflow.com/questions/15095909/from-rgb-to-hsv-in-opengl-glsl
vec3 rgb2hsv(vec3 c)
{
	vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
	vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
	vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

	float d = q.x - min(q.w, q.y);
	float e = 1.0e-10;
	return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/hsvToRgb2
// https://github.com/hughsk/glsl-hsv2rgb
// https://stackoverflow.com/questions/15095909/from-rgb-to-hsv-in-opengl-glsl
vec3 hsv2rgb(vec3 c) {
	vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}







// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/attribute3
uniform sampler2D texture_instancePosition_x_state;

// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/attribute3
varying vec2 particlesSimUvVarying;

// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/attribute1
varying float v_POLY_attribute_idn;




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
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/attribute1
	float v_POLY_attribute1_val = v_POLY_attribute_idn;
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/complement1
	float v_POLY_complement1_val = complement(v_POLY_attribute3_val);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/multAdd1
	float v_POLY_multAdd1_val = (1000.0*(v_POLY_attribute1_val + 0.0)) + 0.0;
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/floatToVec3_3
	vec3 v_POLY_floatToVec3_3_vec3 = vec3(v_POLY_attribute3_val, v_POLY_complement1_val, 0.0);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/round1
	float v_POLY_round1_val = sign(v_POLY_multAdd1_val)*floor(abs(v_POLY_multAdd1_val)+0.5);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/vec3ToFloat1
	float v_POLY_vec3ToFloat1_x = v_POLY_floatToVec3_3_vec3.x;
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/floatToVec2_1
	vec2 v_POLY_floatToVec2_1_vec2 = vec2(v_POLY_round1_val, 1.0);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/multScalar1
	vec3 v_POLY_multScalar1_val = (v_POLY_vec3ToFloat1_x*v_POLY_floatToVec3_3_vec3);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/random1
	float v_POLY_random1_rand = rand(v_POLY_floatToVec2_1_vec2);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/clamp1
	vec3 v_POLY_clamp1_val = clamp(v_POLY_multScalar1_val, vec3(0.0, 0.0, 0.0), vec3(10.0, 10.0, 10.0));
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/multAdd3
	vec3 v_POLY_multAdd3_val = (vec3(2.0, 2.0, 2.0)*(v_POLY_multScalar1_val + vec3(0.0, 0.0, 0.0))) + vec3(0.0, 0.0, 0.0);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/exp1
	float v_POLY_exp1_val = exp(v_POLY_random1_rand);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/multAdd2
	vec3 v_POLY_multAdd2_val = (vec3(0.5, 0.5, 0.0)*(v_POLY_clamp1_val + v_POLY_multAdd3_val)) + v_POLY_constant1_val;
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/divide1
	float v_POLY_divide1_divide = (v_POLY_exp1_val / v_POLY_random1_rand / 100.0);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/floatToVec3_1
	vec3 v_POLY_floatToVec3_1_vec3 = vec3(v_POLY_divide1_divide, v_POLY_divide1_divide, v_POLY_divide1_divide);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/rgbToHsv1
	vec3 v_POLY_rgbToHsv1_hsv = rgb2hsv(v_POLY_floatToVec3_1_vec3);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/clamp2
	vec3 v_POLY_clamp2_val = clamp(v_POLY_rgbToHsv1_hsv, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0));
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/multAdd4
	vec3 v_POLY_multAdd4_val = (vec3(0.5, 0.5, 0.5)*(v_POLY_multAdd2_val + v_POLY_clamp2_val)) + vec3(0.0, 0.0, 0.0);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/rgbToHsv2
	vec3 v_POLY_rgbToHsv2_hsv = rgb2hsv(v_POLY_multAdd4_val);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/clamp4
	vec3 v_POLY_clamp4_val = clamp(v_POLY_rgbToHsv2_hsv, vec3(0.0, 0.0, 0.0), vec3(1.0, 0.0, 0.2));
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/hsvToRgb2
	vec3 v_POLY_hsvToRgb2_rgb = hsv2rgb(v_POLY_clamp4_val);
	
	// /particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES/output1
	diffuseColor.xyz = v_POLY_hsvToRgb2_rgb;



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