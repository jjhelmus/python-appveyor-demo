Write-Host "Installed SDKs:"
ls "C:/Program Files/Microsoft SDKs/Windows"
if ($env:PYTHON_ARCH = "64") {
  if ($env:PYTHON_VERSION.StartsWith("2")) {
    $windows_sdk_version = "v7.0"
  } else {
    $windows_sdk_version = "v7.1"
  }
  [Environment]::SetEnvironmentVariable(
    "WINDOWS_SDK_VERSION", $windows_sdk_version, "User")
  Write-Host "SDK" $env:WINDOWS_SDK_VERSION "for Python" $env:PYTHON_VERSION
} else {
  Write-Host "No SDK required for 32 bit Python builds."
}
