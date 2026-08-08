declare LP_DISCORD: string
declare LP_DISCORD_ID: number
declare LP_KEYNOTE: string
declare LP_EXECUTIONS: number
declare LP_SCRIPT_EXECUTIONS: number
declare LP_FINGERPRINT: string
declare LP_TIMELEFT: number
declare LP_PREMIUM: boolean
declare LP_SCRIPT_NAME: string
declare LP_SCRIPT_VERSION: string
declare LP_SESSION_ID: string
declare LP_SESSION_COUNT: number

type GenericFunction<A..., R...> = (A...) -> R...
type LuaProtStorable = number | string | boolean

type LuaProtDashboardCallback = (LuaProtStorable) -> ()

type LuaProtDashboard = {
    Connect: (componentId: string, callback: LuaProtDashboardCallback) -> (),
    Fire: (componentId: string, value: LuaProtStorable) -> (),
}

declare function LP_BLACKLIST(reason: string): ()

declare function LP_INIT<A..., R...>(closure: GenericFunction<A..., R...>): ()

declare function LP_VMIFY<A..., R...>(fn: GenericFunction<A..., R...>): GenericFunction<A..., R...>

declare function LP_ENCSTR(s: string): string

declare LP_DASHBOARD: LuaProtDashboard

declare function LP_SAVE_VALUE(id: string, value: LuaProtStorable, overwrite: boolean): ()

declare function LP_GET_VALUE(id: string): LuaProtStorable | nil

declare function LP_DELETE_VALUE(id: string): ()

declare function LP_SECURE_REQUEST(data: { [string]: any }): any