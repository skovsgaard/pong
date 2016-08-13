# Endless pong game
This is a non-stop pong game. It doesn't restart when points are scored. Also it's probably full of glitchiness and collision bugs. Oh, and also the AI paddle is completely inert as it is now, so if you want to help out, that would be an amazing place to start :)

## Getting down to it
You will need the [LÖVE 2D framework](http://love2d.org) installed.

On Fedora, you will need to run `dnf install love` and the same should go for most distros and their respective package managers. However, do pay attention to which version of LÖVE your distros repositories provide, as this game targets 0.10.0 only.

For OSX, if you can't find the love package in Brew, love2d.org has a download for an installer.

## Running it

As the best case for running this right now is to test changes, simply run the following from the top of the git repo:

    love src

Another way to run the game, which isn't really necessary yet is to build a `.love` file using the `build-dist.sh` script. You will need to run the resulting file using `love` (or "Open with"), but yeah, not really relevant right now.


## Contributing
Please do. If you find anything you want changed, I'd be happy to take a pull request or even just an issue if you're not sure how to fix it but are sure it's a bug.
