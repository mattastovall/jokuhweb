#include <common>

// removed:
//// INSERT DEFINE



// /particles1/particlesSystemGpu1/noise4
// Modulo 289 without a division (only multiplications)
float mod289(float x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}
vec2 mod289(vec2 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}
vec3 mod289(vec3 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}
vec4 mod289(vec4 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}
// Modulo 7 without a division
vec3 mod7(vec3 x) {
  return x - floor(x * (1.0 / 7.0)) * 7.0;
}

// Permutation polynomial: (34x^2 + x) mod 289
float permute(float x) {
     return mod289(((x*34.0)+1.0)*x);
}
vec3 permute(vec3 x) {
  return mod289((34.0 * x + 1.0) * x);
}
vec4 permute(vec4 x) {
     return mod289(((x*34.0)+1.0)*x);
}

float taylorInvSqrt(float r)
{
  return 1.79284291400159 - 0.85373472095314 * r;
}
vec4 taylorInvSqrt(vec4 r)
{
  return 1.79284291400159 - 0.85373472095314 * r;
}

vec2 fade(vec2 t) {
  return t*t*t*(t*(t*6.0-15.0)+10.0);
}
vec3 fade(vec3 t) {
  return t*t*t*(t*(t*6.0-15.0)+10.0);
}
vec4 fade(vec4 t) {
  return t*t*t*(t*(t*6.0-15.0)+10.0);
}
//
// Description : Array and textureless GLSL 2D/3D/4D simplex 
//               noise functions.
//      Author : Ian McEwan, Ashima Arts.
//  Maintainer : stegu
//     Lastmod : 20110822 (ijm)
//     License : Copyright (C) 2011 Ashima Arts. All rights reserved.
//               Distributed under the MIT License. See LICENSE file.
//               https://github.com/ashima/webgl-noise
//               https://github.com/stegu/webgl-noise
// 



