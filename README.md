Adam's vimrc
-----

To use, want to do this:

```bash
$ git clone github.com/adamhjk/adam-vim ~/.vim
$ cd ~/.vim
$ make install
```

Then marvel at what's up.

## Install fonts

You'll need Inconsolata for Powerline. Easy to get here:

https://github.com/powerline/fonts

## Important configuration stuff

Leader is mapped to ','

## Plugins

The current list is maintained in the vimrc through Plug. Check out vimrc.

## Commands

### Plug

```
[:PlugInstall] Install plugins
```

### Git
```
[:GitAdd <file>]       git-add <file> or current file if not specified.
[:GitCommit <args>]    git-commit.
[:GitStatus]           Show git-status of current file or repository.
[:GitLog]              Show git-log of current file or repository.
[:GitCheckout <args>]  git-checkout. Completes git commits.
[:GitDiff <args>]      git-diff. Completes git commits.
[:GitPull <args>]      git-pull.
[:GitPullRebase]       git-pull --rebase.
[:GitPush <args>]      git-push. Defaults to +git push origin <current-branch>+.
[:GitCatFile <args>]   git-cat-file.
[:Git <args>]          Does any git command.
[:GitVimDiffMerge]     Experimental. Call this command on unmerged file to enter vimdiff mode.
[:GitVimDiffMergeDone] Call this command after merging.
```

### Ag

Make sure you have the [Silver Searcher](https://geoff.greer.fm/ag/) installed

```
[:Ag <search>]         Search for a string, load in a buffer
```

### Tags
```
[<leader>j]    Tags for the current buffer
[<leader>J]    Tags for the whole project
```

### Surround
Details follow on the exact semantics, but first, consider the following
examples.  An asterisk (*) is used to denote the cursor position.

```
  Old text                  Command     New text ~
  "Hello *world!"           ds"         Hello world!
  [123+4*56]/2              cs])        (123+456)/2
  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
  if *x>3 {                 ysW(        if ( x>3 ) {
  my $str = *whee!;         vlllls'     my $str = 'whee!';
```
```
[ds] = Delete surrounding - use the character or a 't' for tag (ds", dst)
[cs] = Change surrounding - first what to change, then what to change to
[ys] = Takes a motion and surrounds it with the second argument, like cs
[s] = In visual mode, wraps the text with the character argument
```

### NERD_commenter
```
[,cc] = Comment the current line, or selected text in visual mode
[,c ] = Toggle the comment
[,ci] = Toggles the set of lines individually (like "c ", but assumes each line may have different settings)
[,cs] = Comment Sexily - up close to the start of each line
[,cA] = Append a comment to the end of the line
[,cl] = Comment and align on the left side
[,cb] = Comment and align on both sides
[,cu] = Uncomment the selected lines
```

### Gist
```
[:Gist] = post the whole text to gist
[:'<,'>Gist] = post the selected text to gist
[:Gist -p] = post wholet ext to gist with private
[:Gist -a] = post the whole text to gist with anonymous
[:Gist -e] = Edit the gist
[:Gist -e foo.js] = Edit the gist with the name 'foo.js'
[:Gist XXXXX] = Get gist
[:Gist -c XXXXX] = Get gist and put to clipboard
[:Gist -l] = List my gists
[:Gist -la] = List gists from all
```

### Textile
```
[,rp] = :TextilePreview - render textile to a temp file, open in browser
[,rt] = :TextileRenderTab - render textile to a new tab
[,rf] = :TextileREdnerFile - render to a file
```

### Keymaps
```
[,d] = Toggle NERDtree
[,t] = Fuzzy find files by name
[,b] = Fuzzy find buffers by name
[,j] = Fuzzy find tags in the current buffers
[,J] = Fuzzy find tags in the whole project
[,gd] :GitDiff
[,gD] :GitDiff --cached
[,gs] :GitStatus
[,gl] :GitLog
[,ga] :GitAdd
[,gA] :GitAdd <cfile>
[,gc] :GitCommit
```

### In git-status buffer
```
[<Enter>]    :GitAdd <cfile>
```


