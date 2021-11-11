# Autogenerated wrapper script for htslib_jll for x86_64-unknown-freebsd
export bgzip, htsfile, libhts, tabix

using Zlib_jll
using Bzip2_jll
using XZ_jll
using LibCURL_jll
using OpenSSL_jll
JLLWrappers.@generate_wrapper_header("htslib")
JLLWrappers.@declare_executable_product(bgzip)
JLLWrappers.@declare_executable_product(htsfile)
JLLWrappers.@declare_library_product(libhts, "libhts.so.3")
JLLWrappers.@declare_executable_product(tabix)
function __init__()
    JLLWrappers.@generate_init_header(Zlib_jll, Bzip2_jll, XZ_jll, LibCURL_jll, OpenSSL_jll)
    JLLWrappers.@init_executable_product(
        bgzip,
        "bin/bgzip",
    )

    JLLWrappers.@init_executable_product(
        htsfile,
        "bin/htsfile",
    )

    JLLWrappers.@init_library_product(
        libhts,
        "lib/libhts.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        tabix,
        "bin/tabix",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
