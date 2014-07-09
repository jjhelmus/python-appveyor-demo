Write-Host $env:PYTHON $env:PYTHON_VERSION $env:PYTHON_ARCH
ls "C:/Program Files/Microsoft SDKs/Windows"
if ($env:PYTHON_ARCH = "64") {
  if ($env:PYTHON_VERSION.StartsWith("2")) {
    $env:WINDOWS_SDK_VERSION = "v7.0"
  } else {
    $env:WINDOWS_SDK_VERSION = "v7.1"
  }
  Write-Host "SDK" $env:WINDOWS_SDK_VERSION "for Python" $env:PYTHON_VERSION
}
