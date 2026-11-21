{ basePath, lib, ... }:

files: lib.lists.foldr (file: acc: {
		"${file}" = {
			source = lib.path.append basePath file;
			recursive = true;
		};
	} // acc )
	{  }
	files

