# How to use semtag with git-chglog

## Requirements

For both tools you need to work within a git repository.  Neither will do
anything if you are not in an already initialized git repository. Neither
will do anything if you don't have at least one commit, but `git-chglog`
also requires at least one _semantic version style_ tag on top of it.

## Example Scenario

### Scenario 1: A git Repo With No Tags Yet

Let's say you have an initialized git repository with at least one 
commit and nothing more, no tags.

From this point you can create a _semantic version_ tag yourself, or use
_semtag_ to do it for you.  The real value of _semtag_ begins when you need
to create the next tags, with _semtag_ you can simply specify what semantic
component of the version you want to increment and it will figure the rest by
itself.  Having a tool that figures out the state by itself is invaluable for
automation.

Say you know for certain that you have no pre-existing version tags 
whatsoever, you can tag your version 0.0.1 yourself with git like this:
```sh
git tag v0.0.1
```

Doing the equivalent with _semtag_ is done like this:
```sh
semtag final -s patch
```

The `final` command indicates that you want to create a tag like this: 
`x.x.x`, by opposition to a tag like `x.x.x-beta-5.rc2`, and `-s patch`
indicates that you want to increment the patch level version number.

> Warning, _semtag_ doesn't tag _final_ versions if there are no new 
> commits since the last version, and will not tag anything if there are
> unstaged or uncommitted changes. 


### Scenario 2: A git Repo With at Least One Tag Already

Say you wrote a patch to the latest version of the repository and you now
need to tag your final commit.

Using only git you would have to do this:

```sh
$ git tag            # <- List pre-existing tags and identify the latest one.
v0.0.1
v0.0.1-rc.1
v0.1.0
$ git tag v0.1.1     # <- Determine the new tag based on the latest and apply it.
```

Using _semtag_ you would do it like this:
```sh
semtag final -s patch
```

The weakness here is that _semtag_ will only derive new versions based on 
the highest semantic version tag in the current branch, if that's not
what you need, you will have to apply your special version tag manually.

> A small tip, you can preview what tag would be applied by adding the `-o`
> switch, for example `semtag final -s minor -o`.

----

Charle Demers, November 2021.
