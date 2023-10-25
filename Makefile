.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: nvim
nvim: ## Install nvim
	brew tap homebrew/cask-fonts
	brew install ripgrep fzf hashicorp/tap/terraform-ls font-symbols-only-nerd-font lua-language-server grammarly-languageserver jq gopls
	GOBIN=$(PWD) go install golang.org/x/tools/cmd/goimports@latest && mv ./goimports ~/.local/bin/goimports
	brew install neovim --HEAD
	rm -rf ~/.config/nvim
	ln -s $(PWD)/nvim ~/.config/nvim
	nvim --headless "+Lazy! install" +qa
	npm -g install \
		dockerfile-language-server-nodejs \
		typescript typescript-language-server \
		vscode-langservers-extracted \
		yaml-language-server \
		prettier
	echo "https://github.com/artempyanykh/marksman/releases/download/$$(curl --silent "https://api.github.com/repos/artempyanykh/marksman/releases/latest" | jq ".. .tag_name? // empty")/marksman-macos" | sed 's/"//g' | xargs curl -O -L
	chmod +x ./marksman-macos
	mv ./marksman-macos ~/.local/bin/marksman
	brew tap homebrew/cask-fonts && brew install --cask font-symbols-only-nerd-font

.PHONY: update-nvim
update-nvim: ## Update nvim
	brew upgrade ripgrep fzf hashicorp/tap/terraform-ls font-symbols-only-nerd-font lua-language-server grammarly-languageserver jq gopls
	GOBIN=$(PWD) go install golang.org/x/tools/cmd/goimports@latest && mv ./goimports ~/.local/bin/goimports
	brew upgrade neovim --fetch-HEAD
	npm -g uninstall \
		dockerfile-language-server-nodejs \
		typescript typescript-language-server \
		vscode-langservers-extracted \
		yaml-language-server \
		prettier
	npm -g install \
		dockerfile-language-server-nodejs \
		typescript typescript-language-server \
		vscode-langservers-extracted \
		yaml-language-server \
		prettier
	echo "https://github.com/artempyanykh/marksman/releases/download/$$(curl --silent "https://api.github.com/repos/artempyanykh/marksman/releases/latest" | jq ".. .tag_name? // empty")/marksman-macos" | sed 's/"//g' | xargs curl -O -L
	chmod +x ./marksman-macos
	mv ./marksman-macos ~/.local/bin/marksman
	nvim -c "autocmd User VeryLazy Lazy sync"

.PHONY: terminal-tools
terminal-tools: ## Install terminal tools
	brew install tmux fzf asdf
	$(HOMEBREW_PREFIX)/opt/fzf/install --all
	rm -f ~/.tmux.conf
	ln -s $(PWD)/tmux/.tmux.conf ~/
	rm -f ~/.tmux-scrollback-nvim
	ln -s $(PWD)/tmux/.tmux-scrollback-nvim ~/
	rm -f ~/.local/bin/search-wiki-open-nvim
	ln -s $(PWD)/tmux/search-wiki-open-nvim ~/.local/bin/search-wiki-open-nvim
	rm -f ~/.local/bin/tmux-sessionizer
	ln -s $(PWD)/tmux/tmux-sessionizer ~/.local/bin/tmux-sessionizer
	rm -f ~/.zshrc
	ln -s $(PWD)/zsh/.zshrc ~/
	rm -rf ~/zsh-syntax-highlighting
	ln -s $(PWD)/zsh/zsh-syntax-highlighting ~/zsh-syntax-highlighting
	rm -rf ~/fzf-tab
	ln -s $(PWD)/zsh/fzf-tab ~/fzf-tab
	tic $(PWD)/tmux/tmux-256color.terminfo.txt
	asdf plugin-add direnv
	asdf direnv setup --shell zsh --version latest
	rm -rf ~/tmux-fingers
	ln -s $(PWD)/tmux/tmux-fingers ~/tmux-fingers

.PHONY: git
git: # Configure git
	brew install git-delta
	GOBIN=$(PWD) go install github.com/arl/gitmux@latest && mv ./gitmux ~/.local/bin/gitmux
	rm -f ~/.gitconfig
	ln -s $(PWD)/git/.gitconfig ~/.gitconfig
	rm -f ~/.gitignore
	ln -s $(PWD)/git/.gitignore ~/.gitignore
	rm -rf ~/.gitmux.conf
	ln -s $(PWD)/tmux/.gitmux.conf ~/.gitmux.conf

.PHONY: docker-build
docker-build: # Build and publish the image
	docker buildx build --no-cache --platform linux/arm64/v8,linux/amd64 --tag lourenci/neovim:latest --push .
