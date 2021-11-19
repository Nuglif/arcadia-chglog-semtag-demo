
# Documentation:
# To create a CHANGELOG.md file on a non-master branch, you can
# specify _beta_ instead of _final_, like this:
#
# git-chglog -o CHANGELOG.md --next-tag `semtag final -s beta -o`
#
# Same thing to tag a non-master branch:
#
# semtag beta -s minor
#

.PHONY: tag clean

CHANGELOG.md:
	git-chglog -o CHANGELOG.md

# The --next-tag is "beta" and of doubtful value, dont use it
# unless you know what you are doing:
#	git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o`

tag:
	semtag final -s minor

README.md:
	terraform-docs markdown . > README.md

clean:
	rm -f README.md CHANGELOG.md