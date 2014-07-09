Write-Host "Installed SDKs:"
ls "C:/Program Files/Microsoft SDKs/Windows"
if ($env:PYTHON_ARCH = "64") {
  if ($env:PYTHON_VERSION.StartsWith("2")) {
    $env:WINDOWS_SDK_VERSION = "v7.0"
  } else {
    $env:WINDOWS_SDK_VERSION = "v7.1"
  }
  Write-Host "SDK" $env:WINDOWS_SDK_VERSION "for Python" $env:PYTHON_VERSION
} else {
  Write-Host "No SDK required for 32 bit Python builds."
}
