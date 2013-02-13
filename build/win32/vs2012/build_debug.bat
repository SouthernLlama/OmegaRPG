@echo off

echo Building with devenv...
echo.

"c:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe" /build debug OmegaRPG.sln

if %errorlevel% == 0 goto filecheck

echo.
echo devenv not found, trying WDExpress...
echo.

"c:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\WDExpress.exe" /build debug OmegaRPG.sln

:filecheck
if not exist ".\Debug\omega.exe" (
	echo Build failed.
	echo.
	echo NOTE: This script only works if Visual Studio was installed at the default location.
	pause
	goto :end
)

CHOICE /M "Build successful! Run the game"

if %errorlevel% == 1 (
	cd Debug
	omega.exe
)

:end
