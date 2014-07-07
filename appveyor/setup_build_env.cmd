:: To build extensions for 64 bit Python 3, we need to configure environment
:: variables to use the MSVC 2010 C++ compilers from GRMSDKX_EN_DVD.iso of:
:: MS Windows SDK for Windows 7 and .NET Framework 4
::
:: More details at:
:: https://github.com/cython/cython/wiki/64BitCythonExtensionsOnWindows

IF "%PYTHON_ARCH%"=="64" (
    ECHO "Configuring environment to build with 64bit MSVC++"
    SET DISTUTILS_USE_SDK=1
    IF "%PYTHON_VERSION:~,1"=="2" (
        ECHO "Using Windows SDK v7.0 for Python 2 compatible build"
        "C:\Program Files\Microsoft SDKs\Windows\v7.0\Bin\SetEnv.Cmd" /x64 /release
    ) ELSE (
        ECHO "Using Windows SDK v7.1 for Python 3 compatible build"
        "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /x64 /release
    )
) ELSE (
    ECHO "Using default MSVC build environment for 32bit MSVC++"
)
