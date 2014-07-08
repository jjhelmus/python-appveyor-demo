:: To build extensions for 64 bit Python 3, we need to configure environment
:: variables to use the MSVC 2010 C++ compilers from GRMSDKX_EN_DVD.iso of:
:: MS Windows SDK for Windows 7 and .NET Framework 4
::
:: More details at:
:: https://github.com/cython/cython/wiki/64BitCythonExtensionsOnWindows

IF "%PYTHON_ARCH%"=="64" (
    ECHO Configuring environment to build with MSVC on a 64bit architecture
    IF "%PYTHON_VERSION_MAJOR%"=="2" (
        SET SDK_VERSION="v7.0"
    ) ELSE IF "%PYTHON_VERSION_MAJOR%"=="3" (
        SET SDK_VERSION="v7.1"
    ) ELSE (
        ECHO Unexpected Python major version number: %PYTHON_VERSION_MAJOR%
        EXIT 1
    )
    ECHO Using Windows SDK %SDK_VERSION% for Python %PYTHON_VERSION_MAJOR% build
    %COMSPEC% /E:ON /V:ON /K "%PROGRAMFILES%\Microsoft SDKs\Windows\%SDK_VERSION%\Bin\SetEnv.cmd"
    setenv /x64 /release
    SET DISTUTILS_USE_SDK=1
    SET MSSdk=1
) ELSE (
    ECHO Using default MSVC build environment for 32bit architecture
)
