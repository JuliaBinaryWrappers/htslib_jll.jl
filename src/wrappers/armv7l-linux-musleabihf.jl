# Autogenerated wrapper script for htslib_jll for armv7l-linux-musleabihf
export libhts, htsfile, tabix, bgzip

using Zlib_jll
using Bzip2_jll
using XZ_jll
using LibCURL_jll
using OpenSSL_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libhts`
const libhts_splitpath = ["lib", "libhts.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libhts_path = ""

# libhts-specific global declaration
# This will be filled out by __init__()
libhts_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libhts = "libhts.so.3"


# Relative path to `htsfile`
const htsfile_splitpath = ["bin", "htsfile"]

# This will be filled out by __init__() for all products, as it must be done at runtime
htsfile_path = ""

# htsfile-specific global declaration
function htsfile(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(htsfile_path)
    end
end


# Relative path to `tabix`
const tabix_splitpath = ["bin", "tabix"]

# This will be filled out by __init__() for all products, as it must be done at runtime
tabix_path = ""

# tabix-specific global declaration
function tabix(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(tabix_path)
    end
end


# Relative path to `bgzip`
const bgzip_splitpath = ["bin", "bgzip"]

# This will be filled out by __init__() for all products, as it must be done at runtime
bgzip_path = ""

# bgzip-specific global declaration
function bgzip(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(bgzip_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"htslib")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Zlib_jll.PATH_list, Bzip2_jll.PATH_list, XZ_jll.PATH_list, LibCURL_jll.PATH_list, OpenSSL_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Zlib_jll.LIBPATH_list, Bzip2_jll.LIBPATH_list, XZ_jll.LIBPATH_list, LibCURL_jll.LIBPATH_list, OpenSSL_jll.LIBPATH_list,))

    global libhts_path = normpath(joinpath(artifact_dir, libhts_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libhts_handle = dlopen(libhts_path)
    push!(LIBPATH_list, dirname(libhts_path))

    global htsfile_path = normpath(joinpath(artifact_dir, htsfile_splitpath...))

    push!(PATH_list, dirname(htsfile_path))
    global tabix_path = normpath(joinpath(artifact_dir, tabix_splitpath...))

    push!(PATH_list, dirname(tabix_path))
    global bgzip_path = normpath(joinpath(artifact_dir, bgzip_splitpath...))

    push!(PATH_list, dirname(bgzip_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

