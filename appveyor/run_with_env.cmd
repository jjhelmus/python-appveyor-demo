:: To build extensions for 64 bit Python 3, we need to configure environment
:: variables to use the MSVC 2010 C++ compilers from GRMSDKX_EN_DVD.iso of:
:: MS Windows SDK for Windows 7 and .NET Framework 4
::
:: More details at:
:: https://github.com/cython/cython/wiki/64BitCythonExtensionsOnWindows

SET COMMAND_TO_RUN="%*"

IF "%PYTHON_ARCH%"=="64" (
    ECHO Configuring environment to build with MSVC on a 64bit architecture
    SET DISTUTILS_USE_SDK=1
    SET MSSdk=1
    ECHO Using Windows SDK %WINDOWS_SDK_VERSION%
    "C:\Program Files\Microsoft SDKs\Windows\%WINDOWS_SDK_VERSION%\Bin\SetEnv.cmd" /x64 /release
    ECHO Executing: %COMMAND_TO_RUN%
    call %COMMAND_TO_RUN% || EXIT 1
    ECHO OK
) ELSE (
    ECHO Using default MSVC build environment for 32bit architecture
    ECHO Executing: %COMMAND_TO_RUN%
    call %COMMAND_TO_RUN% || EXIT 1
    ECHO OK
)
