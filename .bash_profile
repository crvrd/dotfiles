for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,bash_local}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
	[ -r "$file" ] && [ -f "$file" ] && echo "sourcing $file";
done;
unset file;
