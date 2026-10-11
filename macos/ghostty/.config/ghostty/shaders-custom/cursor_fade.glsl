// ~/.config/ghostty/shaders-custom/cursor_fade.glsl
// Piscar suave do cursor (fade in/out). Requer Ghostty 1.3+ (iBackgroundColor).

const float PERIOD     = 1.2;  // segundos por ciclo completo
const float MIN_ALPHA  = 0.0;  // 0.0 = some por completo; 0.2 = nunca some totalmente
const float IDLE_DELAY = 0.5;  // cursor fica sólido por X s após digitar/mover

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec4 term = texture(iChannel0, uv);
    fragColor = term;

    // iCurrentCursor: xy = canto superior esquerdo (y medido de baixo p/ cima), zw = tamanho
    vec2 p = iCurrentCursor.xy;
    vec2 s = iCurrentCursor.zw;
    bool inCursor = fragCoord.x >= p.x && fragCoord.x <= p.x + s.x &&
                    fragCoord.y <= p.y && fragCoord.y >= p.y - s.y;
    if (!inCursor) return;

    float t = iTime - iTimeCursorChange;
    float a = 1.0;
    if (t > IDLE_DELAY) {
        float phase = (t - IDLE_DELAY) / PERIOD;
        a = mix(MIN_ALPHA, 1.0, 0.5 + 0.5 * cos(6.2831853 * phase));
    }

    // Esmaece só os pixels que têm a cor do cursor (preserva o texto sob o bloco)
    float isCursor = 1.0 - smoothstep(0.0, 0.3, distance(term.rgb, iCurrentCursorColor.rgb));
    fragColor.rgb = mix(term.rgb, iBackgroundColor.rgb, isCursor * (1.0 - a));
}
