# Usage
1. Unzip the folder & drag all the files into `C:\Users\USER\.vscode\luau-lsp-types\`  
2. Add this block somewhere into your `settings.json` (user settings, NOT workspace settings)
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

**Sources**:
- https://docs.voltbz.net/docs
- https://docs.potassium.pro/api-reference/introduction
- https://github.com/kix43/luau-defs/tree/main
- https://actualmasteroogway.github.io/synapse-x-documentation/
- (cant link because rocults github is banned)
