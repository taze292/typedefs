--#region Helper types
type GenericFunction<A..., R...> = (A...) -> R...
type GenericScript = LocalScript | ModuleScript
type AnyFunction = <A..., R...>(A...) -> R...
type AnyTable = { [any]: any }
type AnyArray = { any }
type BuiltIn = nil | string | number | boolean
type BooleanNumber = number 
type Metamethods =
    "__index" |
    "__newindex" |
    "__call" |
    "__concat" |
    "__unm" |
    "__add" |
    "__sub" |
    "__mul" |
    "__div" |
    "__idiv" |
    "__mod" |
    "__pow" |
    "__tostring" |
    "__metatable" |
    "__eq" |
    "__lt" |
    "__le" |
    "__mode" |
    "__len" |
    "__iter" |
    "__namecall"
--#endregion

--#region Bit
type bit = {
    badd: (...number) -> number,
    bsub: (...number) -> number,
    bmul: (...number) -> number,
    bdiv: (...number) -> number,
    band: (...number) -> number,
    bor: (...number) -> number,
    bxor: (...number) -> number,
    bnot: (value: number) -> number,
    bswap: (value: number) -> number,
    ror: (value: number, count: number) -> number,
    rol: (value: number, count: number) -> number,
    lshift: (value: number, count: number) -> number,
    rshift: (value: number, count: number) -> number,
    arshift: (value: number, count: number) -> number,
    tohex: (value: number) -> string,
    tobit: (value: number) -> number,
}
declare bit: bit
--#endregion

--#region Cache
type cache = {
    iscached: (object: Instance) -> boolean,
    invalidate: (object: Instance) -> (),
    replace: (object: Instance, newObject: Instance) -> (),
}
declare cache: cache
--#endregion

