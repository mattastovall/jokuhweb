#include <common>

// removed:
//// INSERT DEFINE



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

// /particles1/particlesSystemGpu1/maxLength1
//
//
// CLAMP_LENGTH
//
//
float maxLength(float val, float max_l){
	return min(val, max_l);
}
vec2 maxLength(vec2 val, float max_l){
	float vec_length = length(val);
	if(vec_length == 0.0){
		return val;
	} else {
		float new_length = min(vec_length, max_l);
		return new_length * normalize(val);
	}
}
vec3 maxLength(vec3 val, float max_l){
	float vec_length = length(val);
	if(vec_length == 0.0){
		return val;
	} else {
		float new_length = min(vec_length, max_l);
		return new_length * normalize(val);
	}
}
vec4 maxLength(vec4 val, float max_l){
	float vec_length = length(val);
	if(vec_length == 0.0){
		return val;
	} else {
		float new_length = min(vec_length, max_l);
		return new_length * normalize(val);
	}
}


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

// /particles1/particlesSystemGpu1/complement1
float complement(float x){return 1.0-x;}
vec2 complement(vec2 x){return vec2(1.0-x.x, 1.0-x.y);}
vec3 complement(vec3 x){return vec3(1.0-x.x, 1.0-x.y, 1.0-x.z);}
vec4 complement(vec4 x){return vec4(1.0-x.x, 1.0-x.y, 1.0-x.z, 1.0-x.w);}








// /particles1/particlesSystemGpu1/attribute1
uniform sampler2D texture_instancePosition_x_state;

// /particles1/particlesSystemGpu1/globals1
uniform sampler2D texture_velocity;

// /particles1/particlesSystemGpu1/velocity
uniform vec3 v_POLY_param_velocity;

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
	
	// /particles1/particlesSystemGpu1/globals1
	vec3 v_POLY_globals1_velocity = texture2D( texture_velocity, particleUv ).xyz;
	
	// /particles1/particlesSystemGpu1/velocity
	vec3 v_POLY_velocity_val = v_POLY_param_velocity;
	
	// /particles1/particlesSystemGpu1/cursor
	vec3 v_POLY_cursor_val = v_POLY_param_cursor;
	
	// /particles1/particlesSystemGpu1/attribute3
	float v_POLY_attribute3_val = texture2D( texture_restP_x_id, particleUv ).w;
	
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
	vec3 v_POLY_multScalar1_val = (0.9*v_POLY_globals1_velocity);
	
	// /particles1/particlesSystemGpu1/floatToVec2_1
	vec2 v_POLY_floatToVec2_1_vec2 = vec2(v_POLY_attribute3_val, 3.8);
	
	// /particles1/particlesSystemGpu1/floatToVec2_2
	vec2 v_POLY_floatToVec2_2_vec2 = vec2(v_POLY_attribute3_val, 3.92);
	
	// /particles1/particlesSystemGpu1/distance1
	float v_POLY_distance1_val = distance(v_POLY_null2_val, v_POLY_cursor_val);
	
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
	vec3 v_POLY_mix1_mix = mix(v_POLY_multScalar1_val, v_POLY_velocity_val, v_POLY_mult1_product);
	
	// /particles1/particlesSystemGpu1/subtract1
	float v_POLY_subtract1_subtract = (v_POLY_add2_sum - 0.01);
	
	// /particles1/particlesSystemGpu1/maxLength1
	vec3 v_POLY_maxLength1_val = maxLength(v_POLY_mix1_mix, 4.0);
	
	// /particles1/particlesSystemGpu1/clamp1
	float v_POLY_clamp1_val = clamp(v_POLY_subtract1_subtract, 0.0, 1.0);
	
	// /particles1/particlesSystemGpu1/acceleration1
	vec3 v_POLY_acceleration1_velocity = velFromAccel(v_POLY_maxLength1_val, vec3(0.0, 0.0, 0.0), 1.0, delta_time);
	vec3 v_POLY_acceleration1_position = posFromVel(v_POLY_null1_val, v_POLY_acceleration1_velocity, delta_time);
	
	// /particles1/particlesSystemGpu1/complement1
	float v_POLY_complement1_val = complement(v_POLY_clamp1_val);
	
	// /particles1/particlesSystemGpu1/attribute_state_OUT
	gl_FragColor.w = v_POLY_clamp1_val;
	
	// /particles1/particlesSystemGpu1/multAdd2
	float v_POLY_multAdd2_val = (0.06*(v_POLY_complement1_val + v_POLY_fitFrom01_1_val)) + 0.0;
	
	// /particles1/particlesSystemGpu1/mix2
	vec3 v_POLY_mix2_mix = mix(v_POLY_acceleration1_position, v_POLY_attribute4_val, v_POLY_multAdd2_val);
	
	// /particles1/particlesSystemGpu1/attribute2
	gl_FragColor.xyz = v_POLY_mix2_mix;




}