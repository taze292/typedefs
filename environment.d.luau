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
declare function hookclosure<A..., R...>(function_to_hook: GenericFunction<A..., R...>, hook: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function hookfunc<A..., R...>(function_to_hook: GenericFunction<A..., R...>, hook: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function hook_func<A..., R...>(function_to_hook: GenericFunction<A..., R...>, hook: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function hook_function<A..., R...>(function_to_hook: GenericFunction<A..., R...>, hook: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function hookmetamethod<A..., R...>(object: AnyTable | Instance, metamethod_name: string, hook: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function hook_metamethod<A..., R...>(object: AnyTable | Instance, metamethod_name: string, hook: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function ismetamethodhooked(object: AnyTable | Instance, metamethod_name: string): boolean
declare function is_function_hooked(func: AnyFunction): boolean
declare function isfunctionhooked(func: AnyFunction): boolean
declare function iscclosure(func: AnyFunction): boolean
declare function isexecutorclosure(func: AnyFunction): boolean
declare function islclosure(func: AnyFunction): boolean
declare function newcclosure<A..., R...>(function_to_wrap: GenericFunction<A..., R...>, name: string?): GenericFunction<A..., R...>
declare function restorefunction(functionToRestore: AnyFunction): ()
declare function unhookfunction(functionToRestore: AnyFunction): ()
declare function unhook_function(functionToRestore: AnyFunction): ()

declare function getnamecallmethod(): string
declare function setnamecallmethod(method: string): ()
declare function setstackhidden(func: AnyFunction | number, hidden: boolean): ()
--#endregion

--#region Oth
type oth = {
    hook: <A..., R...>(target: GenericFunction<A..., R...>, hook: GenericFunction<A..., R...>) -> GenericFunction<A..., R...>,
    wrap: (func: AnyFunction) -> AnyFunction,
    unhook: (target: AnyFunction) -> (),
    un_hook: (target: AnyFunction) -> (),
    get_root_callback: () -> AnyFunction,
    getrootcallback: () -> AnyFunction,
    is_hook_thread: () -> boolean,
    ishookthread: () -> boolean,
    is_hooked: (func: AnyFunction) -> boolean,
    ishooked: (func: AnyFunction) -> boolean,
    get_original_thread: () -> thread?,
    getoriginalthread: () -> thread?,
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
type cryptUser = {
    encrypt: (data: string, key: string, iv: string?, mode: CryptCipherMode?) -> (string, string),
    decrypt: (data: string, key: string, iv: string, mode: CryptCipherMode) -> string,
}
type crypt = {
    encrypt: (data: string, key: string, iv: string?, mode: CryptCipherMode?) -> (string, string),
    decrypt: (data: string, key: string, iv: string, mode: CryptCipherMode) -> string,

    userencrypt: (data: string, key: string, iv: string?, mode: CryptCipherMode?) -> (string, string),
    user_encrypt: (data: string, key: string, iv: string?, mode: CryptCipherMode?) -> (string, string),
    userdecrypt: (data: string, key: string, iv: string, mode: CryptCipherMode) -> string,
    user_decrypt: (data: string, key: string, iv: string, mode: CryptCipherMode) -> string,
    user: cryptUser,

    sealencrypt: (data: string, key: string) -> string,
    seal_encrypt: (data: string, key: string) -> string,
    sealdecrypt: (data: string, key: string) -> string,
    seal_decrypt: (data: string, key: string) -> string,
    seal: (data: string, key: string) -> string,
    sealkeygen: () -> (string, string),
    seal_keygen: () -> (string, string),

    sign: (data: string, key: string) -> string,
    signopen: (data: string, key: string) -> string,
    sign_open: (data: string, key: string) -> string,
    signkeygen: () -> (string, string),
    sign_keygen: () -> (string, string),
    signcreate: () -> (string, string),
    sign_create: () -> (string, string),

    lz4: (data: string) -> string,
    lz4compress: (data: string) -> string,
    lz4_compress: (data: string) -> string,
    lz4decompress: (data: string) -> string,
    lz4_decompress: (data: string) -> string,

    hex: (data: string) -> string,
    hexencode: (data: string) -> string,
    hex_encode: (data: string) -> string,
    hexdecode: (data: string) -> string,
    hex_decode: (data: string) -> string,

    base64: (data: string) -> string,
    base64encode: (data: string) -> string,
    base64_encode: (data: string) -> string,
    base64decode: (data: string) -> string,
    base64_decode: (data: string) -> string,

    generatekey: () -> string,
    generate_key: () -> string,
    generatebytes: (size: number) -> string,
    generate_bytes: (size: number) -> string,
    random: (size: number) -> string,

    derivekey: (password: string, salt: string, iterations: number, keyLength: number) -> string,
    derive_key: (password: string, salt: string, iterations: number, keyLength: number) -> string,
    derivepassword: (password: string, salt: string) -> string,
    derive_password: (password: string, salt: string) -> string,

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
declare httpget:
    ((url: string, synchronous: boolean?, httpRequestType: typeof(Enum.HttpRequestType)?, doNotAllowDiabolicalMode: boolean?) -> string)
    & ((self: any?, url: string) -> string)
declare http_get:
    ((url: string, synchronous: boolean?, httpRequestType: typeof(Enum.HttpRequestType)?, doNotAllowDiabolicalMode: boolean?) -> string)
    & ((self: any?, url: string) -> string)
declare function httppost(url: string, data: string, synchronous: boolean?, httpRequestType: typeof(Enum.HttpRequestType)?, doNotAllowDiabolicalMode: boolean?): string
declare function http_post(url: string, data: string, synchronous: boolean?, httpRequestType: typeof(Enum.HttpRequestType)?, doNotAllowDiabolicalMode: boolean?): string
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

--#region Http
type http = {
    request: (options: Request) -> Response,
    gethostip: () -> string,
    gethost_ip: () -> string,
}
declare http: http
declare function gethostip(): string
declare function gethost_ip(): string
declare function httprequest(options: Request): Response
declare function http_request(options: Request): Response
--#endregion

--#region Reflection
declare function gethiddenproperty(instance: Instance, property_name: string): (any, boolean)
declare function getthreadidentity(): number
declare function sethiddenproperty(instance: Instance, property_name: string, property_value: any): boolean
declare function setscriptable(object: Instance, property: string, state: boolean): boolean?
declare function setthreadidentity(id: number): ()
declare function setthreadcontext(id: number): ()

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
declare function cansignalreplicate<T...>(signal: RBXScriptSignal<T...>): boolean
declare function setconnectionenabled(connection: Connection, enabled: boolean): ()
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

--#region Syn
type SynToastType = "Success" | "Error" | "Warning" | "Info" | "Question"
type SynCallStackEntry = {
    currentline: number?,
    env: AnyTable?,
    source: string?,
    name: string?,
    numparams: number?,
    is_vararg: BooleanNumber?,
    func: AnyFunction?,
}
type SynThreadOptions = {
    script: GenericScript?,
    identity: number?,
    env: AnyTable?,
    thread: thread?,
}
type ToastNotificationOptions = {
    Type: SynToastType,
    Duration: number?,
    Title: string,
    Content: string,
    IconColor: Color3?,
}
type syn = {
    trampoline_call: (target: AnyFunction, call_stack: { SynCallStackEntry }, thread_options: SynThreadOptions, ...any) -> (boolean, ...any),
    trampolinecall: (target: AnyFunction, call_stack: { SynCallStackEntry }, thread_options: SynThreadOptions, ...any) -> (boolean, ...any),

    run_on_actor: (actor: Actor, source: string, ...any) -> boolean,
    runonactor: (actor: Actor, source: string, ...any) -> boolean,

    get_thread_identity: () -> number,
    getthreadidentity: () -> number,
    set_thread_identity: (identity: number) -> (),
    setthreadidentity: (identity: number) -> (),

    toast_notification: (options: ToastNotificationOptions) -> (),
    toastnotification: (options: ToastNotificationOptions) -> (),

    kill_process: () -> (),
    killprocess: () -> (),

    queue_on_teleport: (script: string) -> (),
    queueonteleport: (script: string) -> (),
    clear_teleport_queue: () -> (),
    clearteleportqueue: () -> (),

    protect_gui: (target: Instance) -> (),
    protectgui: (target: Instance) -> (),
    unprotect_gui: (target: Instance) -> (),
    unprotectgui: (target: Instance) -> (),

    get_auroraservice: () -> Instance,
    getauroraservice: () -> Instance,

    request: (options: Request) -> Response,
    oth: typeof(oth),
    crypt: typeof(crypt),
    on_actor_state_created: VoltSignal,
}
declare syn: syn
--#endregion

--#region ImGui
type ImGuiStringBuffer = {
    Text: string,
    SetText: (self: ImGuiStringBuffer, text: string) -> (),
    GetText: (self: ImGuiStringBuffer) -> string,
    Clear: (self: ImGuiStringBuffer) -> (),
}
type ImGuiStringBufferConstructor = {
    new: (initial_text: string?) -> ImGuiStringBuffer,
}
type ImGuiFont = {
    GetScale: (self: ImGuiFont) -> number,
    SetScale: (self: ImGuiFont, scale: number) -> (),
    IsLoaded: (self: ImGuiFont) -> boolean,
    IsDirty: (self: ImGuiFont) -> boolean,
}
type ImGuiImage = {
    Width: number,
    Height: number,
    IsLoaded: (self: ImGuiImage) -> boolean,
}
type ImGuiTexture = ImGuiImage | number
type ImGuiWindowFlags = number
type ImGuiChildFlags = number
type ImGuiCond = number
type ImGuiColorEditFlags = number
type ImGuiInputTextFlags = number
type ImGuiSelectableFlags = number
type ImGuiComboFlags = number
type ImGuiTreeNodeFlags = number
type ImGuiPopupFlags = number
type ImGuiTabItemFlags = number
type ImGuiButtonFlags = number
type ImGuiSliderFlags = number
type ImGuiCol = number

type ImGui = {
    ArrowButton: (id: string, dir: number) -> boolean,
    ArrowButtonEx: (id: string, dir: number, size: Vector2, flags: ImGuiButtonFlags?) -> boolean,
    Begin: (name: string, open: boolean?, flags: ImGuiWindowFlags?) -> (boolean, boolean?),
    BeginChild: (id: string, size: Vector2?, flags: ImGuiChildFlags?) -> boolean,
    BeginCombo: (label: string, preview_value: string, flags: ImGuiComboFlags?) -> boolean,
    BeginItemTooltip: (id: string?, flags: number?) -> boolean,
    BeginListBox: (label: string, size: Vector2?) -> boolean,
    BeginMenu: (label: string, enabled: boolean?) -> boolean,
    BeginMenuBar: () -> boolean,
    BeginPopup: (id: string, flags: ImGuiPopupFlags?) -> boolean,
    BeginTooltip: () -> boolean,
    BeginTooltipEx: (flags: number?) -> boolean,
    BeginTooltipHidden: () -> boolean,
    Button: (label: string, size: Vector2?) -> boolean,
    ButtonEx: (label: string, size: Vector2?, flags: ImGuiButtonFlags?) -> boolean,
    CalcTextSize: (size: number, font_size: number, text: string, wrap_width: number?) -> Vector2,
    Checkbox: (label: string, v: boolean) -> (boolean, boolean),
    CollapsingHeader: (label: string, flags: ImGuiTreeNodeFlags?) -> boolean,
    ColorButton: (label: string, col: Color3, flags: ImGuiColorEditFlags?, size: Vector2?) -> boolean,
    ColorPicker3: (label: string, col: Color3, flags: ImGuiColorEditFlags?) -> Color3,
    Combo: (label: string, current_item: number, items: { string }, popup_max_height_in_items: number?) -> (boolean, number),
    End: () -> (),
    EndChild: () -> (),
    EndCombo: () -> (),
    EndListBox: () -> (),
    EndMenu: () -> (),
    EndMenuBar: () -> (),
    EndPopup: () -> (),
    EndTooltip: () -> (),
    GetColorU32: (col: Color3, alpha_mul: number?) -> number,
    GetCursorPos: () -> Vector2,
    GetFont: () -> ImGuiFont,
    GetWindowPos: () -> Vector2,
    GetWindowSize: () -> Vector2,
    Image: (texture: ImGuiTexture, size: Vector2, uv0: Vector2?, uv1: Vector2?, bg_col: Color3?, tint_col: Color3?) -> (),
    ImageButton: (texture: ImGuiTexture, size: Vector2, uv0: Vector2?, uv1: Vector2?, bg_col: Color3?, tint_col: Color3?) -> boolean,
    Indent: (indent_w: number?) -> (),
    InputText: (label: string, buf: string | ImGuiStringBuffer, flags: ImGuiInputTextFlags?) -> (boolean, string),
    InputTextMultiline: (label: string, buf: string | ImGuiStringBuffer, size: Vector2?, flags: ImGuiInputTextFlags?) -> (boolean, string),
    InputTextWithHint: (label: string, hint: string, buf: string | ImGuiStringBuffer, flags: ImGuiInputTextFlags?) -> (boolean, string),
    InvisibleButton: (label: string, size: Vector2, flags: ImGuiButtonFlags?) -> (boolean, boolean),
    IsItemClicked: (mouse_button: number?) -> boolean,
    LoadImage: (data: string) -> ImGuiImage?,
    MenuItem: (label: string, shortcut: string?, selected: boolean?, enabled: boolean?) -> (boolean, boolean),
    OnRender: (callback: () -> ()) -> (),
    OpenPopup: (id: string, flags: ImGuiPopupFlags?) -> (),
    PopId: () -> (),
    PopItemWidth: () -> (),
    PopStyleColor: (count: number?) -> (),
    PushId: (id: string | number) -> (),
    PushItemWidth: (item_width: number) -> (),
    PushStyleColor: (idx: ImGuiCol | number, col: Color3) -> (),
    RadioButton: (label: string, active: boolean) -> (boolean, boolean),
    SameLine: (offset: number?, spacing: number?) -> (),
    Selectable: (label: string, selected: boolean, flags: ImGuiSelectableFlags?, size: Vector2?) -> (boolean, boolean),
    Separator: () -> (),
    SetCursorPos: (local_pos: Vector2) -> (),
    SetItemAllowOverlap: () -> (),
    SetItemDefaultFocus: () -> (),
    SetKeyboardFocusHere: (offset: number?) -> (),
    SetNextWindowPos: (pos: Vector2, cond: ImGuiCond?, pivot: Vector2?) -> (),
    SetNextWindowSize: (size: Vector2, cond: ImGuiCond?) -> (),
    SetNextWindowSizeConstraints: (min: Vector2, max: Vector2, custom_callback: ((size: Vector2, min: Vector2, max: Vector2) -> Vector2)?, custom_callback_data: any?) -> (),
    SetScrollHereX: (center_x_ratio: number?) -> (),
    SetScrollHereY: (center_y_ratio: number?) -> (),
    SliderAngle: (label: string, value: number, v_degrees_min: number?, v_degrees_max: number?, format: string?, flags: number?) -> (boolean, number),
    SliderFloat: (label: string, value: number, min: number, max: number, format: string?, flags: ImGuiSliderFlags?) -> (boolean, number),
    SliderInt: (label: string, value: number, min: number, max: number, format: string?, flags: ImGuiSliderFlags?) -> (boolean, number),
    SmallButton: (label: string) -> boolean,
    StringBuffer: ImGuiStringBufferConstructor,
    TabItemButton: (label: string, flags: ImGuiTabItemFlags?) -> boolean,
    Text: (text: string) -> (),
    TextColored: (col: Color3, text: string) -> (),
    TextDisabled: (text: string) -> (),
    TextEx: (text: string, text_end: string?, flags: number?) -> (),
    TextWrapped: (text: string) -> (),
    TreePop: () -> (),
    TreeNode: (label: string, flags: ImGuiTreeNodeFlags?) -> boolean,
    TreeNodeEx: (label: string, flags: ImGuiTreeNodeFlags?) -> boolean,
    Unindent: (indent_w: number?) -> (),
}
declare ImGui: ImGui