# Emulated Hue for Home Assistant

This is the development version of the addon that
will allow you to more easily debug and modify Emulated Hue.

On startup, this addon will download the latest changes from
Github, install the code, and run it. You can also specify
your own fork so you can make changes and test them yourself!

## Configuration Options

### Option: `http_port`

Enter an integer to specify a custom http port. This defaults to port 80 if not specified. 

### Option: `https_port`

Enter an integer to specify a custom https port. This defaults to port 443 if not specified.

### Option: `tag_commit_or_branch`

Enter any tag, commit hash, or branch name that you want to
pull from.

By default, this will download from the main repository, but you can
specify your own repository by using this syntax:

`username:tag_commit_or_branch`

or

`username:repository_name:tag_commit_or_branch`

If the repository name is not specified, the addon will default to
a repository named "core" for the specified username.

Below, you can find some more information on how to obtain a tag/commit hash/branch

#### Tags
You can find all our [releases and their tags here.](https://github.com/hass-emulated-hue/core/tags)
Clicking on any one of the tags will bring you to a summary of changes for that version

#### Commit Hash
You can find all our [commits here.](https://github.com/hass-emulated-hue/core/commits/master)
Clicking on any commit will show all the changes made in that commit and will show
the full commit hash on the top right (long string of numbers and letters).

#### Branch
You can find all our [branches here.](https://github.com/hass-emulated-hue/core/branches)
A branch may have many changes and may be merged into future versions. Testing for
bugs before merging can help to prevent future bugs.

### Option: `verbose`

Enter true or false to toggle verbose logging. This will provided increase logs for debugging.
