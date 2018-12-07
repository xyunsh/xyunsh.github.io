deploy:
	git checkout source
	bundle exec jekyll build
	git add -A
	git commit -m "update source"
	cp -r _site/ /tmp/xyunsh.github.io/
	git checkout master
	rm -r ./*
	cp -r /tmp/xyunsh.github.io/* ./
	git add -A
	git commit -m "deploy blog"
	git push origin master
	git checkout source
	echo "deploy succeed"
	git push origin source
	echo "push source"
