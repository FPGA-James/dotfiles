<!-- Improved compatibility of back to top link: See: https://github.com/FPGA-James/dotfiles/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the dotfiles. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
<!---
[![Stars][stars-shield]][stars-url]
[![Forks][Forks-shield]][Forks-url]
[![Issues][issues-shield]][issues-url]
[![Contributions][contributors-shield]][contributors-url]
![Size][stars-shield]
[![License][license-shield]][license-url]
<br> 
[![LinkedIn][linkedin-shield]][linkedin-url]
[![Twitter][twitter_logo]][twitter_url]
-->
<p align="center">
    <a href="https://github.com/FPGA-James/dotfiles/stargazers">
    <img
        alt="Stars"
        src="https://img.shields.io/github/stars/FPGA-James/dotfiles?colorA=363A4F&colorB=B7BDF8&logo=adafruit&logoColor=D9E0EE&style=for-the-badge">
    </a>
     <img
        alt="Forks"
        src="https://img.shields.io/github/forks/FPGA-James/dotfiles?colorA=363A4F&colorB=DDB6F2&logo=gitlfs&logoColor=D9E0EE&style=for-the-badge">
    </a>
    <a href="https://github.com/FPGA-James/dotfiles/issues">
    <img
        alt="Issues"
        src="https://img.shields.io/github/issues-raw/FPGA-James/dotfiles?colorA=363A4f&colorB=F5A97F&logo=github&logoColor=D9E0EE&style=for-the-badge">
    </a>
    <a href="https://github.com/FPGA-James/dotfiles/graphs/contributors">
    <img
        alt="Contributors"
        src="https://img.shields.io/github/contributors/FPGA-James/dotfiles?colorA=363A4F&colorB=B5E8E0&logo=git&logoColor=D9E0EE&style=for-the-badge">
    </a>
    <img
        alt="Code Size"
        src="https://img.shields.io/github/languages/code-size/FPGA-James/dotfiles?colorA=363A4F&colorB=B7BDF8&logo=adafruit&logoColor=D9E0EE&style=for-the-badge">
    </a>
    <img
        alt="License"
        src="https://img.shields.io/github/license/FPGA-James/dotfiles?colorA=363A4F&colorB=DDB6F2&logo=gitlfs&logoColor=D9E0EE&style=for-the-badge">
    <br>
    </a href="https://twitter.com/FpgaJ">
    <img
        alt="Twitter"
        src="https://img.shields.io/twitter/url?color=F5A97F&label=%40FPGA-James&logo=twitter&logoColor=F5A97F&style=for-the-badge&url=https%3A%2F%2Ftwitter.com%2FFpgaJ">
    <a>
    <img
        alt="Linked in"
        src="https://img.shields.io/twitter/url?color=B5E8E0&label=FPGA-James&logo=Linkedin&logoColor=B5E8E0&style=for-the-badge&url=https%3A%2F%2Fwww.linkedin.com%2Fin%2Fjames-fleeting-8a2b4b76%2F">
</p>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/FPGA-James/dotfiles/tree/main/nvim">
    <img src="https://github.com/FPGA-James/dotfiles/blob/main/images/dotfiles.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">dotfiles</h3>

  <p align="center">
    My Neovim configuration for HDL Development!
    <br />
    <a href="https://github.com/FPGA-James/dotfiles"><strong>Explore the docs »</strong></a>
    <br />
    <a href="https://github.com/FPGA-James/dotfiles">View Demo</a>
    ·
    <a href="https://github.com/FPGA-James/dotfiles/issues">Report Bug</a>
    ·
    <a href="https://github.com/FPGA-James/dotfiles/issues">Request Feature</a>
  </p>
</div>

<!---
<h1 align="center">
    NVIM Config aimed at HDL Development
    <br>
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
    <img
        alt="NeoVim Version Capability"
        src="https://img.shields.io/badge/Supports%20Nvim-v0.8-A6D895?style=for-the-badge&colorA=363A4F&logo=neovim&logoColor=D9E0EE">
    </a>
    <a href="https://github.com/FPGA-James/dotfiles/releases">
    <img
        alt="Release"
        src="https://img.shields.io/github/v/release/FPGA-James/dotfiles.svg?style=for-the-badge&logo=github&color=F2CDCD&logoColor=D9E0EE&labelColor=363A4F">
    </a>
</h1>
<br>
-->

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
        <ul>
        <li><a href="#features">Features</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#configuration-and-Usage">Configuration and Usage</a>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<br>

## About The Project

