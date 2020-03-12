#                      GLSL.std.450                     main    
               
    examples/src/sprite/shader.frag  �    �     // OpModuleProcessed entry-point main
// OpModuleProcessed client vulkan100
// OpModuleProcessed target-env vulkan1.0
// OpModuleProcessed entry-point main
#line 1
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(location = 0) in vec2 uv;
layout(location = 0) out vec4 color;

layout(set = 0, binding = 0) uniform texture2D colormap;
layout(set = 0, binding = 1) uniform sampler colorsampler;


void main() {
    color = texture(sampler2D(colormap, colorsampler), uv);
}
   	 GL_ARB_separate_shader_objects   
 GL_GOOGLE_cpp_style_line_directive    GL_GOOGLE_include_directive      main      
   color        colormap         colorsampler         uv  G  
          G     "       G     !       G     "       G     !      G                 !                               	         ;  	   
       	                                          ;                              ;                                           ;           6               �                 =           =           V              =           W              >  
      �  8  