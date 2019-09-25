#!/bin/bash
create_archive () {
  7z a "$1" "$1"
}

move_archive () {
	cbz_filename="${1// /_}.cbz"
	mv "$1.7z" "../archives/$cbz_filename"
}

delete_raw () {
	rm -rf "$1"
}

cd rips

for d in *; do
	if [[ $d == *.* ]]; then
		mv "$d" "${d//./_}"
		d="${d//./_}"
	fi

	echo "Processing $d"
	create_archive "$d";
	move_archive "$d";
	delete_raw "$d";
done

cd ..

read -n 1 -s -r -p "Press any key to exit"