// Vertex shader

struct VertexInput {
  @location(0) position: vec3<f32>,
  @location(1) color: vec3<f32>,
};

struct VertexOutput {
  @builtin(position) clip_position: vec4<f32>,
  @location(0) position: vec3<f32>,
};

const MAX_ITERATIONS: i32 = 10;
const MAX_SIZE: f32 = 100.0;

fn complex_square(n: vec2<f32>) -> vec2<f32> {
  return vec2<f32> (
      (n.x * n.x) + (-1.0 * n.y * n.y),
      (2.0 * n.x * n.y)
      );
}

@vertex
fn vs_main(
    model: VertexInput,
    ) -> VertexOutput {
  var out: VertexOutput;
  out.clip_position = vec4<f32>(model.position, 1.0);
  out.position = model.position;
  return out;
}

// Fragment shader

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {

  let c: vec2<f32> = vec2<f32>( in.position.x * 2.0, in.position.y * 2.0);
  var z: vec2<f32> = c;

  var i: i32 = 0;
  for (; i < MAX_ITERATIONS; i += 1) {
    z = complex_square(z) + c; 
    if ( z.x > MAX_SIZE || z.y > MAX_SIZE) {
      break;
    }
  }
  let fraction: f32 = f32(i) / f32(MAX_ITERATIONS);
  return vec4<f32>(fraction, fraction, fraction, 1.0);
}
