for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,bash_local}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
