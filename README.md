# PapyrusTweaks

Collection of tweaks and fixes for Skyrim's Papyrus engine.

Updated for Skyrim AE 1.7.x (including 1.7.104 and 1.7.704) via [alandtse/CommonLibSSE-NG](https://github.com/alandtse/CommonLibSSE-NG) v7.2.0, with Address Library format 5 support.

## Requirements
* [CMake](https://cmake.org/)
	* Add this to your `PATH`
* [PowerShell](https://github.com/PowerShell/PowerShell/releases/latest)
* [Vcpkg](https://github.com/microsoft/vcpkg)
	* Add the environment variable `VCPKG_ROOT` with the value as the path to the folder containing vcpkg
* [Visual Studio 2022](https://visualstudio.microsoft.com/)
	* Desktop development with C++

## User Requirements
* [Address Library for SKSE](https://www.nexusmods.com/skyrimspecialedition/mods/32444)
	* Needed for SSE
* [VR Address Library for SKSEVR](https://www.nexusmods.com/skyrimspecialedition/mods/58101)
	* Needed for VR

## Register Visual Studio as a Generator
* Open `x64 Native Tools Command Prompt`
* Run `cmake`
* Close the cmd window

## Building
```
git clone https://github.com/wiyiiyyuy/PapyrusTweaks.git
cd PapyrusTweaks
set VCPKG_ROOT=C:\path\to\vcpkg
set VCPKG_INSTALLATION_ROOT=%VCPKG_ROOT%
cmake --preset papyrustweaks
cmake --build build --config Release
```

The repository includes a CommonLibSSE-NG overlay port under `cmake/ports`.
It pins the `hde64` source used by the patch-safety checks and exports the
DirectXTK dependency to downstream builds.

## License
[GPL-3.0](LICENSE)
