@echo off
setlocal enabledelayedexpansion

for /R %%i in (*.m4a) do (
    set "input_file=%%i"
    set "output_dir=%%~dpioutput"

    if not exist "!output_dir!" (
        echo Creating directory: "!output_dir!"
        mkdir "!output_dir!"
    )

    set "base_name=%%~ni"

    echo Processing file: "%%i"
    echo Output file: "!output_dir!\!base_name!.mp3"

    ffmpeg -i "%%i" -b:a 320k "!output_dir!\!base_name!.mp3"
)

endlocal