float snoise(vec3 v)
  { 
  const vec2  C = vec2(1.0/6.0, 1.0/3.0) ;
  const vec4  D = vec4(0.0, 0.5, 1.0, 2.0);

// First corner
  vec3 i  = floor(v + dot(v, C.yyy) );
  vec3 x0 =   v - i + dot(i, C.xxx) ;

// Other corners
  vec3 g = step(x0.yzx, x0.xyz);
  vec3 l = 1.0 - g;
  vec3 i1 = min( g.xyz, l.zxy );
  vec3 i2 = max( g.xyz, l.zxy );

  //   x0 = x0 - 0.0 + 0.0 * C.xxx;
  //   x1 = x0 - i1  + 1.0 * C.xxx;
  //   x2 = x0 - i2  + 2.0 * C.xxx;
  //   x3 = x0 - 1.0 + 3.0 * C.xxx;
  vec3 x1 = x0 - i1 + C.xxx;
  vec3 x2 = x0 - i2 + C.yyy; // 2.0*C.x = 1/3 = C.y
  vec3 x3 = x0 - D.yyy;      // -1.0+3.0*C.x = -0.5 = -D.y

// Permutations
  i = mod289(i); 
  vec4 p = permute( permute( permute( 
             i.z + vec4(0.0, i1.z, i2.z, 1.0 ))
           + i.y + vec4(0.0, i1.y, i2.y, 1.0 )) 
           + i.x + vec4(0.0, i1.x, i2.x, 1.0 ));

// Gradients: 7x7 points over a square, mapped onto an octahedron.
// The ring size 17*17 = 289 is close to a multiple of 49 (49*6 = 294)
  float n_ = 0.142857142857; // 1.0/7.0
  vec3  ns = n_ * D.wyz - D.xzx;

  vec4 j = p - 49.0 * floor(p * ns.z * ns.z);  //  mod(p,7*7)

  vec4 x_ = floor(j * ns.z);
  vec4 y_ = floor(j - 7.0 * x_ );    // mod(j,N)

  vec4 x = x_ *ns.x + ns.yyyy;
  vec4 y = y_ *ns.x + ns.yyyy;
  vec4 h = 1.0 - abs(x) - abs(y);

  vec4 b0 = vec4( x.xy, y.xy );
  vec4 b1 = vec4( x.zw, y.zw );

  //vec4 s0 = vec4(lessThan(b0,0.0))*2.0 - 1.0;
  //vec4 s1 = vec4(lessThan(b1,0.0))*2.0 - 1.0;
  vec4 s0 = floor(b0)*2.0 + 1.0;
  vec4 s1 = floor(b1)*2.0 + 1.0;
  vec4 sh = -step(h, vec4(0.0));

  vec4 a0 = b0.xzyw + s0.xzyw*sh.xxyy ;
  vec4 a1 = b1.xzyw + s1.xzyw*sh.zzww ;

  vec3 p0 = vec3(a0.xy,h.x);
  vec3 p1 = vec3(a0.zw,h.y);
  vec3 p2 = vec3(a1.xy,h.z);
  vec3 p3 = vec3(a1.zw,h.w);

//Normalise gradients
  vec4 norm = taylorInvSqrt(vec4(dot(p0,p0), dot(p1,p1), dot(p2, p2), dot(p3,p3)));
  p0 *= norm.x;
  p1 *= norm.y;
  p2 *= norm.z;
  p3 *= norm.w;

// Mix final noise value
  vec4 m = max(0.6 - vec4(dot(x0,x0), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.0);
  m = m * m;
  return 42.0 * dot( m*m, vec4( dot(p0,x0), dot(p1,x1), 
                                dot(p2,x2), dot(p3,x3) ) );
  }


float fbm_snoise_particles1_particlesSystemGpu1_noise4(in vec3 st) {
	float value = 0.0;
	float amplitude = 1.0;
	for (int i = 0; i < 1; i++) {
		value += amplitude * snoise(st);
		st *= 7.2;
		amplitude *= 0.5;
	}
	return value;
}


// /particles1/particlesSystemGpu1/easing3
#ifndef HALF_PI
#define HALF_PI 1.5707963267948966
#endif

float elasticInOut(float t) {
  return t < 0.5
    ? 0.5 * sin(+13.0 * HALF_PI * 2.0 * t) * pow(2.0, 10.0 * (2.0 * t - 1.0))
    : 0.5 * sin(-13.0 * HALF_PI * ((2.0 * t - 1.0) + 1.0)) * pow(2.0, -10.0 * (2.0 * t - 1.0)) + 1.0;
}



// /particles1/particlesSystemGpu1/noise2

float fbm_snoise_particles1_particlesSystemGpu1_noise2(in vec3 st) {
	float value = 0.0;
	float amplitude = 1.0;
	for (int i = 0; i < 7; i++) {
		value += amplitude * snoise(st);
		st *= 2.0;
		amplitude *= 0.5;
	}
	return value;
}


// /particles1/particlesSystemGpu1/fitFrom01_1
//
//
// FIT
//
//
float fit(float val, float srcMin, float srcMax, float destMin, float destMax){
	float src_range = srcMax - srcMin;
	float dest_range = destMax - destMin;

	float r = (val - srcMin) / src_range;
	return (r * dest_range) + destMin;
}
vec2 fit(vec2 val, vec2 srcMin, vec2 srcMax, vec2 destMin, vec2 destMax){
	return vec2(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y)
	);
}
vec3 fit(vec3 val, vec3 srcMin, vec3 srcMax, vec3 destMin, vec3 destMax){
	return vec3(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y),
		fit(val.z, srcMin.z, srcMax.z, destMin.z, destMax.z)
	);
}
vec4 fit(vec4 val, vec4 srcMin, vec4 srcMax, vec4 destMin, vec4 destMax){
	return vec4(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y),
		fit(val.z, srcMin.z, srcMax.z, destMin.z, destMax.z),
		fit(val.w, srcMin.w, srcMax.w, destMin.w, destMax.w)
	);
}

//
//
// FIT TO 01
// fits the range [srcMin, srcMax] to [0, 1]
//
float fitTo01(float val, float srcMin, float srcMax){
	float size = srcMax - srcMin;
	return (val - srcMin) / size;
}
vec2 fitTo01(vec2 val, vec2 srcMin, vec2 srcMax){
	return vec2(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y)
	);
}
vec3 fitTo01(vec3 val, vec3 srcMin, vec3 srcMax){
	return vec3(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y),
		fitTo01(val.z, srcMin.z, srcMax.z)
	);
}
vec4 fitTo01(vec4 val, vec4 srcMin, vec4 srcMax){
	return vec4(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y),
		fitTo01(val.z, srcMin.z, srcMax.z),
		fitTo01(val.w, srcMin.w, srcMax.w)
	);
}

//
//
// FIT FROM 01
// fits the range [0, 1] to [destMin, destMax]
//
float fitFrom01(float val, float destMin, float destMax){
	return fit(val, 0.0, 1.0, destMin, destMax);
}
vec2 fitFrom01(vec2 val, vec2 srcMin, vec2 srcMax){
	return vec2(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y)
	);
}
vec3 fitFrom01(vec3 val, vec3 srcMin, vec3 srcMax){
	return vec3(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y),
		fitFrom01(val.z, srcMin.z, srcMax.z)
	);
}
vec4 fitFrom01(vec4 val, vec4 srcMin, vec4 srcMax){
	return vec4(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y),
		fitFrom01(val.z, srcMin.z, srcMax.z),
		fitFrom01(val.w, srcMin.w, srcMax.w)
	);
}

