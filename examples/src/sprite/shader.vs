#     "                 GLSL.std.450              	        main    
             
    examples/src/sprite/shader.vert  i    �     // OpModuleProcessed entry-point main
// OpModuleProcessed client vulkan100
// OpModuleProcessed target-env vulkan1.0
// OpModuleProcessed entry-point main
#line 1
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(location = 0) in vec3 pos;
layout(location = 1) in vec2 in_uv;
layout(location = 0) out vec2 uv;

void main() {
    uv = in_uv;
    gl_Position = vec4(pos, 1.0);
}
     	 GL_ARB_separate_shader_objects   
 GL_GOOGLE_cpp_style_line_directive    GL_GOOGLE_include_directive      main      
   uv       in_uv        gl_PerVertex             gl_Position         gl_PointSize            gl_ClipDistance         gl_CullDistance               pos G  
          G           H                H              H              H              G        G                 !                               	         ;  	   
                  ;                                   +                                                   ;                       +                                   ;           +          �?             6               �          	       =           >  
           
       =           Q               Q              Q              P                    A      !         >  !      �  8  