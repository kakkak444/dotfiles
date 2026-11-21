{ config, lib, ... }:

let	path = ../.;
	simpleFileMap = files: lib.lists.foldr
		(file: acc: {
				"${file}" = {
					source = lib.path.append path file;
					recursive = true;
				};
			} // acc )
		{  }
		files;
in
	{
		home.file = simpleFileMap [
				".bash_logout"
				".bash_profile"
				".bashrc"
				".profile"
				".vimrc"
				".config"
			];
	}

