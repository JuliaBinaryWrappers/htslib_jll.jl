# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule htslib_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("htslib")
JLLWrappers.@generate_main_file("htslib", UUID("f06fe41e-9474-5571-8c61-5634d2b2700c"))
end  # module htslib_jll