--#region Closures
declare function checkcaller(): boolean
declare function clonefunction<A..., R...>(function_to_clone: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function getfunctionhash(function_to_hash: AnyFunction): string
declare function hookfunction<A..., R...>(function_to_hook: GenericFunction<A..., R...>, hook: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function hookmetamethod<A..., R...>(object: AnyTable | Instance, metamethod_name: string, hook: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function is_function_hooked(func: AnyFunction): boolean
declare function isfunctionhooked(func: AnyFunction): boolean
declare function iscclosure(func: AnyFunction): boolean
declare function isexecutorclosure(func: AnyFunction): boolean
declare function islclosure(func: AnyFunction): boolean
declare function newcclosure<A..., R...>(function_to_wrap: GenericFunction<A..., R...>, name: string?): GenericFunction<A..., R...>
declare function restorefunction(functionToRestore: AnyFunction): ()

declare function getnamecallmethod(): string
declare function setnamecallmethod(method: string): ()
declare function setstackhidden(func: AnyFunction | number, hidden: boolean): ()
--#endregion

--#region Oth
type oth = {
    hook: <A..., R...>(target: GenericFunction<A..., R...>, hook: GenericFunction<A..., R...>) -> GenericFunction<A..., R...>,
    get_root_callback: () -> AnyFunction,
    is_hook_thread: () -> boolean,
    unhook: (target: AnyFunction) -> (),
    get_original_thread: () -> thread?,
}
declare oth: oth
--#endregion

--#region Console
declare function rconsoleclear(): ()
declare function rconsolecreate(): ()
declare function rconsoledestroy(): ()
declare function rconsoleinput(): string
declare function rconsoleprint(text: string): ()
declare function rconsolesettitle(title: string): ()

declare function rconsoleshow(): ()
declare function rconsolehide(): ()
declare function rconsoletoggle(): ()
declare function rconsolehidden(): boolean
declare function rconsoletop(): ()
declare function rconsolename(title: string): ()
declare function rconsoleerr(message: any): ()
declare function rconsoleinfo(message: any): ()
declare function rconsolewarn(message: any): ()
--#endregion

--#region Cryptography
type CryptCipherMode = "CBC" | "ECB" | "CTR" | "CFB" | "OFB" | "GCM"
type CryptHashAlgorithm = "shA" | "sha384" | "sha512" | "md5" | "sha256" | "sha3-224" | "sha3-256" | "sha3-512"
type crypt = {
    base64decode: (data: string) -> string,
    base64encode: (data: string) -> string,

    encrypt: (data: string, key: string, iv: string?, mode: CryptCipherMode?) -> (string, string),
    decrypt: (data: string, key: string, iv: string, mode: CryptCipherMode) -> string,
    generatebytes: (size: number) -> string,
    generatekey: () -> string,
    hash: (data: string, algorithm: CryptHashAlgorithm) -> string,
}
declare crypt: crypt
--#endregion

--#region Debug
type DebugInfo = {
    source: string,
    short_src: string,
    func: AnyFunction,
    what: "Lua" | "C",
    currentline: number,
    name: string,
    nups: number,
    numparams: number,
    is_vararg: BooleanNumber,
}
type debug = {
    getconstant: (func_or_level: AnyFunction | number, index: number) -> BuiltIn,
    getconstants: (func_or_level: AnyFunction | number) -> { BuiltIn },
    getproto: ((func_or_level: AnyFunction | number, index: number, activated: true) -> { AnyFunction }) &
              ((func_or_level: AnyFunction | number, index: number, activated: false?) -> AnyFunction),
    getprotos: (func_or_level: AnyFunction | number) -> { AnyFunction },
    getstack: (level: number, index: number?) -> any | AnyArray,
    getupvalue: (func_or_level: AnyFunction | number, index: number) -> any,
    getupvalues: (func_or_level: AnyFunction | number) -> AnyArray?,
    setconstant: (func_or_level: AnyFunction | number, index: number, value: BuiltIn) -> (),
    setstack: (level: number, index: number, value: any) -> (),
    setupvalue: (func_or_level: AnyFunction | number, index: number, value: any) -> (),

    getinfo: (func_or_level: AnyFunction | number) -> DebugInfo,

    setname: (target: AnyFunction | number, name: string) -> (),
    getregistry: () -> AnyTable,
    getsafeenv: (object: (AnyFunction | AnyTable | thread)?) -> boolean?,
    setsafeenv: (object: AnyFunction | AnyTable | thread | boolean, safe: boolean?) -> (),
}
declare debug: debug & typeof(debug)

declare function getconstant(func_or_level: AnyFunction | number, index: number): BuiltIn
declare function getconstants(func_or_level: AnyFunction | number): { BuiltIn }
declare getproto:
    ((func_or_level: AnyFunction | number, index: number, activated: true) -> { AnyFunction })
    & ((func_or_level: AnyFunction | number, index: number, activated: false?) -> AnyFunction)
declare function getprotos(func_or_level: AnyFunction | number): { AnyFunction }
declare function getstack(level: number, index: number?): any | AnyArray
declare function getupvalue(func_or_level: AnyFunction | number, index: number): any
declare function getupvalues(func_or_level: AnyFunction | number): AnyArray?
declare function setconstant(func_or_level: AnyFunction | number, index: number, value: BuiltIn): ()
declare function setstack(level: number, index: number, value: any): ()
declare function setupvalue(func_or_level: AnyFunction | number, index: number, value: any): ()

declare function setname(target: AnyFunction | number, name: string): ()
declare function getregistry(): AnyTable
declare function getsafeenv(object: (AnyFunction | AnyTable | thread)?): boolean?
declare function setsafeenv(object: AnyFunction | AnyTable | thread | boolean, safe: boolean?): ()
--#endregion

--#region Drawing
declare extern type DrawingObject with
    Visible: boolean
    ZIndex: number
    Transparency: number
    Color: Color3
    __OBJECT_EXISTS: boolean
    function Remove(self)
    function Destroy(self)
end
declare extern type DrawingLine extends DrawingObject with
    Thickness: number
    From: Vector2
    To: Vector2
end
declare extern type DrawingText extends DrawingObject with
    Text: string
    TextBounds: Vector2
    Font: DrawFont | number
    Size: number
    Center: boolean
    Centered: boolean
    Outline: boolean
    Outlined: boolean
    OutlineColor: Color3
    OutlineOpacity: number
    Position: Vector2
end
declare extern type DrawingImage extends DrawingObject with
    Data: string
    Size: Vector2
    Position: Vector2
    Rounding: number
    Loaded: boolean
end
declare extern type DrawingCircle extends DrawingObject with
    Thickness: number
    NumSides: number
    Radius: number
    Filled: boolean
    Position: Vector2
end
declare extern type DrawingSquare extends DrawingObject with
    Thickness: number
    Size: Vector2
    Position: Vector2
    Filled: boolean
end
declare extern type DrawingQuad extends DrawingObject with
    Thickness: number
    PointA: Vector2
    PointB: Vector2
    PointC: Vector2
    PointD: Vector2
    Filled: boolean
end
declare extern type DrawingTriangle extends DrawingObject with
    Thickness: number
    PointA: Vector2
    PointB: Vector2
    PointC: Vector2
    Filled: boolean
end
type DrawingFonts = {
    UI: number,
    System: number,
    Plex: number,
    Monospace: number,
}
export type DrawingNewTypes = "Line" | "Text" | "Image" | "Circle" | "Square" | "Quad" | "Triangle"
export type DrawingNewFunction =
    (("Line") -> DrawingLine)
    & (("Text") -> DrawingText)
    & (("Image") -> DrawingImage)
    & (("Circle") -> DrawingCircle)
    & (("Square") -> DrawingSquare)
    & (("Quad") -> DrawingQuad)
    & (("Triangle") -> DrawingTriangle)
export type Drawing = {
    Fonts: DrawingFonts,
    new: DrawingNewFunction
}
declare Drawing: Drawing
declare function cleardrawcache(): ()
declare function getrenderproperty(drawing: DrawingObject, property: string): any
declare function isrenderobj(object: any): boolean
declare function setrenderproperty(drawing: DrawingObject, property: string, value: any): ()

type DrawFontOptions = {
    PixelSize: number,
    Glyphs: { { number } }?,
}
type DrawFont = {
    GetTextBounds: (self: DrawFont, size: number, text: string) -> Vector2,
}
type DrawFontLibrary = {
    Register: (data: string, options: DrawFontOptions) -> DrawFont?,
}
declare DrawFont: DrawFontLibrary

type DrawingImmediate = {
    Fonts: DrawingFonts,
    GetPaint: (zIndex: number?) -> VoltSignal,
    Line: (p1: Vector2, p2: Vector2, color: Color3, opacity: number, thickness: number) -> (),
    Circle: (center: Vector2, radius: number, color: Color3, opacity: number, numSides: number, thickness: number) -> (),
    FilledCircle: (center: Vector2, radius: number, color: Color3, opacity: number, numSides: number) -> (),
    Triangle: (p1: Vector2, p2: Vector2, p3: Vector2, color: Color3, opacity: number, thickness: number) -> (),
    FilledTriangle: (p1: Vector2, p2: Vector2, p3: Vector2, color: Color3, opacity: number) -> (),
    Rectangle: (topLeft: Vector2, size: Vector2, color: Color3, opacity: number, rounding: number, thickness: number) -> (),
    FilledRectangle: (topLeft: Vector2, size: Vector2, color: Color3, opacity: number, rounding: number) -> (),
    Quad: (p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, color: Color3, opacity: number, thickness: number) -> (),
    FilledQuad: (p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, color: Color3, opacity: number) -> (),
    Text: (position: Vector2, font: DrawFont | number, fontSize: number, color: Color3, opacity: number, text: string, center: boolean) -> (),
    OutlinedText: (position: Vector2, font: DrawFont | number, fontSize: number, color: Color3, opacity: number, outlineColor: Color3, outlineOpacity: number, text: string, center: boolean) -> (),
}
declare DrawingImmediate: DrawingImmediate
--#endregion

--#region Environment
type FunctionFilterOptions = {
    Name: string?,
    IgnoreExecutor: boolean?,
    Hash: string?,
    Constants: AnyArray?,
    Upvalues: AnyArray?,
}
type TableFilterOptions = {
    Keys: AnyArray?,
    Values: AnyArray?,
    KeyValuePairs: AnyTable?,
    Metatable: any?,
}
declare getgc:
    ((include_tables: false?) -> AnyArray)
    & ((include_tables: true) -> { any | AnyArray })
declare function getgenv(): AnyTable
declare function getreg(): AnyArray
declare function getrenv(): AnyTable
declare filtergc: (
    (filter_type: "table", filter_options: TableFilterOptions, return_one: true) -> AnyTable?
) & (
    (filter_type: "table", filter_options: TableFilterOptions, return_one: false?) -> { AnyTable }
) & (
    (filter_type: "function", filter_options: FunctionFilterOptions, return_one: true) -> AnyFunction?
) & (
    (filter_type: "function", filter_options: FunctionFilterOptions, return_one: false?) -> { AnyFunction }
)
--#endregion

--#region Filesystem
declare function appendfile(path: string, contents: string): ()
declare function delfile(path: string): ()
declare function delfolder(path: string): ()
declare function getcustomasset(path: string): string
declare function isfile(path: string): boolean
declare function isfolder(path: string): boolean
declare function listfiles(path: string): { string }
declare function loadfile(path: string): (AnyFunction?, string?)
declare function makefolder(path: string): ()
declare function readfile(path: string): string
declare function writefile(path: string, data: string): ()

declare function dofile(path: string): ()
--#endregion

--#region Input
declare function isrbxactive(): boolean
declare function mouse1click(): ()
declare function mouse1press(): ()
declare function mouse1release(): ()
declare function mouse2click(): ()
declare function mouse2press(): ()
declare function mouse2release(): ()
declare function mousemoveabs(x: number, y: number): ()
declare function mousemoverel(x: number, y: number): ()
declare function mousescroll(pixels: number): ()
--#endregion

--#region Instances
declare function cloneref<T>(object: T & Instance): T
declare function compareinstances(object1: Instance, object2: Instance): boolean
declare function fireclickdetector(object: ClickDetector, distance: number?, event: ("MouseClick" | "MouseHoverEnter" | "MouseHoverLeave" | "RightMouseClick")?): ()
declare function fireproximityprompt(object: ProximityPrompt): ()
declare function firetouchinterest(part: BasePart, part2: BasePart, toggle: boolean | BooleanNumber): ()
declare function getcallbackvalue(object: Instance, property: string): AnyFunction
declare function gethui(): Instance
declare function getinstances(): { Instance }
declare function getnilinstances(): { Instance }
declare function isscriptable(object: Instance, property: string): boolean
declare function setrbxclipboard(data: string): boolean
--#endregion

--#region Metatable
declare function getrawmetatable(object: any): AnyTable?
declare function isreadonly(table: AnyTable): boolean
declare function setrawmetatable<T>(object: T, metatable: AnyTable): T
declare function setreadonly(table: AnyTable, state: boolean): ()
--#endregion

--#region Miscellaneous
type Request = {
    Url: string,
    Method: string,
    Body: string?,
    Headers: { [string]: any }?,
    Cookies: { [string]: any }?,
}
type Response = {
    Body: string,
    StatusCode: number,
    StatusMessage: string,
    Success: boolean,
    Headers: { [string]: any },
}
type ExtraDataModel = {
    HttpGet: (self: typeof(game), url: string, synchronous: boolean?, httpRequestType: typeof(Enum.HttpRequestType)?, doNotAllowDiabolicalMode: boolean?) -> string,
    HttpPost: (self: typeof(game), url: string, data: string, synchronous: boolean?, httpRequestType: typeof(Enum.HttpRequestType)?, doNotAllowDiabolicalMode: boolean?) -> string,
    HttpGetAsync: (self: typeof(game), url: string, httpRequestType: typeof(Enum.HttpRequestType)?) -> string,
    HttpPostAsync: (self: typeof(game), url: string, data: string, httpRequestType: typeof(Enum.HttpRequestType)?) -> string,
}
declare function identifyexecutor(): (string, string)
declare function request(options: Request): Response

declare function getfflag(fflag: string): string
declare function getfastflag(fflag: string): string
declare function getfflagtype(fflag: string): string
declare function getfastflagtype(fflag: string): string
declare function get_process_identifier(): number
declare function getfpscap(): number
declare function gethwid(): string
declare function httpget(self: any?, url: string): string
declare function getobjects(self: any?, asset: string): { Instance }
declare function setclipboard(text: string): ()
declare function setfflag(fflag: string, value: any): ()
declare function setfastflag(fflag: string, value: any): ()
declare function setfpscap(fps: number): ()

type SaveInstanceOptions = {
    FilePath: string,
    IgnoreArchivable: boolean,
    SavePlayerCharacters: boolean,
    SavePlayers: boolean,
    DisableCompression: boolean,
    DecompileScripts: boolean,
    SaveNonCreatable: boolean,
    SaveNilInstances: boolean,
    CopyToClipboard: boolean,
    IgnoreList: { Instance },
    DecompilerOptions: any,
}
type SaveInstanceOptionsLibrary = {
    new: () -> SaveInstanceOptions,
}
declare SaveInstanceOptions: SaveInstanceOptionsLibrary
declare function saveinstance(root: Instance | { Instance }, options: SaveInstanceOptions?): ()
declare function saveplace(options: SaveInstanceOptions?): ()

declare game: typeof(game) & ExtraDataModel
--#endregion

--#region Reflection
declare function gethiddenproperty(instance: Instance, property_name: string): (any, boolean)
declare function getthreadidentity(): number
declare function sethiddenproperty(instance: Instance, property_name: string, property_value: any): boolean
declare function setscriptable(object: Instance, property: string, state: boolean): boolean?
declare function setthreadidentity(id: number): ()

declare function getbspval(instance: Instance, property: string, base64: boolean?): string
declare function getpcd(trianglemeshpart: Instance): (string, string)
declare function getproximitypromptduration(proximityprompt: ProximityPrompt): number
declare function setproximitypromptduration(proximityprompt: ProximityPrompt, duration: number): ()
declare function getsimulationradius(): number
declare function setsimulationradius(simulationradius: number): ()
--#endregion

--#region Scripts
declare function getcallingscript(): GenericScript?
declare function getloadedmodules(excludeCore: boolean?): { ModuleScript }
declare function getrunningscripts(): { GenericScript }
declare function getscriptbytecode(script: GenericScript): string?
declare function getscriptclosure(script: GenericScript): AnyFunction?
declare function getscripthash(script: GenericScript): string?
declare function getscripts(): { GenericScript }
declare function getsenv(script: GenericScript): { [any]: any }
declare function loadstring<A...>(src: string, chunkname: string?): (((A...) -> any) | nil, string?)
declare function getscriptfromthread(Thread: thread): GenericScript?
--#endregion

--#region Signals
declare extern type Connection with
    Enabled: boolean
    ForeignState: boolean
    LuaConnection: boolean
    Function: AnyFunction?
    Thread: thread?
    function Fire(self, ...: any): ()
    function Defer(self, ...: any): ()
    function Disconnect(self): ()
    function Disable(self): ()
    function Enable(self): ()
end
declare function firesignal<T...>(signal: RBXScriptSignal<T...>, ...: T...): ()
declare function getconnections<T...>(signal: RBXScriptSignal<T...>): { Connection }
declare function lz4compress(data: string): string
declare function lz4decompress(data: string, size: number): string
declare function messagebox(text: string, caption: string, flags: number): number
declare function queue_on_teleport(code: string): ()
declare function clearteleportqueue(): ()
declare function clear_teleport_queue(): ()
declare function clearqueueonteleport(): ()
declare function replicatesignal<T...>(signal: RBXScriptSignal<T...>, ...: T...): ()
--#endregion

--#region VoltSignal
type VoltConnection = {
    Connected: boolean,
    Disconnect: (self: VoltConnection) -> (),
}
type VoltSignal = {
    Connect: <T...>(self: VoltSignal, f: (T...) -> ()) -> VoltConnection,
    Once: <T...>(self: VoltSignal, f: (T...) -> ()) -> VoltConnection,
    Wait: <T...>(self: VoltSignal) -> T...,
    Fire: <T...>(self: VoltSignal, ...any) -> (),
}
type VoltSignalLibrary = {
    new: () -> VoltSignal,
}
declare VoltSignal: VoltSignalLibrary
declare Signal: VoltSignalLibrary
--#endregion

--#region Actors
type ChannelReceiver = {
    Event: RBXScriptSignal<any>,
    connect: <T...>(self: ChannelReceiver, f: (T...) -> ()) -> VoltConnection,
    Internal: BindableEvent,
}
declare function create_comm_channel(): (number, ChannelReceiver)
declare function get_comm_channel(id: number): BindableEvent
declare function get_current_actor(): Actor?
declare function getactors(): { Actor }
declare function getactorstates(): { LuaStateProxy }
declare function getgamestate(): LuaStateProxy?
declare function getluastate(actor_or_script: (Actor | GenericScript | Script)?): LuaStateProxy?
declare function isparallel(): boolean
declare function is_parallel(): boolean
declare function run_on_actor(actor: Actor, script: string, ...: any): ()
declare function run_on_thread(thread: thread, script: string, ...: any): ()
declare function getactorthreads(): { thread }
declare function getdeletedactors(): { Actor }
declare on_actor_state_created: VoltSignal
--#endregion

--#region LuaStateProxy
type LuaStateProxy = {
    Id: number,
    IsActorState: boolean,
    Event: VoltSignal,
    GetActors: (self: LuaStateProxy) -> { Actor },
    Execute: (self: LuaStateProxy, source: string, ...any) -> (),
}
type LuaStateProxyLibrary = {
    new: () -> LuaStateProxy?,
}
declare LuaStateProxy: LuaStateProxyLibrary
--#endregion

--#region RakNet
type RakNetPacket = {
    AsBuffer: buffer,
    AsString: string,
    AsArray: { number },
    PacketId: number,
    Priority: number,
    Reliability: number,
    OrderingChannel: number,
    Size: number,
    SetData: (self: RakNetPacket, data: buffer | string | { number }) -> (),
    Block: (self: RakNetPacket) -> (),
}
type raknet = {
    add_send_hook: (hook: (packet: RakNetPacket) -> ()) -> (),
    remove_send_hook: (hook: (packet: RakNetPacket) -> ()) -> (),
    add_receive_hook: (callback: (packet: RakNetPacket) -> ()) -> (),
    remove_receive_hook: (callback: (packet: RakNetPacket) -> ()) -> (),
    send: (data: buffer | string | { number }, priority: number?, reliability: number?, ordering_channel: number?) -> (),
    is_enabled: () -> boolean,
}
declare raknet: raknet
--#endregion

--#region Regex
type RegexMatch = { [any]: any }
type Regex = {
    Match: (self: Regex, contents: string) -> RegexMatch?,
    MatchMany: (self: Regex, contents: string) -> { RegexMatch },
    Replace: (self: Regex, contents: string, replacement: string) -> string,
}
type RegexLibrary = {
    new: (pattern: string) -> Regex,
    Escape: (contents: string) -> string,
}
declare Regex: RegexLibrary
--#endregion

--#region WebSocket
type WebSocketConnection = {
    OnMessage: RBXScriptSignal<string>,
    OnClose: RBXScriptSignal<()>,
    Send: (self: WebSocketConnection, message: string) -> (),
    Close: (self: WebSocketConnection) -> (),
    IsClosed: boolean,
}
type WebSocket = {
    connect: (url: string) -> WebSocketConnection
}
declare WebSocket: WebSocket
--#endregion
