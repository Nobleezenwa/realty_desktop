#version 310 es
precision highp float;

layout(location = 0) in vec2 qt_TexCoord0;

layout(binding = 0) uniform sampler2D source;

layout(std140, binding = 1) uniform Buf {
    float qt_Opacity;
    float radius;
    vec2 size;
} ubuf;

layout(location = 0) out vec4 fragColor;

void main() {
    vec2 pos = qt_TexCoord0 * ubuf.size;

    vec2 rectMin = vec2(ubuf.radius, ubuf.radius);
    vec2 rectMax = ubuf.size - vec2(ubuf.radius, ubuf.radius);

    float dist = 0.0;
    if (pos.x < rectMin.x && pos.y < rectMin.y) {
        dist = length(pos - rectMin);
    } else if (pos.x > rectMax.x && pos.y < rectMin.y) {
        dist = length(pos - vec2(rectMax.x, rectMin.y));
    } else if (pos.x < rectMin.x && pos.y > rectMax.y) {
        dist = length(pos - vec2(rectMin.x, rectMax.y));
    } else if (pos.x > rectMax.x && pos.y > rectMax.y) {
        dist = length(pos - rectMax);
    }

    float alpha = 1.0;
    if (dist > ubuf.radius) {
        alpha = 0.0;
    }

    fragColor = texture(source, qt_TexCoord0) * ubuf.qt_Opacity * alpha;
}
