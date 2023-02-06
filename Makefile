install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

rust-version:
	@echo "Rust command-line utility versions:"
	rustc --version 			#rust compiler
	cargo --version 			#rust package manager
	rustfmt --version			#rust code formatter
	rustup --version			#rust toolchain manager
	clippy-driver --version		#rust linter


check-gpu-linux:
	sudo lshw -C display