//
//
// FIT FROM 01 TO VARIANCE
// fits the range [0, 1] to [center - variance, center + variance]
//
float fitFrom01ToVariance(float val, float center, float variance){
	return fitFrom01(val, center - variance, center + variance);
}
vec2 fitFrom01ToVariance(vec2 val, vec2 center, vec2 variance){
	return vec2(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y)
	);
}
vec3 fitFrom01ToVariance(vec3 val, vec3 center, vec3 variance){
	return vec3(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y),
		fitFrom01ToVariance(val.z, center.z, variance.z)
	);
}
vec4 fitFrom01ToVariance(vec4 val, vec4 center, vec4 variance){
	return vec4(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y),
		fitFrom01ToVariance(val.z, center.z, variance.z),
		fitFrom01ToVariance(val.w, center.w, variance.w)
	);
}

// /particles1/particlesSystemGpu1/noise1

float fbm_snoise_particles1_particlesSystemGpu1_noise1(in vec3 st) {
	float value = 0.0;
	float amplitude = 1.0;
	for (int i = 0; i < 2; i++) {
		value += amplitude * snoise(st);
		st *= 9.0;
		amplitude *= 0.1;
	}
	return value;
}


// /particles1/particlesSystemGpu1/complement1
float complement(float x){return 1.0-x;}
vec2 complement(vec2 x){return vec2(1.0-x.x, 1.0-x.y);}
vec3 complement(vec3 x){return vec3(1.0-x.x, 1.0-x.y, 1.0-x.z);}
vec4 complement(vec4 x){return vec4(1.0-x.x, 1.0-x.y, 1.0-x.z, 1.0-x.w);}


// /particles1/particlesSystemGpu1/acceleration1
float velFromAccel(float vel, float force, float mass, float time_delta){
	float impulse = (time_delta * mass) * force;
	return vel + impulse;
}
vec2 velFromAccel(vec2 vel, vec2 force, float mass, float time_delta){
	vec2 impulse = (time_delta * mass) * force;
	return vel + impulse;
}
vec3 velFromAccel(vec3 vel, vec3 force, float mass, float time_delta){
	vec3 impulse = (time_delta * mass) * force;
	return vel + impulse;
}
vec4 velFromAccel(vec4 vel, vec4 force, float mass, float time_delta){
	vec4 impulse = (time_delta * mass) * force;
	return vel + impulse;
}
float posFromVel(float position, float velocity, float time_delta){
	return position + (time_delta * velocity);
}
vec2 posFromVel(vec2 position, vec2 velocity, float time_delta){
	return position + (time_delta * velocity);
}
vec3 posFromVel(vec3 position, vec3 velocity, float time_delta){
	return position + (time_delta * velocity);
}
vec4 posFromVel(vec4 position, vec4 velocity, float time_delta){
	return position + (time_delta * velocity);
}

// /particles1/particlesSystemGpu1/easing4

float bounceOut(float t) {
  const float a = 4.0 / 11.0;
  const float b = 8.0 / 11.0;
  const float c = 9.0 / 10.0;

  const float ca = 4356.0 / 361.0;
  const float cb = 35442.0 / 1805.0;
  const float cc = 16061.0 / 1805.0;

  float t2 = t * t;

  return t < a
    ? 7.5625 * t2
    : t < b
      ? 9.075 * t2 - 9.9 * t + 3.4
      : t < c
        ? ca * t2 - cb * t + cc
        : 10.8 * t * t - 20.52 * t + 10.72;
}



float bounceIn(float t) {
  return 1.0 - bounceOut(1.0 - t);
}









// /particles1/particlesSystemGpu1/attribute1
uniform sampler2D texture_instancePosition_x_state;

// /particles1/particlesSystemGpu1/velocity
uniform vec3 v_POLY_param_velocity;

// /particles1/particlesSystemGpu1/vel_pos
uniform vec3 v_POLY_param_vel_pos;

// /particles1/particlesSystemGpu1/cursor
uniform vec3 v_POLY_param_cursor;

// /particles1/particlesSystemGpu1/attribute3
uniform sampler2D texture_restP_x_id;

// /particles1/particlesSystemGpu1/ramp1
uniform sampler2D v_POLY_ramp_ramp1;

