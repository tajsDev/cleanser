shader_type canvas_item;

uniform vec2 target_resolution = vec2(576.0, 324.0);
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform int pixel_size : hint_range(1, 64) = 4;
uniform vec2 screen_size = vec2(1280.0, 720.0); 

void fragment() {
    vec2 screen_uv = SCREEN_UV;
   
    vec2 pixel_size_uv = vec2(1.0) / target_resolution;
    
    vec2 pixel_coords = floor(FRAGCOORD.xy / float(pixel_size)) * float(pixel_size);
    vec2 pixelated_uv = pixel_coords / screen_size;
   
    vec2 combined_uv = floor(pixelated_uv / pixel_size_uv) * pixel_size_uv;
    COLOR = texture(SCREEN_TEXTURE, combined_uv);
}