This repo hosts my [NeoVim](https://neovim.io/) configuration for Linux. `init.lua` is the config entry point.

The config is working on nvim 0.9 stable

I use [packer.nvim](https://github.com/wbthomason/packer.nvim) to manage plugins.

### Features
- **Modern.** Pure `lua` config.
- **Modular.** Easy to customize.
- **Powerful.** Full functionality to code.

## Installation
TODO - Add scripts to automate the install on Linux/ Windows

- **Windows** TODO
- **\*nix** TODO

## Configuration and Usage

<h3 align="center">
    🗺️ Keybindings
</h3>
<p align="center">Refer to <a href="https://github.com/FPGA-James/dotfiles/wiki/Keymaps" rel="nofollow">Wiki: Keybindings</a></p>
<br>

<h3 align="center">
    🔌 Plugins & Deps
</h3>
<p align="center">Refer to <a href="https://github.com/FPGA-James/dotfiles/wiki/Plugins" rel="nofollow">Wiki: Plugins</a></p>
<br>

<h3 align="center">
    🔧 Usage & Customization
</h3>
<p align="center">Refer to <a href="https://github.com/FPGA-James/dotfiles/issues"
rel="nofollow">Wiki: Usage</a></p>
<br>

<h3 align="center">
    🤔 FAQ
</h3>
<p align="center">Refer to <a href="https://github.com/FPGA-James/dotfiles/wiki/Issues" rel="nofollow">Wiki: FAQ</a></p>

## ✨ Features
<!---
<> <h3 align="center">
<>    ⏱️  Startup Time
<> </h3>
<>
<> <p align="center">
<>  <img src="https://raw.githubusercontent.com/FPGA-James/blog-imgs/main/startuptime.png"
<>  width = "80%"
<>  alt = "StartupTime"
<>  />
<> </p>
<>
<> <p align="center">
<>   <img src="https://raw.githubusercontent.com/FPGA-James/blog-imgs/main/vimstartup.png"
<>   width = "60%"
<>   alt = "Vim-StartupTime"
<>   />
<> </p>
<> 
<> > Tested with [rhysd/vim-startuptime](https://github.com/rhysd/vim-startuptime)
-->
<h3 align="center">
    📸 Screenshots
</h3>

<p align="center">
    <img src="https://raw.githubusercontent.com/FPGA-James/blog-imgs/main/dashboard.png" alt="Dashboard">
    <em>Dashboard</em>
</p>
<br>

<p align="center">
    <img src="https://raw.githubusercontent.com/FPGA-James/blog-imgs/main/telescope.png" alt="Telescope">
    <em>Telescope</em>
</p>
<br>

<p align="center">
    <img src="https://raw.githubusercontent.com/FPGA-James/blog-imgs/main/coding.png" alt="Coding">
    <em>Coding</em>
</p>
<br>


<p align="center">
    <img src="https://raw.githubusercontent.com/FPGA-James/blog-imgs/main/gitui.png" alt="git">
    <em>git with built-in Terminal</em>
</p>
<br>

<p align="center">
    <img src="https://raw.githubusercontent.com/FPGA-James/blog-imgs/main/legendary.png" alt="Legendary">
    <em>Command quickref</em>
</p>


<!-- ROADMAP -->
## Roadmap
- [x] Add Changelog
- [x] Add back to top links
- [ ] Add information to the Wiki Pages
- [ ] Add lazyt load configuration


See the [open issues](https://github.com/FPGA-James/dotfiles/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- CONTRIBUTING -->
## 👐 Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->
## 📜 License
Distributed under the MIT License. See `LICENSE.txt` for more information.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact
James Fleeting- [@your_twitter](https://twitter.com/your_username) - email@example.com

Project Link: [https://github.com/FPGA-James/dotfiles](https://github.com/FPGA-James/dotfiles)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments
* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
* [Malven's Grid Cheatsheet](https://grid.malven.co/)
* [Img Shields](https://shields.io)
* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)
* [Read me template](https://github.com/FPGA-James/dotfiles)

<p align="right">(<a href="#readme-top">back to top</a>)</p>




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/FPGA-James/dotfiles?style=for-the-badge
[contributors-url]: https://github.com/FPGA-James/dotfiles/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/FPGA-James/dotfiles?style=for-the-badge
[forks-url]: https://github.com/FPGA-James/dotfiles/network/members

[stars-shield]: https://img.shields.io/github/stars/FPGA-James/dotfiles?colorA=363A4F&colorB=B7BDF8&logo=adafruit&logoColor=D9E0EE&style=for-the-badge
[stars-url]: https://github.com/FPGA-James/dotfiles/stargazers

[issues-shield]: https://img.shields.io/github/issues/FPGA-James/dotfiles?style=for-the-badge
[issues-url]: https://github.com/FPGA-James/dotfiles/issues

[license-shield]: https://img.shields.io/github/license/FPGA-James/dotfiles?colorA=363A4F&colorB=DDB6F2&logo=gitlfs&logoColor=D9E0EE&style=for-the-badge
[license-url]: https://github.com/FPGA-James/dotfiles/LICENSE.txt

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/FPGA-James


[twitter_logo]:https://img.shields.io/twitter/url?color=F5A97F&label=%40FPGA-James&logo=twitter&logoColor=F5A97F&style=for-the-badge&url=https%3A%2F%2Ftwitter.com%2FFpgaJ
[twitter_url]:https://twitter.com/FpgaJ

[size-shield]:https://img.shields.io/github/languages/code-size/FPGA-James/dotfiles?colorA=363A4F&colorB=B7BDF8&logo=adafruit&logoColor=D9E0EE&style=for-the-badge
