# Usage
1. Unzip the files & put them in the directory of your choice. (`C:\Users\USER\.vscode\luau-lsp-types` in this example)
2. Insert the settings below into either your workspace or user settings
   - If you want the typedefs to apply to **EVERY** project, put them in user settings
       1. Press `Ctrl + Shift + P` and search for `Preferences: Open User Settings (JSON)`
   - If you want to apply the typedefs to each individual project, put them in workspace settings
       1. Create a folder called `.vscode` in your workspace folder
       2. Create a file called `settings.json` inside that folder, and paste the settings below
       3. Be sure to Remove the last comma after the last bracket if you put them at the end of your `settings.json`
```json
{
    ...

    "luau-lsp.types.definitionFiles": {
        "custom": "C:\\Users\\USER\\.vscode\\luau-lsp-types\\environment.d.luau",
        "luaprot": "C:\\Users\\USER\\.vscode\\luau-lsp-types\\luaprot.d.luau",
        "luarmor": "C:\\Users\\USER\\.vscode\\luau-lsp-types\\luarmor.d.luau",
        "luraph": "C:\\Users\\USER\\.vscode\\luau-lsp-types\\luraph.d.luau"
    },
    "luau-lsp.types.documentationFiles": [
        "C:\\Users\\USER\\.vscode\\luau-lsp-types\\environment.d.json",
        "C:\\Users\\USER\\.vscode\\luau-lsp-types\\luaprot.d.json",
        "C:\\Users\\USER\\.vscode\\luau-lsp-types\\luarmor.d.json",
        "C:\\Users\\USER\\.vscode\\luau-lsp-types\\luraph.d.json"
    ],

    ...
}
```

Make sure to replace any occurrences of `USER` with your windows username.

# Credits
These files were generated based off rocult's luau type defs (updated) & extended by AI with everything on Volt's docs & Potassium's docs.  
Shoutout to actualmasteroogway for archiving Synapse's documentation for me to use & also creating the original luau typedefs.

# Updates
Update 1
```diff
+ HttpPost
+ HttpGetAsync
+ HttpPostAsync
```

Update 2
```diff
+ Added Synapse Z ImGui Library
+ Added syn Library for Synapse Z
+ Expanded crypt Library
+ Expanded oth Library
+ Added DataModel Http Method Aliases
+ http Library
+ All request Aliases
```

Update 3
```diff
+ ismetamethodhooked
+ cansignalreplicate
+ setconnectionenabled
+ 5 hookfunction variants
+ hook_meta_method
+ gethostip variants
```

**Sources**:
- https://docs.voltbz.net/docs
- https://docs.potassium.pro/api-reference/introduction
- https://github.com/kix43/luau-defs/tree/main
- https://actualmasteroogway.github.io/synapse-x-documentation/
- (cant link because rocults github is banned)
