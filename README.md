# M2Crypto Wheels

## About

This repository contains builds of M2Crypto for Windows based on [these](https://github.com/iOSForensics/pymobiledevice/issues/25#issuecomment-576119104) instructions.

If you have built your own, send a Pull Request to integrate them here so we can help others too! 🙂 🚀

## Instructions

> Steps >=7 can be simplified running the `builder.ps1` script

1. Install the latest `Build Tools for Visual Studio 2019`. See https://visualstudio.microsoft.com/downloads/ under "All Downloads" -> "Tools for Visual Studio 2019". This direct link was active as of this writing: https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16
2. In the installer, select "C++ Build Tools", install, and reboot if necessary.
3. Install the latest full (not `Light`) `OpenSSL` for your architecture (`Win64`/`Win32`). Current version as of this writing is `1.1.1d`. Make note of the directory to which you install `OpenSSL`. https://slproweb.com/products/Win32OpenSSL.html
4. In `PowerShell`, install the `Chocolatey` package manager. I used this command from their website: `Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`
5. Install `swig` with `Chocolatey` (in `PowerShell`). `choco install -r -y swig`
6. Install the `pywin32` dependency. Run `pip install pywin32`. If you have problems, try first running `pip install wheel`. To get `pip` to target a specific Python installation, try launching it using `py -[version] -m pip install [module]`. Note: you may need to use an elevated (administrator) `PowerShell` to install Python modules.
7. Get the latest `m2crypto` code. If you have `git` installed, run `git clone https://gitlab.com/m2crypto/m2crypto`. Otherwise, download and extract the code from GitLab: https://gitlab.com/m2crypto/m2crypto/-/archive/master/m2crypto-master.zip
8. Use `cd` to change into the directory `m2crypto` was cloned/extracted to.
9. Assuming `python` launches your desired Python interpreter version, run `python setup.py build --openssl="C:\Program Files\OpenSSL-Win64" --bundledlls`, replacing `C:\Program Files\OpenSSL-Win64` with the directory to which you installed `OpenSSL`. (On some systems you can use the `py` launcher to specify a Python version to use, run `py -h` for more information.)
10. Generate the installable files. `python.exe setup.py bdist_wheel bdist_wininst bdist_msi`.
11. Install the module. `cd` into the `dist` directory and run `pip install M2Crypto-0.35.2-cp38-cp38-win_amd64.whl`, replacing the filename with the generated `.whl` file. If you have problems, try first running `pip install wheel`. To get `pip` to target a specific Python installation, try launching it using `py -[version] -m pip install [module]`. Alternatively, you can run the generated `.exe` or `.msi` installer. Note: you may need to use an elevated (administrator) `PowerShell` to install Python modules.

## Special Thanks

[@tech234a](https://github.com/tech234a)