shader_type canvas_item;

uniform vec2 target_resolution = vec2(576.0, 324.0);
uniform sampler2D SCREEN_TEXTURE:hint_screen_texture;

void fragment() {
    vec2 screen_uv = SCREEN_UV;
    vec2 pixel_size = vec2(1.0) / target_resolution;
    vec2 low_res_uv = floor(screen_uv / pixel_size) * pixel_size;

    COLOR = texture(SCREEN_TEXTURE, low_res_uv);
}