// /particles1/particlesSystemGpu1/acceleration1
uniform float delta_time;





void main() {

	vec2 particleUv = (gl_FragCoord.xy / resolution.xy);

// removed:
//	// INSERT BODY



	// /particles1/particlesSystemGpu1/attribute1
	vec3 v_POLY_attribute1_val = texture2D( texture_instancePosition_x_state, particleUv ).xyz;
	gl_FragColor.xyz = v_POLY_attribute1_val;
	
	// /particles1/particlesSystemGpu1/velocity
	vec3 v_POLY_velocity_val = v_POLY_param_velocity;
	
	// /particles1/particlesSystemGpu1/vel_pos
	vec3 v_POLY_vel_pos_val = v_POLY_param_vel_pos;
	
	// /particles1/particlesSystemGpu1/cursor
	vec3 v_POLY_cursor_val = v_POLY_param_cursor;
	
	// /particles1/particlesSystemGpu1/attribute3
	float v_POLY_attribute3_val = texture2D( texture_restP_x_id, particleUv ).w;
	
	// /particles1/particlesSystemGpu1/noise4
	float v_POLY_noise4_noisex = (vec3(1.0, 1.0, 1.0)*fbm_snoise_particles1_particlesSystemGpu1_noise4((vec3(0.0, 0.0, 0.0)*vec3(1.0, 1.0, 1.0))+(vec3(0.0, 0.0, 0.0)+vec3(0.0, 0.0, 0.0)))).x;
	float v_POLY_noise4_noisey = (vec3(1.0, 1.0, 1.0)*fbm_snoise_particles1_particlesSystemGpu1_noise4((vec3(0.0, 0.0, 0.0)*vec3(1.0, 1.0, 1.0))+(vec3(0.0, 0.0, 0.0)+vec3(1000.0, 1000.0, 1000.0)))).y;
	float v_POLY_noise4_noisez = (vec3(1.0, 1.0, 1.0)*fbm_snoise_particles1_particlesSystemGpu1_noise4((vec3(0.0, 0.0, 0.0)*vec3(1.0, 1.0, 1.0))+(vec3(0.0, 0.0, 0.0)+vec3(2000.0, 2000.0, 2000.0)))).z;
	vec3 v_POLY_noise4_noise = vec3(v_POLY_noise4_noisex, v_POLY_noise4_noisey, v_POLY_noise4_noisez);
	
	// /particles1/particlesSystemGpu1/attribute4
	vec3 v_POLY_attribute4_val = texture2D( texture_restP_x_id, particleUv ).xyz;
	
	// /particles1/particlesSystemGpu1/attribute_state_IN
	float v_POLY_attribute_state_IN_val = texture2D( texture_instancePosition_x_state, particleUv ).w;
	gl_FragColor.w = v_POLY_attribute_state_IN_val;
	
	// /particles1/particlesSystemGpu1/null1
	vec3 v_POLY_null1_val = v_POLY_attribute1_val;
	
	// /particles1/particlesSystemGpu1/null2
	vec3 v_POLY_null2_val = v_POLY_attribute1_val;
	
	// /particles1/particlesSystemGpu1/multScalar1
	vec3 v_POLY_multScalar1_val = (20.0*v_POLY_velocity_val);
	
	// /particles1/particlesSystemGpu1/easing3
	vec3 v_POLY_easing3_out = vec3(elasticInOut(v_POLY_vel_pos_val.x), elasticInOut(v_POLY_vel_pos_val.y), elasticInOut(v_POLY_vel_pos_val.z));
	
	// /particles1/particlesSystemGpu1/vec3ToFloat2
	float v_POLY_vec3ToFloat2_x = v_POLY_vel_pos_val.x;
	
	// /particles1/particlesSystemGpu1/noise2
	float v_POLY_noise2_noise = 1.0*fbm_snoise_particles1_particlesSystemGpu1_noise2((vec3(0.0, 0.0, 0.0)*vec3(1.0, 1.0, 1.0))+v_POLY_cursor_val);
	
	// /particles1/particlesSystemGpu1/floatToVec2_1
	vec2 v_POLY_floatToVec2_1_vec2 = vec2(v_POLY_attribute3_val, 3.8);
	
	// /particles1/particlesSystemGpu1/floatToVec2_2
	vec2 v_POLY_floatToVec2_2_vec2 = vec2(v_POLY_attribute3_val, 3.92);
	
	// /particles1/particlesSystemGpu1/distance1
	float v_POLY_distance1_val = distance(v_POLY_null2_val, v_POLY_cursor_val);
	
	// /particles1/particlesSystemGpu1/multScalar2
	vec3 v_POLY_multScalar2_val = (v_POLY_noise2_noise*v_POLY_easing3_out);
	
	// /particles1/particlesSystemGpu1/random1
	float v_POLY_random1_rand = rand(v_POLY_floatToVec2_1_vec2);
	
	// /particles1/particlesSystemGpu1/random2
	float v_POLY_random2_rand = rand(v_POLY_floatToVec2_2_vec2);
	
	// /particles1/particlesSystemGpu1/ramp1
	float v_POLY_ramp1_val = texture2D(v_POLY_ramp_ramp1, vec2(v_POLY_distance1_val, 0.0)).x;
	
	// /particles1/particlesSystemGpu1/fitFrom01_1
	float v_POLY_fitFrom01_1_val = fitFrom01(v_POLY_random2_rand, 0.04, 0.13);
	
	// /particles1/particlesSystemGpu1/mult1
	float v_POLY_mult1_product = (v_POLY_ramp1_val * v_POLY_random1_rand * 1.0);
	
	// /particles1/particlesSystemGpu1/add2
	float v_POLY_add2_sum = (v_POLY_attribute_state_IN_val + v_POLY_ramp1_val + 0.0);
	
	// /particles1/particlesSystemGpu1/mix1
	vec3 v_POLY_mix1_mix = mix(v_POLY_multScalar1_val, v_POLY_multScalar2_val, v_POLY_mult1_product);
	
	// /particles1/particlesSystemGpu1/subtract1
	float v_POLY_subtract1_subtract = (v_POLY_add2_sum - v_POLY_vec3ToFloat2_x - 0.0);
	
	// /particles1/particlesSystemGpu1/multScalar3
	vec3 v_POLY_multScalar3_val = (6.0*v_POLY_mix1_mix);
	
	// /particles1/particlesSystemGpu1/clamp1
	float v_POLY_clamp1_val = clamp(v_POLY_subtract1_subtract, 0.0, 2.0);
	
	// /particles1/particlesSystemGpu1/noise1
	float v_POLY_noise1_noisex = (v_POLY_multScalar3_val*fbm_snoise_particles1_particlesSystemGpu1_noise1((vec3(0.0, 0.0, 0.0)*vec3(3.0, 3.0, 3.0))+(vec3(0.0, 0.0, 0.0)+vec3(0.0, 0.0, 0.0)))).x;
	float v_POLY_noise1_noisey = (v_POLY_multScalar3_val*fbm_snoise_particles1_particlesSystemGpu1_noise1((vec3(0.0, 0.0, 0.0)*vec3(3.0, 3.0, 3.0))+(vec3(0.0, 0.0, 0.0)+vec3(1000.0, 1000.0, 1000.0)))).y;
	float v_POLY_noise1_noisez = (v_POLY_multScalar3_val*fbm_snoise_particles1_particlesSystemGpu1_noise1((vec3(0.0, 0.0, 0.0)*vec3(3.0, 3.0, 3.0))+(vec3(0.0, 0.0, 0.0)+vec3(2000.0, 2000.0, 2000.0)))).z;
	vec3 v_POLY_noise1_noise = vec3(v_POLY_noise1_noisex, v_POLY_noise1_noisey, v_POLY_noise1_noisez);
	
	// /particles1/particlesSystemGpu1/complement1
	float v_POLY_complement1_val = complement(v_POLY_clamp1_val);
	
	// /particles1/particlesSystemGpu1/attribute_state_OUT
	gl_FragColor.w = v_POLY_clamp1_val;
	
	// /particles1/particlesSystemGpu1/acceleration1
	vec3 v_POLY_acceleration1_velocity = velFromAccel(v_POLY_noise1_noise, v_POLY_noise4_noise, 0.1, delta_time);
	vec3 v_POLY_acceleration1_position = posFromVel(v_POLY_null1_val, v_POLY_acceleration1_velocity, delta_time);
	
	// /particles1/particlesSystemGpu1/multAdd2
	float v_POLY_multAdd2_val = (0.04*(v_POLY_complement1_val + v_POLY_fitFrom01_1_val)) + 0.0;
	
	// /particles1/particlesSystemGpu1/easing4
	float v_POLY_easing4_out = bounceIn(v_POLY_multAdd2_val);
	
	// /particles1/particlesSystemGpu1/mix2
	vec3 v_POLY_mix2_mix = mix(v_POLY_acceleration1_position, v_POLY_attribute4_val, v_POLY_easing4_out);
	
	// /particles1/particlesSystemGpu1/attribute2
	gl_FragColor.xyz = v_POLY_mix2_mix;




}