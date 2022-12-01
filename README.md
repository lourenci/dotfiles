# 🤖 Dotfiles

My personal dotfiles.

For neovim, this repo automatically publish an image with all the LSPs and plugins of this dotfiles.

```sh
docker run --rm -it --user $(id -u):$(id -g) -v $PWD:/workdir -w /workdir lourenci/neovim:latest
```

## TODO Docker image

- [x] Multistage builds (remove image length)
- [x] Use `Lazy install` instead of `Lazy sync`
- [x] Missing some lsp bins
- [ ] Use brew to build neovim instead of make it from the source?
- [ ] Support for opening multiple files on [Nvim executable](./docker-nvim.sh) (It works, but it doesn't create the volumes for the other paths.)
- [ ] Use Makefile??
