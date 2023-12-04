FROM alpine as neovim
RUN apk add --no-cache git build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev # neovim build dependencies
WORKDIR /root
RUN git clone https://github.com/neovim/neovim.git
RUN cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
RUN cd neovim && make install

FROM alpine as golang
RUN apk add --no-cache go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH
RUN go install golang.org/x/tools/cmd/goimports@latest
RUN go install golang.org/x/tools/gopls@latest

FROM alpine as neovim-plugins
RUN apk add --no-cache git nodejs npm tree-sitter-cli build-base jq curl
COPY nvim /root/.config/nvim
COPY docker-clipboard /tmp
RUN cat /tmp/docker-clipboard >> /root/.config/nvim/init.lua
COPY --from=neovim /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=neovim /usr/local/share/nvim /usr/local/share/nvim
RUN nvim --headless "+Lazy! install" +qa
RUN nvim --headless "+set ft=json" \
	"+TSInstallSync! bash comment css dockerfile git_rebase gitattributes gitcommit gitignore go gomod gowork graphql html java javascript json json5 jsonc kotlin lua make markdown markdown_inline nix regex ruby scss sql terraform tsx typescript vim yaml" \
	+qa
RUN npm -g install \
	dockerfile-language-server-nodejs \
	typescript typescript-language-server \
	vscode-langservers-extracted \
	yaml-language-server \
	grammarly-languageserver \
	prettier
RUN echo "https://github.com/artempyanykh/marksman/releases/download/$(curl --silent "https://api.github.com/repos/artempyanykh/marksman/releases/latest" | jq ".. .tag_name? // empty")/marksman-linux" | sed 's/"//g' | xargs curl -O -L
RUN chmod +x ./marksman-linux

FROM homebrew/brew as brew
RUN brew install hashicorp/tap/terraform-ls lua-language-server

FROM alpine
# TODO: build-base should be removed
RUN apk add --no-cache git nodejs fzf ripgrep build-base

COPY --from=neovim /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=neovim /usr/local/share/nvim /usr/local/share/nvim
COPY --from=golang /go/bin/gopls /go/bin/goimports /usr/local/bin/
COPY --from=neovim-plugins /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=neovim-plugins /root/.config/nvim /root/.config/nvim
COPY --from=neovim-plugins /root/.local/share/nvim /root/.local/share/nvim
COPY --from=neovim-plugins /marksman-linux /usr/local/bin/marksman
COPY --from=brew /home/linuxbrew/.linuxbrew/bin/terraform-ls /home/linuxbrew/.linuxbrew/bin/lua-language-server /usr/local/bin/
# Create symbolic links for every installed npm package (https://github.com/moby/moby/issues/40449)
RUN cd /usr/local/bin && \
	ln -s ../lib/node_modules/dockerfile-language-server-nodejs/bin/docker-langserver docker-langserver && \
	ln -s ../lib/node_modules/grammarly-languageserver/bin/server.js grammarly-languageserver && \
	ln -s ../lib/node_modules/prettier/bin-prettier.js prettier && \
	ln -s ../lib/node_modules/typescript/bin/tsc tsc && \
	ln -s ../lib/node_modules/typescript/bin/tsserver tsserver && \
	ln -s ../lib/node_modules/typescript-language-server/lib/cli.mjs typescript-language-server && \
	ln -s ../lib/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server vscode-css-language-server && \
	ln -s ../lib/node_modules/vscode-langservers-extracted/bin/vscode-eslint-language-server vscode-eslint-language-server && \
	ln -s ../lib/node_modules/vscode-langservers-extracted/bin/vscode-html-language-server vscode-html-language-server && \
	ln -s ../lib/node_modules/vscode-langservers-extracted/bin/vscode-json-language-server vscode-json-language-server && \
	ln -s ../lib/node_modules/vscode-langservers-extracted/bin/vscode-markdown-language-server vscode-markdown-language-server && \
	ln -s ../lib/node_modules/yaml-language-server/bin/yaml-language-server

COPY docker-entrypoint.sh /root
RUN chmod +x /root/docker-entrypoint.sh

RUN chmod -R 777 /root

ENTRYPOINT [ "/root/docker-entrypoint.sh" ]
