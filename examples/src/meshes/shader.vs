#     `                 GLSL.std.450                      main       4   5   9   ;   E   G   S    
    examples/src/meshes/shader.vert  �    �     // OpModuleProcessed entry-point main
// OpModuleProcessed client vulkan100
// OpModuleProcessed target-env vulkan1.0
// OpModuleProcessed entry-point main
#line 1
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(location = 0) in vec3 position;
layout(location = 1) in vec4 color;
layout(location = 2) in vec3 normal;
// vec4[4] is used instead of mat4 due to spirv-cross bug for dx12 backend
layout(location = 3) in mat4 model; // per-instance.

layout(set = 0, binding = 0) uniform Args {
    mat4 proj;
    mat4 view;
};

layout(location = 0) out vec4 frag_pos;
layout(location = 1) out vec3 frag_norm;
layout(location = 2) out vec4 frag_color;

void main() {
    mat4 model_mat = mat4(model[0], model[1], model[2], model[3]);
    frag_color = color;
    frag_norm = normalize((vec4(normal, 1.0) * model_mat).xyz);
    frag_pos = model_mat * vec4(position, 1.0);
    gl_Position = proj * view * frag_pos;
}
    	 GL_ARB_separate_shader_objects   
 GL_GOOGLE_cpp_style_line_directive    GL_GOOGLE_include_directive      main         model     4   frag_color    5   color     9   frag_norm     ;   normal    E   frag_pos      G   position      Q   gl_PerVertex      Q       gl_Position   Q      gl_PointSize      Q      gl_ClipDistance   Q      gl_CullDistance   S         T   Args      T       proj      T      view      V       G           G  4         G  5         G  9         G  ;         G  E          G  G          H  Q              H  Q            H  Q            H  Q            G  Q      H  T          H  T       #       H  T             H  T         H  T      #   @   H  T            G  T      G  V   "       G  V   !            !                              	                  	   ;                       +                        +           +           +           +          �?   3         ;  3   4      ;     5        7            8      7   ;  8   9         :      7   ;  :   ;      ;  3   E      ;  :   G        N           +  N   O        P      O     Q         P   P      R      Q   ;  R   S        T   	   	      U      T   ;  U   V         W      	   6               �                 A              =           A              =           A              =           A              =           P  	   2                           =     6   5   >  4   6               =  7   <   ;   Q     =   <       Q     >   <      Q     ?   <      P     @   =   >   ?      �     B   @   2   O  7   C   B   B               7   D      E   C   >  9   D   =  7   H   G   Q     I   H       Q     J   H      Q     K   H      P     L   I   J   K      �     M   2   L   >  E   M               A  W   X   V      =  	   Y   X   A  W   Z   V      =  	   [   Z   �  	   \   Y   [   =     ]   E   �     ^   \   ]   A  3   _   S      >  _   ^   �  8  