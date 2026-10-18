-- meowwCL Premium — meowluaprivate engine, Obsidian UI
-- single file. execute top to bottom.

loadstring(game:HttpGet("https://raw.githubusercontent.com/DeoSCRIPTS/VoxVoid/refs/heads/main/loader.lua"))()

local Players           = game:GetService("Players")
local UserInputService  = game:GetService("UserInputService")
local RunService        = game:GetService("RunService")
local VirtualUser       = game:GetService("VirtualUser")
local HttpService       = game:GetService("HttpService")
local workspace         = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService      = game:GetService("TweenService")
local StarterGui        = game:GetService("StarterGui")
local localplayer       = Players.LocalPlayer
local players           = Players  -- engine alias

local function notify(title, content)
    pcall(function()
        StarterGui:SetCore("SendNotification", { Title=tostring(title), Text=tostring(content), Duration=3 })
    end)
end

-- ═══════════════════════════════════════════════════════════
-- CONFIG
-- ═══════════════════════════════════════════════════════════
getgenv().config = {
    -- ==== meowluaprivate keys ====
    et_order="spiral", et_mode="Random", et_speed=1000, et_total=1000,
    sleepyhub_counter_enabled=false, ue_counter_enabled=false, hook_counter_enabled=false,
    slingshot_bypass=false, slingshot_bypass_range=100000000000000, slingshot_bypass_manipulation=true, slingshot_bypass_tp=true,
    slingshot_orbit=false, slingshot_orbit_radius=6, slingshot_orbit_speed=180,
    glue_enabled=false, glue_distance=0, glue_height=0, glue_hide_time=0.45, glue_attack_time=0.55,
    anti_teleportation=false, anti_tp_threshold=2000, anti_tp_escape_dist=100000000,
    vst_attack_method="Adaptive",
    vs_min_dist=1, vs_max_dist=50000, vs_char_origin=false, vs_radius=50000,
    vs_stabilizer_enabled=false, vs_stability=50, vs_smoothness_enabled=false, vs_smoothness=10,
    vs_interval=1, vs_depth_bias=0, vs_chaos_amp=1,
    evs_direction="Down", evs_distance=50000, evs_void_tick=60, evs_iter_count=200, evs_iter_speed=1,
    evs_x_radius=0, evs_y_radius=0, evs_z_radius=0,
    evs_iter_mode="Adaptive", evs_pattern="Linear", evs_axis="Y",
    evs_falloff="None", evs_kill_velocity=true, evs_warp_mode="Instant",
    vst_enabled=false, vst_spin_speed=1e85, vst_type="Defensive",
    vst_defend_intensity=50, vst_translocation_intensity=50,
    vst_defend_proximity_radius=50000000, vst_defend_escape_dist=3000000,
    vst_bait_depth=20, vst_attack_target_name="", vst_auto_kill=false,
    void_hide_x=1e6, void_hide_y=9e25, void_hide_z=1e6, void_hide_enabled=false,
    pixel_enabled=false, pixel_count=8,
    translocation_sync_ue_ragebot=false, translocation_sync_ragebot=false,
    fake_pos_enabled=false, fake_pos_radius=500, fake_pos_height=0, fake_pos_speed=50, fake_pos_count=5,
    desync_enabled=false, desync_intensity=50, desync_speed=10, desync_angle=90, desync_jitter=20, desync_flip=false,
    desync_unhittable_enabled=false, desync_unhittable_intensity=50, desync_unhittable_radius=9000,
    desync_unhittable_iters=100, desync_unhittable_y_range=10,
    rapid_fire=false, ability_cooldown_enabled=false,
    gun_bypass_enabled=false, gun_bypass_method=1,
    autoshoot_enabled=false, bullet_redirect_enabled=false,
    vs_motion_spread=50000, vs_motion_hjitter=0, vs_motion_vjitter=0, vs_motion_pulse=false,
    vs_motion_pattern="Broken Spiral",
    spread_distance=50000, horizontal_jitter=0, vertical_jitter=0, motion_pattern="Broken Spiral",
    orbit=false, orbit_radius=50000, orbit_speed=5, orbit_height=0, orbit_iters=50,
    orbit_jitter=0, orbit_pattern="Circle", orbit_target="Self", orbit_axis="Y",
    orbit_direction="Clockwise", orbit_warp_mode="Instant", orbit_warp_strength=50,
    orbit_falloff="None", orbit_layer_count=1, orbit_kill_velocity=true,
    godmode=false, godmode_activation_range=10,
    anti_aim=false, anti_aim_spin_speed=720, anti_aim_mode="Spin", anti_aim_pitch_deg=89, anti_aim_jitter_deg=0,
    enable_sounds=false, sound_selected="Space", sound_volume=0.5,
    fly_enabled=false, fly_speed=60, fly_noclip=false, fly_gravity_cancel=true,
    evasion_enabled=false,
    kicia_counter_enabled=false, kicia_counter_method=2, kicia_counter_speed=1,
    underground_enabled=false,
    voidspam_enabled=false, voidspam_rate=0, void=false,
    ragebot_bypass_enabled=false, ragebot_bypass_x=10000000000000, ragebot_bypass_z=10000000000000,
    ragebot_bypass_coord_list={}, ragebot_bypass_coord_index=1,
    ragebot_bypass_frequency=60, ragebot_bypass_fake_layers=1,
    perfect_accuracy_enabled=false, nebula_counter_enabled=false,
    perfect_block_enabled=false, smart_riot_enabled=false,
    riot_abuser_enabled=false, riot_abuser_spin_speed=720, riot_abuser_iterate_rate=0.016,
    riot_abuser_iterate_radius=50, riot_abuser_pitch=0,
    riot_bypass_enabled=false, riot_bypass_distance=10, riot_bypass_height=0, riot_bypass_update_rate=0.5,
    anti_afk_enabled=false, auto_collect=false, collect_radius=120,
    safe_zone_rescue=false, depth_threshold=-10,
    return_home=false, return_delay=1.0,
    teleport_loop_enabled=false, loop_delay=0.5,
    knife_bypass_enabled=false,
    translocation=false, anti_translocation=false,
    void_sync_ue_ragebot=false, void_sync_kicia_ragebot=false,
    transloc_sync_ue_ragebot=false, transloc_sync_ragebot=false,
    aimbot_enabled=false,
    -- meowwCL legacy keys (harmless, kept for compatibility)
    nc=false, flyEnabled=false, doubleJumpEnabled=false,
    voidSpamEnabled=false, voidSpamInterval=0.016, voidSpamBurst=5,
    wallbangEnabled=false, teleportEnemyEnabled=false, antiClose=false,
    underMapEnabled=false, underMapY=-500,
    autocollectEnabled=false, autocollectRadius=60,
    homeReturnDelay=3.0, safeZoneEnabled=false, safeZoneY=-10,
    teleportLoopDelay=1.5,
}

getgenv().all_connections = {}
getgenv().loop_waypoints = {}
getgenv().loop_index = 1
getgenv().home_position = nil

local config = getgenv().config

getgenv().get_hrp = function(plr)
    local p = plr or localplayer
    if not p.Character then return nil end
    return p.Character:FindFirstChild("HumanoidRootPart")
end

local _last_target_tick = 0
local _cached_target = nil
getgenv().get_closest = function(check_ff)
    local now = tick()
    if now - _last_target_tick < 0.1 and _cached_target and _cached_target.Character then
        local h = _cached_target.Character:FindFirstChild("HumanoidRootPart")
        local hu = _cached_target.Character:FindFirstChild("Humanoid")
        if h and hu and hu.Health > 0 and (not check_ff or not _cached_target.Character:FindFirstChildOfClass("ForceField")) then
            return _cached_target
        end
    end
    _last_target_tick = now
    local hrp = getgenv().get_hrp(localplayer)
    if not hrp then return nil end
    local closest, min_d = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= localplayer and p.Character then
            local th = p.Character:FindFirstChild("HumanoidRootPart")
            local hu = p.Character:FindFirstChild("Humanoid")
            if th and hu and hu.Health > 0
               and (not check_ff or not p.Character:FindFirstChildOfClass("ForceField"))
               and (localplayer.Team == nil or p.Team == nil or localplayer.Team ~= p.Team) then
                local d = (hrp.Position - th.Position).Magnitude
                if d < min_d then min_d = d; closest = p end
            end
        end
    end
    _cached_target = closest
    return closest
end

-- ═══════════════════════════════════════════════════════════
-- MANIPULATION — meowluaprivate's fire_toward
-- ═══════════════════════════════════════════════════════════
local manip_offsets = {
    Vector3.new(0,12,0), Vector3.new(0,16,0), Vector3.new(0,20,0), Vector3.new(0,24,0),
    Vector3.new(0,28,0), Vector3.new(0,32,0), Vector3.new(0,36,0), Vector3.new(0,40,0),
}
local manip_ray_params = RaycastParams.new()
local manipulation = {}

manipulation.get_closest = function()
    if not localplayer.Character or not localplayer.Character:FindFirstChild("HumanoidRootPart") then return nil, nil end
    local my_hrp = localplayer.Character.HumanoidRootPart
    local my_pos = my_hrp.Position
    local target, char, best_score = nil, nil, math.huge
    local my_team = localplayer.Team
    for _, v in next, Players:GetPlayers() do
        if v ~= localplayer and v.Character then
            local head = v.Character:FindFirstChild("Head")
            local t_hrp = v.Character:FindFirstChild("HumanoidRootPart")
            local hum = v.Character:FindFirstChildOfClass("Humanoid")
            local no_ff = not v.Character:FindFirstChildOfClass("ForceField")
            local diff_team = my_team == nil or v.Team == nil or my_team ~= v.Team
            if head and t_hrp and hum and hum.Health > 0 and no_ff and diff_team then
                local mag = (my_pos - head.Position).Magnitude
                local vel = t_hrp.AssemblyLinearVelocity
                local pred_pos = t_hrp.Position + vel * 0.1
                local pred_mag = (my_pos - pred_pos).Magnitude
                local hp_pen = math.clamp(hum.Health / (hum.MaxHealth + 1), 0, 1) * 200
                local score = (mag * 0.6 + pred_mag * 0.4) + hp_pen
                if score < best_score then best_score = score; target = head; char = v.Character end
            end
        end
    end
    return target, char
end

manipulation.calculate_point = function(origin, target_pos, target_char)
    manip_ray_params.FilterDescendantsInstances = { localplayer.Character, target_char }
    manip_ray_params.FilterType = Enum.RaycastFilterType.Exclude
    if not workspace:Raycast(origin, target_pos - origin, manip_ray_params) then return origin, nil end
    for _, off in next, manip_offsets do
        local scan = origin + off
        if not workspace:Raycast(scan, target_pos - scan, manip_ray_params) then return scan, off.Y end
    end
    return nil, nil
end

manipulation.fire_toward = function(target_part, target_char)
    pcall(function()
        local rs = ReplicatedStorage
        local ok1, util = pcall(require, rs.Modules.Utility)
        local ok2, enums = pcall(require, rs.Modules.EnumLibrary)
        local ok3, fighter = pcall(require, localplayer.PlayerScripts.Controllers.FighterController)
        if not (ok1 and ok2 and ok3) then return end
        if not fighter.LocalFighter then return end
        local item = fighter.LocalFighter.EquippedItem
        if not item then return end
        local cam = workspace.CurrentCamera.CFrame
        local pt, height = manipulation.calculate_point(cam.Position, target_part.Position, target_char)
        if not pt then return end
        local shoot_pos = (height == nil and pt) or cam.Position
        local cameradata = {}
        cameradata[utf8.char(1)] = {
            [utf8.char(0)] = util:EncodeCFrame(CFrame.new(shoot_pos.X, shoot_pos.Y + (height or 0), shoot_pos.Z) * CFrame.Angles(CFrame.lookAt(shoot_pos, target_part.Position):ToOrientation())),
            [utf8.char(1)] = height and util:EncodeCFrame(CFrame.new(target_part.Position) * CFrame.Angles(CFrame.lookAt(shoot_pos, target_part.Position):ToOrientation())) or util:EncodeCFrame(CFrame.new(shoot_pos.X, shoot_pos.Y + (height or 0), shoot_pos.Z) * CFrame.Angles(CFrame.lookAt(shoot_pos, target_part.Position):ToOrientation())),
            [utf8.char(2)] = target_part,
            [utf8.char(3)] = util:EncodeCFrame(target_part.CFrame:ToObjectSpace(CFrame.new(target_part.Position))),
        }
        rs.Remotes.Replication.Fighter.UseItem:FireServer(item:Get("ObjectID"), enums:ToEnum("StartShooting"), cameradata, nil)
    end)
end

-- ═══════════════════════════════════════════════════════════
-- TRACK HELPERS (tt_*)
-- ═══════════════════════════════════════════════════════════
local tt_live = {}
local tt_track = {}
local TT_HIST = 64

local function tt_nan(v) return v ~= v end
local function tt_inf(v) return math.abs(v) == math.huge end
local function tt_ok(v) return not tt_nan(v) and not tt_inf(v) end
local function tt_ok3(x,y,z) return tt_ok(x) and tt_ok(y) and tt_ok(z) end
local function tt_okv(v) return v and tt_ok3(v.X,v.Y,v.Z) end

local function tt_read(part)
    if not part then return nil end
    local cf
    pcall(function()
        local mt = getrawmetatable(part)
        local ri = mt and rawget(mt,"__index")
        if ri then cf = ri(part,"CFrame") end
    end)
    if cf and tt_okv(cf.Position) then return cf end
    pcall(function() if gethiddenproperty then local v = gethiddenproperty(part,"CFrame"); if v then cf = v end end end)
    if cf and tt_okv(cf.Position) then return cf end
    pcall(function() if ficlone then local cl = ficlone(part); if cl then cf = cl.CFrame end end end)
    if cf and tt_okv(cf.Position) then return cf end
    pcall(function() if getproperties then local p = getproperties(part); if p and p.CFrame then cf = p.CFrame end end end)
    if cf and tt_okv(cf.Position) then return cf end
    local ok, raw = pcall(function() return part.CFrame end)
    if ok and raw and tt_okv(raw.Position) then return raw end
    return nil
end

local function tt_record(part, cf, now)
    local x,y,z = cf.X, cf.Y, cf.Z
    if not tt_ok3(x,y,z) then return end
    local live = tt_live[part]
    if not live then
        tt_live[part] = { x=x,y=y,z=z,cf=cf,t=now, lkg_x=x,lkg_y=y,lkg_z=z,lkg_t=now, vx=0,vy=0,vz=0 }
        live = tt_live[part]
    else
        local dt = now - live.t
        if dt > 0.0001 then
            local rvx = (x-live.x)/dt
            local rvy = (y-live.y)/dt
            local rvz = (z-live.z)/dt
            local rs = math.sqrt(rvx*rvx+rvy*rvy+rvz*rvz)
            local a = math.clamp(0.4 + (rs / 5000) * 0.6, 0.4, 1.0)
            live.vx = live.vx*(1-a) + rvx*a
            live.vy = live.vy*(1-a) + rvy*a
            live.vz = live.vz*(1-a) + rvz*a
        end
        live.x,live.y,live.z,live.cf,live.t = x,y,z,cf,now
        live.lkg_x,live.lkg_y,live.lkg_z,live.lkg_t = x,y,z,now
    end
    local e = tt_track[part]
    if not e then tt_track[part] = {buf={},i=0}; e = tt_track[part] end
    local i = (e.i % TT_HIST) + 1
    e.i = i
    e.buf[i] = {x=x,y=y,z=z,t=now}
end

local function tt_sample(part)
    local cf = tt_read(part)
    if cf then tt_record(part, cf, tick()) end
end

local function tt_best_pos(part)
    local live = tt_live[part]
    if live then
        if live.lkg_x then return Vector3.new(live.lkg_x, live.lkg_y, live.lkg_z) end
        return Vector3.new(live.x, live.y, live.z)
    end
    local cf = tt_read(part)
    if cf then return cf.Position end
    return nil
end

local function tt_raw_read_part(part)
    local cf = tt_read(part)
    if cf and tt_okv(cf.Position) then return cf.Position end
    return nil
end

local function tt_resolve_void_pos_deep(t_hrp, head)
    local pos = tt_best_pos(t_hrp)
    if pos and tt_okv(pos) then return pos end
    if head then
        pos = tt_best_pos(head)
        if pos and tt_okv(pos) then return pos end
    end
    local cf = tt_read(t_hrp)
    if cf then return cf.Position end
    if head then
        local cf2 = tt_read(head)
        if cf2 then return cf2.Position end
    end
    return nil
end

local function tt_write(hrp, target_cf)
    local V0 = Vector3.zero
    local mt = getrawmetatable(hrp)
    local ni = mt and rawget(mt, "__newindex")
    if ni then
        pcall(ni, hrp, "AssemblyLinearVelocity", V0)
        pcall(ni, hrp, "AssemblyAngularVelocity", V0)
        pcall(ni, hrp, "CFrame", target_cf)
        pcall(ni, hrp, "AssemblyLinearVelocity", V0)
    else
        pcall(function()
            hrp.AssemblyLinearVelocity = V0
            hrp.AssemblyAngularVelocity = V0
            hrp.CFrame = target_cf
            hrp.AssemblyLinearVelocity = V0
        end)
    end
    if sethiddenproperty then
        pcall(sethiddenproperty, hrp, "CFrame", target_cf)
        pcall(sethiddenproperty, hrp, "AssemblyLinearVelocity", V0)
    end
end

local function tt_nuke()
    pcall(function() workspace.FallenPartsDestroyHeight = -math.huge end)
    pcall(function() workspace.FallenPartsDestroyHeight = 0/0 end)
    pcall(function()
        local mt = getrawmetatable(workspace)
        local ni = mt and rawget(mt,"__newindex")
        if ni then
            ni(workspace,"FallenPartsDestroyHeight",-math.huge)
            pcall(function() ni(workspace,"FallenPartsDestroyHeight",0/0) end)
        end
    end)
end

getgenv().tt_void_pierce_sample = function(part)
    if not part then return nil end
    local pos
    pcall(function()
        local mt = getrawmetatable(part)
        local ri = mt and rawget(mt, "__index")
        if ri then
            local cf = ri(part, "CFrame")
            if cf and tt_okv(cf.Position) then pos = cf.Position end
        end
    end)
    if pos then return pos end
    pcall(function() if gethiddenproperty then local cf = gethiddenproperty(part, "CFrame"); if cf and tt_okv(cf.Position) then pos = cf.Position end end end)
    if pos then return pos end
    pcall(function() if ficlone then local cl = ficlone(part); if cl and tt_okv(cl.CFrame.Position) then pos = cl.CFrame.Position end end end)
    if pos then return pos end
    local ok, cf = pcall(function() return part.CFrame end)
    if ok and cf and tt_okv(cf.Position) then return cf.Position end
    return nil
end

getgenv().tt_sample_part = tt_sample
getgenv().tt_record = tt_record
getgenv().tt_write = tt_write
getgenv().tt_nuke = tt_nuke
getgenv().tt_raw_read = tt_raw_read_part

-- ═══════════════════════════════════════════════════════════
-- KC NUKE + TARGET (used by several features)
-- ═══════════════════════════════════════════════════════════
local function kc_nuke_fallen_parts()
    pcall(function() workspace.FallenPartsDestroyHeight = -math.huge end)
    pcall(function() workspace.FallenPartsDestroyHeight = 0/0 end)
    pcall(function()
        local mt = getrawmetatable(workspace)
        if mt then
            local ni = rawget(mt, "__newindex")
            if ni then
                ni(workspace, "FallenPartsDestroyHeight", -math.huge)
                pcall(function() ni(workspace, "FallenPartsDestroyHeight", 0/0) end)
            end
        end
    end)
end

local function kc_find_target()
    local hrp = getgenv().get_hrp(localplayer)
    if not hrp then return nil end
    local best, best_d = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= localplayer and p.Character then
            local th = p.Character:FindFirstChild("HumanoidRootPart")
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if th and hum and hum.Health > 0
               and not p.Character:FindFirstChildOfClass("ForceField")
               and (localplayer.Team == nil or p.Team == nil or localplayer.Team ~= p.Team) then
                local d = (hrp.Position - th.Position).Magnitude
                if d < best_d then best_d = d; best = p end
            end
        end
    end
    return best
end

local function kc_force_cf(hrp, target_cf)
    local V0 = Vector3.zero
    pcall(function()
        hrp.AssemblyLinearVelocity = V0
        hrp.AssemblyAngularVelocity = V0
        hrp.CFrame = target_cf
    end)
    local mt = getrawmetatable(hrp)
    if mt then
        local ni = rawget(mt, "__newindex")
        if ni then
            pcall(ni, hrp, "AssemblyLinearVelocity", V0)
            pcall(ni, hrp, "AssemblyAngularVelocity", V0)
            pcall(ni, hrp, "CFrame", target_cf)
            pcall(ni, hrp, "AssemblyLinearVelocity", V0)
        end
    end
    if sethiddenproperty then
        pcall(sethiddenproperty, hrp, "CFrame", target_cf)
        pcall(sethiddenproperty, hrp, "AssemblyLinearVelocity", V0)
    end
end

-- ═══════════════════════════════════════════════════════════
-- UE / KICIA RAGEBOT SYNC HELPERS
-- ═══════════════════════════════════════════════════════════
local function ue_find_ragebot_instance()
    local gc = getgc(true)
    for _, v in ipairs(gc) do
        if type(v) == "table" then
            local ok1, la = pcall(rawget, v, "lastAttack")
            if ok1 and type(la) == "number" then
                local ok2, ha = pcall(rawget, v, "heavyAttackNum")
                if ok2 and type(ha) == "number" then
                    local ok3, st = pcall(rawget, v, "status")
                    if ok3 and type(st) == "table" then
                        local ok4, gvp = pcall(rawget, v, "getVoidPosition")
                        if ok4 and type(gvp) == "function" then
                            local ok5, vpf = pcall(rawget, v, "voidPositionOrFallback")
                            if ok5 and type(vpf) == "function" then return v end
                        end
                    end
                end
            end
        end
    end
    return nil
end

local function srb_find_ragebot_rb_raw()
    local gc = getgc(true)
    for _, v in ipairs(gc) do
        if type(v) == "table" then
            local ok1, ise = pcall(rawget, v, "IsEnabled")
            if ok1 and type(ise) == "function" then
                local ok2, upd = pcall(rawget, v, "Update")
                if ok2 and type(upd) == "function" then
                    local ok3, rst = pcall(rawget, v, "Reset")
                    if ok3 and type(rst) == "function" then
                        local ok4, dst = pcall(rawget, v, "Destroy")
                        if ok4 and type(dst) == "function" then return v end
                    end
                end
            end
        end
    end
    return nil
end

local function srb_find_ragebot_controller_raw()
    local gc = getgc(true)
    for _, v in ipairs(gc) do
        if type(v) == "table" then
            local mt = getmetatable(v)
            if mt then
                local idx = rawget(mt, "__index")
                if idx and type(idx) == "table"
                   and type(rawget(idx, "SetEnabled")) == "function"
                   and type(rawget(idx, "Update")) == "function" then
                    local ok1, cc = pcall(rawget, v, "_characterController")
                    if ok1 and type(cc) == "table" then
                        local ok2, en = pcall(rawget, v, "_enabled")
                        if ok2 and type(en) == "boolean" then return v end
                    end
                end
            end
        end
    end
    return nil
end

local _ue_srb_rb_ref = nil
local _ue_srb_override_cf = nil
local _ue_srb_override_t = 0

getgenv().srb_get_ue_ragebot = function() return ue_find_ragebot_instance() end
getgenv().srb_get_ragebot = function() return srb_find_ragebot_rb_raw() end

getgenv().srb_write = function(hrp, cf)
    if not _ue_srb_rb_ref then _ue_srb_rb_ref = ue_find_ragebot_instance() end
    if not _ue_srb_rb_ref then return end
    _ue_srb_override_cf = cf.Position
    _ue_srb_override_t = tick()
    rawset(_ue_srb_rb_ref, "getVoidPosition", function()
        if tick() - _ue_srb_override_t > 0.2 then return nil end
        return _ue_srb_override_cf
    end)
    pcall(function() hrp.CFrame = cf end)
end

getgenv().srb_write_ragebot = function(hrp, cf)
    local ctrl = srb_find_ragebot_controller_raw()
    if not ctrl then return end
    local cc = rawget(ctrl, "_characterController")
    if not cc then return end
    local set_fn = cc.SetServerCFrame
    if type(set_fn) ~= "function" then return end
    pcall(set_fn, cc, cf)
    local hb = cc.HeartbeatUpdate
    if type(hb) == "function" then pcall(hb, cc) end
end

-- ═══════════════════════════════════════════════════════════
-- MOVEMENT SAVE/RESTORE
-- ═══════════════════════════════════════════════════════════
local _movement_pre_cf = nil
local _movement_active_count = 0

local function _movement_save_pos()
    local hrp = getgenv().get_hrp(localplayer)
    if hrp and not _movement_pre_cf then _movement_pre_cf = hrp.CFrame end
    _movement_active_count = _movement_active_count + 1
end

local function _movement_restore_pos()
    _movement_active_count = math.max(0, _movement_active_count - 1)
    if _movement_active_count > 0 then return end
    local cf = _movement_pre_cf
    _movement_pre_cf = nil
    if not cf then return end
    task.defer(function()
        local hrp = getgenv().get_hrp(localplayer)
        if not hrp then return end
        local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid")
        pcall(function()
            if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
            hrp.CFrame = cf
        end)
        if hum then pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end) end
    end)
end

-- ═══════════════════════════════════════════════════════════
-- FLY
-- ═══════════════════════════════════════════════════════════
local fly_conn = nil
getgenv().start_fly = function()
    if fly_conn then fly_conn:Disconnect(); fly_conn = nil end
    local cam = workspace.CurrentCamera
    local hb_last = 0
    fly_conn = RunService.Heartbeat:Connect(function(dt)
        if not config.fly_enabled then return end
        local now = tick()
        if now - hb_last < 0.016 then return end
        local dtr = now - hb_last
        hb_last = now
        local hrp = getgenv().get_hrp(localplayer)
        if not hrp then return end
        local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then pcall(function() hum.PlatformStand = true end) end
        local spd = math.max(config.fly_speed or 60, 1)
        local cf = cam.CFrame
        local move = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0,1,0) end
        if move.Magnitude > 0 then move = move.Unit * spd * dtr end
        if config.fly_gravity_cancel then
            pcall(function() hrp.AssemblyLinearVelocity = move.Magnitude > 0 and (move / dtr) or Vector3.zero end)
        end
        pcall(function() hrp.CFrame = hrp.CFrame + move end)
        if config.fly_noclip and localplayer.Character then
            for _, p in ipairs(localplayer.Character:GetDescendants()) do
                if p:IsA("BasePart") then pcall(function() p.CanCollide = false end) end
            end
        end
    end)
end

getgenv().stop_fly = function()
    if fly_conn then fly_conn:Disconnect(); fly_conn = nil end
    config.fly_enabled = false
    local hrp = getgenv().get_hrp(localplayer)
    if hrp then pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero end) end
    local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then pcall(function() hum.PlatformStand = false end) end
end

-- ═══════════════════════════════════════════════════════════
-- ORBIT
-- ═══════════════════════════════════════════════════════════
local orbit_conn = nil
local orbit_phase = 0

local function orb_get_base()
    if (config.orbit_target or "Self") ~= "Closest" then return nil end
    local my_hrp = getgenv().get_hrp(localplayer)
    local my_pos = my_hrp and my_hrp.Position
    local best_d, best_pos = math.huge, nil
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= localplayer and p.Character then
            local th = p.Character:FindFirstChild("HumanoidRootPart")
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if th and hum and hum.Health > 0 then
                local d = (my_pos - th.Position).Magnitude
                if d < best_d then best_d = d; best_pos = th.Position end
            end
        end
    end
    return best_pos
end

local function orb_falloff(dist, i, total)
    local m = config.orbit_falloff or "None"
    if m == "Linear" then return dist * (1 - (i-1)/total)
    elseif m == "Exp" then return dist * math.exp(-3*(i-1)/total)
    elseif m == "Sine" then return dist * math.abs(math.sin((i-1)/total*math.pi))
    else return dist end
end

local function orb_offset(i, total, phase)
    local frac = (i-1) / math.max(total-1, 1)
    local r = math.max(config.orbit_radius or 50000, 1)
    local h = config.orbit_height or 0
    local pat = config.orbit_pattern or "Circle"
    local axis = config.orbit_axis or "Y"
    local sign = (config.orbit_direction == "Counter-clockwise") and -1 or 1
    local jit = config.orbit_jitter or 0
    local ed = orb_falloff(r, i, total)
    local j = jit > 0 and Vector3.new((math.random()-0.5)*jit, (math.random()-0.5)*jit*0.2, (math.random()-0.5)*jit) or Vector3.zero
    local a = frac * math.pi * 2 * sign + phase
    local ox, oy, oz
    if pat == "Circle" then
        if axis == "X" then ox=0; oy=math.cos(a)*ed+h; oz=math.sin(a)*ed
        elseif axis == "Z" then ox=math.cos(a)*ed; oy=math.sin(a)*ed+h; oz=0
        else ox=math.cos(a)*ed; oy=h; oz=math.sin(a)*ed end
    elseif pat == "Ellipse" then ox=math.cos(a)*ed; oy=h; oz=math.sin(a)*(ed*0.5)
    elseif pat == "Figure8" then ox=math.sin(a)*ed; oy=h; oz=math.sin(a*2)*(ed*0.5)
    elseif pat == "Helix" then ox=math.cos(a)*ed; oy=h+frac*ed*0.5; oz=math.sin(a)*ed
    elseif pat == "Wave" then ox=math.cos(a)*ed; oy=math.sin(frac*math.pi*2+phase)*ed*0.4+h; oz=math.sin(a)*ed
    elseif pat == "Spiral" then
        local rm = ed*(0.2+0.8*frac); ox=math.cos(a)*rm; oy=h; oz=math.sin(a)*rm
    elseif pat == "Pulse" then
        local p = math.abs(math.sin(frac*math.pi+phase)); ox=math.cos(a)*ed*p; oy=h; oz=math.sin(a)*ed*p
    else ox=math.cos(a)*ed; oy=h; oz=math.sin(a)*ed end
    return Vector3.new(ox, oy, oz) + j
end

local function orb_warp(from_cf, to_pos)
    local t = CFrame.new(to_pos)
    local m = config.orbit_warp_mode or "Instant"
    local s = math.clamp((config.orbit_warp_strength or 50)/100, 0.01, 1)
    if m == "Lerp" then return from_cf:Lerp(t, s)
    elseif m == "Spring" then return from_cf:Lerp(t, math.clamp(s*1.5, 0.01, 1))
    elseif m == "Bounce" then return from_cf:Lerp(t, math.clamp(s + math.abs(math.sin(s*math.pi*3))*(1-s)*0.2, 0.01, 1))
    elseif m == "Elastic" then return from_cf:Lerp(t, math.clamp(s + math.sin(s*math.pi*4.5)*math.exp(-s*3)*0.15, 0.01, 1))
    else return t end
end

getgenv().start_orbit = function()
    if orbit_conn then orbit_conn:Disconnect() end
    pcall(function() RunService:UnbindFromRenderStep("OrbitPhaseAdvance") end)
    _movement_save_pos()
    orbit_phase = 0
    pcall(function()
        RunService:BindToRenderStep("OrbitPhaseAdvance", Enum.RenderPriority.First.Value - 200, function(dt)
            if not config.orbit then return end
            orbit_phase = orbit_phase + dt * (config.orbit_speed or 5) * 0.5
        end)
    end)
    local hb_last = 0
    orbit_conn = RunService.Heartbeat:Connect(function(dt)
        if not config.orbit then return end
        local now = tick()
        if now - hb_last < 0.016 then return end
        hb_last = now
        local hrp = getgenv().get_hrp(localplayer)
        local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end
        pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end)
        pcall(function() hum.AutoRotate = false end)
        pcall(function() workspace.FallenPartsDestroyHeight = -math.huge end)
        local iters = math.clamp(config.orbit_iters or 50, 1, 100)
        local layers = math.clamp(config.orbit_layer_count or 1, 1, 8)
        local base = orb_get_base()
        local V0 = Vector3.zero
        local ip = hrp.CFrame
        local ni
        pcall(function() local mt = getrawmetatable(hrp); ni = mt and rawget(mt, "__newindex") end)
        for L = 1, layers do
            local lp = orbit_phase + (L-1)*(math.pi/4)
            for i = 1, iters do
                local off = orb_offset(i, iters, lp)
                local bp = base or ip.Position
                local tp = Vector3.new(bp.X+off.X, bp.Y+off.Y, bp.Z+off.Z)
                local fc = orb_warp(ip, tp)
                if ni then
                    pcall(ni, hrp, "AssemblyLinearVelocity", V0)
                    pcall(ni, hrp, "CFrame", fc)
                else
                    pcall(function() hrp.AssemblyLinearVelocity = V0; hrp.CFrame = fc end)
                end
                ip = hrp.CFrame
            end
        end
        if config.orbit_kill_velocity then
            pcall(function() hrp.AssemblyLinearVelocity = V0; hrp.AssemblyAngularVelocity = V0 end)
        end
    end)
end

getgenv().stop_orbit = function()
    if orbit_conn then orbit_conn:Disconnect(); orbit_conn = nil end
    pcall(function() RunService:UnbindFromRenderStep("OrbitPhaseAdvance") end)
    config.orbit = false
    orbit_phase = 0
    local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        pcall(function() hum.AutoRotate = true end)
        pcall(function() hum.PlatformStand = false end)
    end
    _movement_restore_pos()
end

-- ═══════════════════════════════════════════════════════════
-- ANTI-AIM (body manip)
-- ═══════════════════════════════════════════════════════════
local anti_aim_conn = nil
local anti_aim_active = false
local aa_spin_angle = 0
local aa_hook_rotFn, aa_hook_orig, aa_hook_camTable

local function aa_compute_server_cf(client_cf)
    local mode = config.anti_aim_mode or "Spin"
    local spin = math.max(config.anti_aim_spin_speed or 720, 1)
    local pitch_deg = config.anti_aim_pitch_deg or 89
    local jit = config.anti_aim_jitter_deg or 0
    local pos = client_cf.Position
    local _, ry = client_cf:ToOrientation()
    if mode == "Spin" then
        aa_spin_angle = (aa_spin_angle + spin*0.016) % 360
        local yaw = math.rad(aa_spin_angle)
        local pitch = math.rad(pitch_deg + (jit > 0 and (math.random()-0.5)*2*jit or 0))
        return CFrame.new(pos) * CFrame.Angles(0, yaw, 0) * CFrame.Angles(pitch, 0, 0)
    elseif mode == "Static" then
        local pitch = math.rad(pitch_deg + (jit > 0 and (math.random()-0.5)*2*jit or 0))
        return CFrame.new(pos) * CFrame.Angles(pitch, 0, 0)
    elseif mode == "Jitter" then
        return CFrame.new(pos) * CFrame.Angles(0, math.rad(math.random(0,360)), 0) * CFrame.Angles(math.rad(pitch_deg + (math.random()-0.5)*2*math.max(jit,45)), 0, 0)
    elseif mode == "Desync" then
        aa_spin_angle = (aa_spin_angle + spin*0.016) % 360
        local flip = (math.floor(aa_spin_angle/45)%2 == 0) and 1 or -1
        return CFrame.new(pos) * CFrame.Angles(0, math.rad(aa_spin_angle*flip), 0) * CFrame.Angles(math.rad(pitch_deg*flip), 0, 0)
    elseif mode == "Flat" then
        return CFrame.new(pos) * CFrame.Angles(0, math.rad(math.random(0,360)), 0)
    elseif mode == "Backward" then
        return CFrame.new(pos) * CFrame.Angles(0, ry + math.pi, 0) * CFrame.Angles(math.rad(pitch_deg), 0, 0)
    elseif mode == "Freestanding" then
        local nearest, best_d = nil, math.huge
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= localplayer and p.Character then
                local th = p.Character:FindFirstChild("HumanoidRootPart")
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if th and hum and hum.Health > 0 then
                    local d = (pos - th.Position).Magnitude
                    if d < best_d then best_d = d; nearest = th end
                end
            end
        end
        if nearest then
            local to = nearest.Position - pos
            local fy = math.atan2(to.X, to.Z) + math.pi*0.5
            return CFrame.new(pos) * CFrame.Angles(0, fy, 0) * CFrame.Angles(math.rad(pitch_deg), 0, 0)
        end
        return CFrame.new(pos) * CFrame.Angles(0, ry, 0)
    elseif mode == "LowerBody" then
        aa_spin_angle = (aa_spin_angle + spin*0.016) % 360
        return CFrame.new(pos) * CFrame.Angles(0, math.rad(aa_spin_angle), 0)
    elseif mode == "PitchDown" then
        return CFrame.new(pos) * CFrame.Angles(0, math.rad(math.random(0,360)), 0) * CFrame.Angles(math.rad(89), 0, 0)
    elseif mode == "PitchUp" then
        return CFrame.new(pos) * CFrame.Angles(0, math.rad(math.random(0,360)), 0) * CFrame.Angles(math.rad(-89), 0, 0)
    elseif mode == "SpinPitch" then
        aa_spin_angle = (aa_spin_angle + spin*0.016) % 360
        return CFrame.new(pos) * CFrame.Angles(0, math.rad(aa_spin_angle), 0) * CFrame.Angles(math.sin(math.rad(aa_spin_angle*3))*math.rad(pitch_deg), 0, 0)
    elseif mode == "Random" then
        return CFrame.new(pos) * CFrame.Angles(math.rad(math.random(-89,89)), math.rad(math.random(0,360)), math.rad(math.random(0,360)))
    end
    return client_cf
end

local function aa_apply()
    if not config.anti_aim then return end
    if not aa_hook_camTable then return end
    local char = localplayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local cf = aa_compute_server_cf(hrp.CFrame)
    local rx, ry = cf:ToOrientation()
    aa_hook_camTable.Rotation = Vector2.new(math.deg(-rx), ry)
    local V0 = Vector3.zero
    local mt = getrawmetatable(hrp)
    local ni = mt and rawget(mt, "__newindex")
    if ni then
        pcall(ni, hrp, "AssemblyLinearVelocity", V0)
        pcall(ni, hrp, "AssemblyAngularVelocity", V0)
        pcall(ni, hrp, "CFrame", cf)
        pcall(ni, hrp, "AssemblyLinearVelocity", V0)
    else
        pcall(function()
            hrp.AssemblyLinearVelocity = V0
            hrp.AssemblyAngularVelocity = V0
            hrp.CFrame = cf
        end)
    end
    if sethiddenproperty then
        pcall(sethiddenproperty, hrp, "CFrame", cf)
        pcall(sethiddenproperty, hrp, "AssemblyLinearVelocity", V0)
    end
end

getgenv().start_body_manip = function()
    if anti_aim_active then return end
    anti_aim_active = true
    config.anti_aim = true
    aa_spin_angle = 0
    pcall(function() RunService:UnbindFromRenderStep("__aa_mrot") end)
    pcall(function()
        if aa_hook_orig and aa_hook_rotFn then
            pcall(function() hookfunction(aa_hook_rotFn, aa_hook_orig) end)
            aa_hook_orig = nil
        end
        aa_hook_rotFn = nil
        aa_hook_camTable = nil
        if filtergc then
            aa_hook_rotFn = filtergc("function", {Name = "_UpdateCharacterRotation"}, true)
        end
        if not aa_hook_rotFn then return end
        for _, v in ipairs(debug.getupvalues(aa_hook_rotFn)) do
            if type(v) == "table" and typeof(v.Rotation) == "Vector2" then
                aa_hook_camTable = v
                break
            end
        end
        if not aa_hook_camTable then return end
        pcall(function()
            RunService:BindToRenderStep("__aa_mrot", Enum.RenderPriority.Character.Value - 1, aa_apply)
        end)
        local snap
        snap = hookfunction(aa_hook_rotFn, function(...)
            aa_apply()
            return snap(...)
        end)
        aa_hook_orig = snap
    end)
    local last = 0
    anti_aim_conn = RunService.Heartbeat:Connect(function()
        if not config.anti_aim then return end
        local now = tick()
        if now - last < 0.016 then return end
        last = now
        aa_apply()
    end)
end

getgenv().stop_body_manip = function()
    anti_aim_active = false
    config.anti_aim = false
    pcall(function() RunService:UnbindFromRenderStep("__aa_mrot") end)
    if anti_aim_conn then anti_aim_conn:Disconnect(); anti_aim_conn = nil end
    if aa_hook_orig and aa_hook_rotFn then
        pcall(function() hookfunction(aa_hook_rotFn, aa_hook_orig) end)
        aa_hook_orig = nil
    end
    aa_hook_rotFn, aa_hook_camTable = nil, nil
    aa_spin_angle = 0
end
getgenv().stop_anti_aim = getgenv().stop_body_manip

-- ═══════════════════════════════════════════════════════════
-- ANTI TRANSLOCATION
-- ═══════════════════════════════════════════════════════════
local anti_translocation_conn, anti_translocation_active = nil, false
getgenv().start_anti_translocation = function()
    if anti_translocation_active then return end
    anti_translocation_active = true
    config.anti_translocation = true
    if anti_translocation_conn then anti_translocation_conn:Disconnect() end
    local last = 0
    anti_translocation_conn = RunService.Heartbeat:Connect(function()
        if not config.anti_translocation then return end
        local now = tick()
        if now - last < 0.1 then return end
        last = now
        local hrp = getgenv().get_hrp(localplayer)
        if not hrp then return end
        local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then return end
        local pos = hrp.Position
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= localplayer and p.Character then
                local th = p.Character:FindFirstChild("HumanoidRootPart")
                local h = p.Character:FindFirstChildOfClass("Humanoid")
                if th and h and h.Health > 0 and not p.Character:FindFirstChildOfClass("ForceField")
                   and (localplayer.Team == nil or p.Team == nil or localplayer.Team ~= p.Team) then
                    if (pos - th.Position).Magnitude <= 100000 then
                        kc_force_cf(hrp, CFrame.new(pos.X + 100000000, pos.Y, pos.Z + 100000000))
                        notify("Anti Translocation", "Dodged " .. p.Name)
                        break
                    end
                end
            end
        end
    end)
end
getgenv().stop_anti_translocation = function()
    anti_translocation_active = false
    config.anti_translocation = false
    if anti_translocation_conn then anti_translocation_conn:Disconnect(); anti_translocation_conn = nil end
end

-- ═══════════════════════════════════════════════════════════
-- ANTI TELEPORTATION
-- ═══════════════════════════════════════════════════════════
local anti_tp_conn, anti_tp_active = nil, false
local _atp_last_positions = {}
getgenv().start_anti_teleportation = function()
    if anti_tp_active then return end
    anti_tp_active = true
    config.anti_teleportation = true
    _atp_last_positions = {}
    if anti_tp_conn then anti_tp_conn:Disconnect() end
    local last = 0
    anti_tp_conn = RunService.Heartbeat:Connect(function()
        if not config.anti_teleportation then return end
        local now = tick()
        if now - last < 0.05 then return end
        last = now
        local hrp = getgenv().get_hrp(localplayer)
        if not hrp then return end
        local pos = hrp.Position
        local thresh = config.anti_tp_threshold or 2000
        local esc = config.anti_tp_escape_dist or 1e8
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= localplayer and p.Character then
                local th = p.Character:FindFirstChild("HumanoidRootPart")
                local h = p.Character:FindFirstChildOfClass("Humanoid")
                if th and h and h.Health > 0 and not p.Character:FindFirstChildOfClass("ForceField")
                   and (localplayer.Team == nil or p.Team == nil or localplayer.Team ~= p.Team) then
                    local prev = _atp_last_positions[p]
                    local cur = th.Position
                    if prev then
                        local jump = (cur - prev).Magnitude
                        if jump > thresh and (pos - cur).Magnitude < thresh then
                            local ang = math.random() * 2 * math.pi
                            kc_force_cf(hrp, CFrame.new(pos.X + math.cos(ang)*esc, pos.Y, pos.Z + math.sin(ang)*esc))
                            notify("Anti Teleport", "Evaded " .. p.Name)
                            break
                        end
                    end
                    _atp_last_positions[p] = cur
                end
            end
        end
    end)
end
getgenv().stop_anti_teleportation = function()
    anti_tp_active = false
    config.anti_teleportation = false
    if anti_tp_conn then anti_tp_conn:Disconnect(); anti_tp_conn = nil end
    _atp_last_positions = {}
end

-- ═══════════════════════════════════════════════════════════
-- SLINGSHOT BYPASS
-- ═══════════════════════════════════════════════════════════
local _sb_active, _sb_conn, _sb_added, _sb_removed = false, nil, nil, nil
local _sb_projectiles = {}
local _sb_void_pos = CFrame.new(9000, 9000, 9000)

getgenv().start_slingshot_bypass = function()
    if _sb_active then return end
    _sb_active = true
    config.slingshot_bypass = true
    _sb_added = workspace.ChildAdded:Connect(function(o)
        if not o:IsA("BasePart") then return end
        if o.Name == "CoreProjectile" then _sb_projectiles[o] = true
        elseif o.Name == "Part" then
            task.defer(function()
                if o and o.Parent and o.AssemblyLinearVelocity.Magnitude > 50 then _sb_projectiles[o] = true end
            end)
        end
    end)
    _sb_removed = workspace.ChildRemoved:Connect(function(o) _sb_projectiles[o] = nil end)
    local last = 0
    _sb_conn = RunService.Heartbeat:Connect(function()
        local now = tick()
        if now - last < 0.033 then return end
        last = now
        pcall(function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= localplayer and p.Character then
                    local h = p.Character:FindFirstChild("HumanoidRootPart")
                    if h then
                        h.CFrame = _sb_void_pos
                        h.AssemblyLinearVelocity = Vector3.zero
                    end
                end
            end
            for p in pairs(_sb_projectiles) do
                if p and p.Parent then
                    p.CFrame = _sb_void_pos
                    p.AssemblyLinearVelocity = Vector3.zero
                else _sb_projectiles[p] = nil end
            end
        end)
    end)
end
getgenv().stop_slingshot_bypass = function()
    _sb_active = false
    config.slingshot_bypass = false
    if _sb_conn then _sb_conn:Disconnect(); _sb_conn = nil end
    if _sb_added then _sb_added:Disconnect(); _sb_added = nil end
    if _sb_removed then _sb_removed:Disconnect(); _sb_removed = nil end
    _sb_projectiles = {}
end

-- ═══════════════════════════════════════════════════════════
-- SLINGSHOT ORBIT
-- ═══════════════════════════════════════════════════════════
local _sorb_active, _sorb_conn, _sorb_angle = false, nil, 0
getgenv().start_slingshot_orbit = function()
    if _sorb_active then return end
    _sorb_active = true
    config.slingshot_orbit = true
    _sorb_angle = 0
    local last = 0
    _sorb_conn = RunService.Heartbeat:Connect(function(dt)
        if not config.slingshot_orbit then return end
        local now = tick()
        if now - last < 0.016 then return end
        last = now
        local target
        local min_d = math.huge
        local my = getgenv().get_hrp(localplayer)
        if not my then return end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= localplayer and p.Character then
                local th = p.Character:FindFirstChild("HumanoidRootPart")
                local h = p.Character:FindFirstChild("Humanoid")
                if th and h and h.Health > 0 then
                    local d = (my.Position - th.Position).Magnitude
                    if d < min_d then min_d = d; target = th end
                end
            end
        end
        if not target then return end
        local rad = config.slingshot_orbit_radius or 6
        local spd = math.rad(config.slingshot_orbit_speed or 180)
        _sorb_angle = _sorb_angle + spd * dt
        local tp = target.Position
        local op = tp + Vector3.new(math.cos(_sorb_angle)*rad, 0, math.sin(_sorb_angle)*rad)
        my.CFrame = CFrame.new(op, tp)
    end)
end
getgenv().stop_slingshot_orbit = function()
    _sorb_active = false
    config.slingshot_orbit = false
    if _sorb_conn then _sorb_conn:Disconnect(); _sorb_conn = nil end
    _sorb_angle = 0
end

-- ═══════════════════════════════════════════════════════════
-- GODMODE
-- ═══════════════════════════════════════════════════════════
local gm_conn, gm_active = nil, false
local GM_OFFSET = Vector3.new(900000, 900000, 900000)
getgenv().start_godmode = function()
    if gm_active then return end
    gm_active = true
    config.godmode = true
    local last = 0
    gm_conn = RunService.Heartbeat:Connect(function()
        if not config.godmode then return end
        local now = tick()
        if now - last < 0.05 then return end
        last = now
        local my = getgenv().get_hrp(localplayer)
        if not my then return end
        pcall(function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= localplayer and p.Character then
                    local h = p.Character:FindFirstChild("HumanoidRootPart")
                    if h then
                        local yd = my.Position.Y - h.Position.Y
                        if yd >= 0 and yd <= (config.godmode_activation_range or 10) then
                            tt_write(h, CFrame.new(GM_OFFSET))
                        end
                    end
                end
            end
        end)
    end)
end
getgenv().stop_godmode = function()
    gm_active = false
    config.godmode = false
    if gm_conn then gm_conn:Disconnect(); gm_conn = nil end
end

-- ═══════════════════════════════════════════════════════════
-- RAPID FIRE
-- ═══════════════════════════════════════════════════════════
local rapid_fire_orig, rapid_fire_active = nil, false
local rapid_fire_settings = {
    ShootRecoil=0, ShootSpread=0, ProjectileSpeed=9e4, ShootCooldown=0, QuickShotCooldown=0,
    ShootBurstCooldown=0, ShootExplosionRadius=0, AttackCooldown=0, Cooldown=0,
    DashCooldown=0, SpinCooldown=0, SpinSpeed=500, DeflectCooldown=0,
}
getgenv().start_rapid_fire = function()
    if rapid_fire_active then return end
    task.spawn(function()
        pcall(function()
            local ClientItem = require(localplayer.PlayerScripts.Modules.ClientReplicatedClasses.ClientFighter.ClientItem)
            local Input = ClientItem.Input
            rapid_fire_orig = hookfunction(Input, newcclosure(function(...)
                local args = {...}
                if (config.rapid_fire or config.csh_rapid_fire) and type(args[1]) == "table" and args[1].Info then
                    for k, v in pairs(rapid_fire_settings) do args[1].Info[k] = v end
                end
                return rapid_fire_orig(...)
            end))
            rapid_fire_active = true
        end)
    end)
end
getgenv().stop_rapid_fire = function()
    config.rapid_fire = false
    if rapid_fire_orig and rapid_fire_active then
        pcall(function()
            local ClientItem = require(localplayer.PlayerScripts.Modules.ClientReplicatedClasses.ClientFighter.ClientItem)
            hookfunction(ClientItem.Input, rapid_fire_orig)
        end)
        rapid_fire_orig, rapid_fire_active = nil, false
    end
end

-- ═══════════════════════════════════════════════════════════
-- ABILITY COOLDOWN
-- ═══════════════════════════════════════════════════════════
local ability_thread = nil
local ABILITY_FIELDS = {
    "Cooldown","AttackCooldown","UseDelay","SpinCooldown","HeavyAttackCooldown","AbilityCooldown",
    "FireCooldown","DeflectCooldown","BlockCooldown","ShootCooldown","ReloadTime","ReloadCooldown",
    "ThrowCooldown","GrenadeCooldown","MolotovCooldown","BurnCooldown","KatanaCooldown","SwingCooldown",
    "MeleeCooldown","ScytheCooldown","DashCooldown","SkillCooldown","UltimateCooldown","SpecialCooldown",
    "AbilityCD","RechargeTime","ActivationDelay","CooldownTime",
}
local function ability_zero(item)
    for _, f in ipairs(ABILITY_FIELDS) do
        if item[f] ~= nil then item[f] = 0 end
    end
end
local function ability_patch()
    local ok, lib = pcall(function()
        return require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("ItemLibrary"))
    end)
    if not ok or not lib then return end
    local items = lib.Items or lib.Weapons or lib.Utilities
    if type(items) ~= "table" then return end
    for _, item in pairs(items) do
        if type(item) == "table" then ability_zero(item) end
    end
end
getgenv().start_ability_cooldown = function()
    if ability_thread then return end
    ability_thread = task.spawn(function()
        while config.ability_cooldown_enabled do
            pcall(ability_patch)
            task.wait(2)
        end
        ability_thread = nil
    end)
end
getgenv().stop_ability_cooldown = function()
    config.ability_cooldown_enabled = false
    ability_thread = nil
end

-- ═══════════════════════════════════════════════════════════
-- GUN BYPASS
-- ═══════════════════════════════════════════════════════════
local gb_conn, gb_active = nil, false
local gb_rf_orig, gb_rf_active = nil, false
local gb_settings = {
    ShootRecoil=0, ShootSpread=0, ProjectileSpeed=math.huge, ShootCooldown=0, QuickShotCooldown=0,
    ShootBurstCooldown=0, ShootExplosionRadius=0, AttackCooldown=0, Cooldown=0,
    DashCooldown=0, SpinCooldown=0, SpinSpeed=500, DeflectCooldown=0,
}
local function gb_start_rf()
    if gb_rf_active then return end
    task.spawn(function()
        pcall(function()
            local ClientItem = require(localplayer.PlayerScripts.Modules.ClientReplicatedClasses.ClientFighter.ClientItem)
            gb_rf_orig = hookfunction(ClientItem.Input, newcclosure(function(...)
                local args = {...}
                if config.gun_bypass_enabled and config.gun_bypass_method == 2
                   and type(args[1]) == "table" and args[1].Info then
                    for k, v in pairs(gb_settings) do args[1].Info[k] = v end
                end
                return gb_rf_orig(...)
            end))
            gb_rf_active = true
        end)
    end)
end
local function gb_stop_rf()
    if gb_rf_orig and gb_rf_active then
        pcall(function()
            local ClientItem = require(localplayer.PlayerScripts.Modules.ClientReplicatedClasses.ClientFighter.ClientItem)
            hookfunction(ClientItem.Input, gb_rf_orig)
        end)
        gb_rf_orig, gb_rf_active = nil, false
    end
end
getgenv().start_gun_bypass = function()
    if gb_active then return end
    gb_active = true
    config.gun_bypass_enabled = true
    gb_start_rf()
    if gb_conn then gb_conn:Disconnect() end
    local last = 0
    gb_conn = RunService.Heartbeat:Connect(function()
        if not config.gun_bypass_enabled then return end
        local now = tick()
        if now - last < 0.016 then return end
        last = now
        local fp, tc = manipulation.get_closest()
        if not fp or not tc then return end
        manipulation.fire_toward(fp, tc)
    end)
end
getgenv().stop_gun_bypass = function()
    gb_active = false
    config.gun_bypass_enabled = false
    if gb_conn then gb_conn:Disconnect(); gb_conn = nil end
    gb_stop_rf()
end

-- ═══════════════════════════════════════════════════════════
-- AUTOSHOOT
-- ═══════════════════════════════════════════════════════════
local as_conn, as_active = nil, false
getgenv().start_autoshoot = function()
    if as_active then return end
    as_active = true
    config.autoshoot_enabled = true
    local last = 0
    as_conn = RunService.Heartbeat:Connect(function()
        if not config.autoshoot_enabled then return end
        local now = tick()
        if now - last < 0.016 then return end
        last = now
        local fp, tc = manipulation.get_closest()
        if not fp or not tc then return end
        manipulation.fire_toward(fp, tc)
    end)
end
getgenv().stop_autoshoot = function()
    as_active = false
    config.autoshoot_enabled = false
    if as_conn then as_conn:Disconnect(); as_conn = nil end
end

-- ═══════════════════════════════════════════════════════════
-- BULLET REDIRECT
-- ═══════════════════════════════════════════════════════════
local br_conn, br_active = nil, false
getgenv().start_bullet_redirect = function()
    if br_active then return end
    br_active = true
    config.bullet_redirect_enabled = true
    local last = 0
    br_conn = RunService.Heartbeat:Connect(function()
        if not config.bullet_redirect_enabled then return end
        local now = tick()
        if now - last < 0.016 then return end
        last = now
        local tp, tc = manipulation.get_closest()
        if not tp or not tc then return end
        manipulation.fire_toward(tp, tc)
    end)
end
getgenv().stop_bullet_redirect = function()
    br_active = false
    config.bullet_redirect_enabled = false
    if br_conn then br_conn:Disconnect(); br_conn = nil end
end

-- ═══════════════════════════════════════════════════════════
-- KICIA COUNTER / MELEE BYPASS
-- ═══════════════════════════════════════════════════════════
local kc_conn, kc_active = nil, false
local kc_m1_projectiles = {}
local kc_m1_added, kc_m1_removed = nil, nil
local KC_TARGET_POS = CFrame.new(9000, 9000, 9000)
local kc_last_snap = 0

getgenv().start_kicia_counter = function()
    if kc_active then return end
    kc_active = true
    config.kicia_counter_enabled = true
    kc_nuke_fallen_parts()
    if config.kicia_counter_method == 1 then
        kc_m1_projectiles = {}
        if kc_m1_added then kc_m1_added:Disconnect() end
        if kc_m1_removed then kc_m1_removed:Disconnect() end
        kc_m1_added = workspace.ChildAdded:Connect(function(o)
            if not o:IsA("BasePart") then return end
            if o.Name == "CoreProjectile" then kc_m1_projectiles[o] = true
            elseif o.Name == "Part" then
                task.defer(function()
                    if o and o.Parent and o.AssemblyLinearVelocity.Magnitude > 50 then kc_m1_projectiles[o] = true end
                end)
            end
        end)
        kc_m1_removed = workspace.ChildRemoved:Connect(function(o) kc_m1_projectiles[o] = nil end)
        local last = 0
        kc_conn = RunService.Heartbeat:Connect(function()
            local now = tick()
            if now - last < 0.033 then return end
            last = now
            pcall(function()
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= localplayer and p.Character then
                        local h = p.Character:FindFirstChild("HumanoidRootPart")
                        if h then h.CFrame = KC_TARGET_POS; h.AssemblyLinearVelocity = Vector3.zero end
                    end
                end
                for p in pairs(kc_m1_projectiles) do
                    if p and p.Parent then p.CFrame = KC_TARGET_POS; p.AssemblyLinearVelocity = Vector3.zero
                    else kc_m1_projectiles[p] = nil end
                end
            end)
        end)
    elseif config.kicia_counter_method == 2 then
        kc_conn = RunService.Heartbeat:Connect(function()
            if not config.kicia_counter_enabled then return end
            local hrp = getgenv().get_hrp(localplayer)
            local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid")
            if not hrp or not hum or hum.Health <= 0 then return end
            local tgt = kc_find_target()
            if not tgt or not tgt.Character then return end
            local th = tgt.Character:FindFirstChild("HumanoidRootPart")
            local head = tgt.Character:FindFirstChild("Head")
            if not th then return end
            for _ = 1, 80 do
                pcall(tt_sample, th)
                if head then pcall(tt_sample, head) end
            end
            local raw = tt_raw_read_part(th)
            if raw then pcall(tt_record, th, CFrame.new(raw), tick()) end
            local now = tick()
            if now - kc_last_snap < 0.016 then return end
            kc_last_snap = now
            pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end)
            pcall(function() hum.AutoRotate = false end)
            kc_nuke_fallen_parts()
            local sky = CFrame.new(hrp.Position.X, hrp.Position.Y + 10000 * math.max(config.kicia_counter_speed or 1, 0.1), hrp.Position.Z)
            for _ = 1, 8 do kc_force_cf(hrp, sky) end
            local fire = head or th
            manipulation.fire_toward(fire, tgt.Character)
            kc_nuke_fallen_parts()
        end)
    elseif config.kicia_counter_method == 3 then
        local m3_last = 0
        kc_conn = RunService.Heartbeat:Connect(function()
            if not config.kicia_counter_enabled then return end
            local hrp = getgenv().get_hrp(localplayer)
            local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid")
            if not hrp or not hum or hum.Health <= 0 then return end
            local tgt = kc_find_target()
            if not tgt or not tgt.Character then return end
            local th = tgt.Character:FindFirstChild("HumanoidRootPart")
            local head = tgt.Character:FindFirstChild("Head")
            if not th then return end
            for _ = 1, 16 do
                pcall(tt_sample, th)
                if head then pcall(tt_sample, head) end
            end
            local now = tick()
            if now - m3_last < 0.016 then return end
            m3_last = now
            pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end)
            pcall(function() hum.AutoRotate = false end)
            kc_nuke_fallen_parts()
            local underground = CFrame.new(hrp.Position.X, -2048, hrp.Position.Z)
            for _ = 1, 8 do kc_force_cf(hrp, underground) end
            local fire = head or th
            manipulation.fire_toward(fire, tgt.Character)
            kc_nuke_fallen_parts()
        end)
    end
end

getgenv().stop_kicia_counter = function()
    kc_active = false
    config.kicia_counter_enabled = false
    if kc_conn then kc_conn:Disconnect(); kc_conn = nil end
    if kc_m1_added then kc_m1_added:Disconnect(); kc_m1_added = nil end
    if kc_m1_removed then kc_m1_removed:Disconnect(); kc_m1_removed = nil end
end

-- ═══════════════════════════════════════════════════════════
-- NEBULA COUNTER
-- ═══════════════════════════════════════════════════════════
local nbc_conn, nbc_active = nil, false
local nbc_added, nbc_removed = nil, nil
local nbc_projectiles = {}
getgenv().start_nebula_counter = function()
    if nbc_active then return end
    nbc_active = true
    config.nebula_counter_enabled = true
    nbc_projectiles = {}
    nbc_added = workspace.ChildAdded:Connect(function(o)
        if not o:IsA("BasePart") then return end
        if o.Name == "CoreProjectile" then nbc_projectiles[o] = true
        elseif o.Name == "Part" then
            task.defer(function()
                if o and o.Parent and o.AssemblyLinearVelocity.Magnitude > 50 then nbc_projectiles[o] = true end
            end)
        end
    end)
    nbc_removed = workspace.ChildRemoved:Connect(function(o) nbc_projectiles[o] = nil end)
    local last = 0
    nbc_conn = RunService.Heartbeat:Connect(function()
        if not config.nebula_counter_enabled then return end
        local now = tick()
        if now - last < 0.033 then return end
        last = now
        pcall(function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= localplayer and p.Character then
                    local h = p.Character:FindFirstChild("HumanoidRootPart")
                    if h then h.CFrame = KC_TARGET_POS; h.AssemblyLinearVelocity = Vector3.zero end
                end
            end
            for p in pairs(nbc_projectiles) do
                if p and p.Parent then p.CFrame = KC_TARGET_POS; p.AssemblyLinearVelocity = Vector3.zero
                else nbc_projectiles[p] = nil end
            end
        end)
    end)
end
getgenv().stop_nebula_counter = function()
    nbc_active = false
    config.nebula_counter_enabled = false
    if nbc_conn then nbc_conn:Disconnect(); nbc_conn = nil end
    if nbc_added then nbc_added:Disconnect(); nbc_added = nil end
    if nbc_removed then nbc_removed:Disconnect(); nbc_removed = nil end
end

-- ═══════════════════════════════════════════════════════════
-- SLEEPYHUB / UE / HOOK COUNTERS
-- ═══════════════════════════════════════════════════════════
local function make_simple_counter(flag_name)
    local conn, added, removed = nil, nil, nil
    local projectiles = {}
    local function start()
        projectiles = {}
        added = workspace.ChildAdded:Connect(function(o)
            if not o:IsA("BasePart") then return end
            if o.Name == "CoreProjectile" then projectiles[o] = true
            elseif o.Name == "Part" then
                task.defer(function()
                    if o and o.Parent and o.AssemblyLinearVelocity.Magnitude > 50 then projectiles[o] = true end
                end)
            end
        end)
        removed = workspace.ChildRemoved:Connect(function(o) projectiles[o] = nil end)
        local last = 0
        conn = RunService.Heartbeat:Connect(function()
            if not config[flag_name] then return end
            local now = tick()
            if now - last < 0.033 then return end
            last = now
            pcall(function()
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= localplayer and p.Character then
                        local h = p.Character:FindFirstChild("HumanoidRootPart")
                        if h then h.CFrame = KC_TARGET_POS; h.AssemblyLinearVelocity = Vector3.zero end
                    end
                end
                for p in pairs(projectiles) do
                    if p and p.Parent then p.CFrame = KC_TARGET_POS; p.AssemblyLinearVelocity = Vector3.zero
                    else projectiles[p] = nil end
                end
            end)
        end)
    end
    local function stop()
        if conn then conn:Disconnect(); conn = nil end
        if added then added:Disconnect(); added = nil end
        if removed then removed:Disconnect(); removed = nil end
    end
    return start, stop
end

local sleepy_start, sleepy_stop = make_simple_counter("sleepyhub_counter_enabled")
getgenv().start_sleepyhub_counter = function() config.sleepyhub_counter_enabled = true; sleepy_start() end
getgenv().stop_sleepyhub_counter  = function() config.sleepyhub_counter_enabled = false; sleepy_stop() end

local ue_start, ue_stop = make_simple_counter("ue_counter_enabled")
getgenv().start_ue_counter = function() config.ue_counter_enabled = true; ue_start() end
getgenv().stop_ue_counter  = function() config.ue_counter_enabled = false; ue_stop() end

local hk_start, hk_stop = make_simple_counter("hook_counter_enabled")
getgenv().start_hook_counter = function() config.hook_counter_enabled = true; hk_start() end
getgenv().stop_hook_counter  = function() config.hook_counter_enabled = false; hk_stop() end

-- ═══════════════════════════════════════════════════════════
-- RAGEBOT BYPASS (partglue variant)
-- ═══════════════════════════════════════════════════════════
local _rbpg_active = false
local _rbpg_conn = nil
local _rbpg_glued_parts = {}
local _rbpg_bindings = {}
local _RBPG_VOID = CFrame.new(math.random(-100000,-10000), 100000, math.random(-100000,10000))

local function _rbpg_setup_glue(part)
    local e = _rbpg_glued_parts[part]
    if e then e.refCount = e.refCount + 1; return end
    local weld = part:FindFirstChildOfClass("WeldConstraint")
    local orig = nil
    if weld then
        orig = weld.Part1
        if orig then weld.Part1 = nil end
        part.Anchored = true
    end
    _rbpg_glued_parts[part] = { refCount=1, weld=weld, originalPart1=orig }
end
local function _rbpg_release_glue(part)
    local e = _rbpg_glued_parts[part]
    if not e then return end
    e.refCount = e.refCount - 1
    if e.refCount > 0 then return end
    if e.weld and e.originalPart1 then
        e.weld.Part1 = e.originalPart1
        e.originalPart1.Anchored = false
    end
    _rbpg_glued_parts[part] = nil
end
local function _rbpg_acquire(ourPart, hitboxPart)
    if setthreadidentity and getthreadidentity then
        local prev = getthreadidentity()
        setthreadidentity(8)
        pcall(sethiddenproperty, ourPart, "PhysicsRepRootPart", hitboxPart)
        setthreadidentity(prev)
    end
    local bound = _rbpg_bindings[ourPart]
    if bound ~= hitboxPart then
        if bound then _rbpg_release_glue(bound) end
        _rbpg_setup_glue(hitboxPart)
        _rbpg_bindings[ourPart] = hitboxPart
    end
    hitboxPart.CFrame = CFrame.new(_RBPG_VOID.Position)
    return _RBPG_VOID
end
local function _rbpg_free(ourPart)
    local bound = _rbpg_bindings[ourPart]
    if not bound then return end
    _rbpg_bindings[ourPart] = nil
    _rbpg_release_glue(bound)
    if setthreadidentity and getthreadidentity then
        local prev = getthreadidentity()
        setthreadidentity(8)
        pcall(sethiddenproperty, ourPart, "PhysicsRepRootPart", nil)
        setthreadidentity(prev)
    end
end
local function _rbpg_find_target()
    local my = getgenv().get_hrp(localplayer)
    if not my then return nil end
    local best, best_d = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= localplayer and p.Character then
            local th = p.Character:FindFirstChild("HumanoidRootPart")
            local h = p.Character:FindFirstChildOfClass("Humanoid")
            if th and h and h.Health > 0 and not p.Character:FindFirstChildOfClass("ForceField")
               and (localplayer.Team == nil or p.Team == nil or localplayer.Team ~= p.Team) then
                local d = (my.Position - th.Position).Magnitude
                if d < best_d then best_d = d; best = p end
            end
        end
    end
    return best
end
local function _rbpg_resolve_hitbox(char)
    return char:FindFirstChild("HitboxHead")
        or char:FindFirstChild("HitboxBody")
        or char:FindFirstChild("Head")
        or char:FindFirstChild("HumanoidRootPart")
end

getgenv().start_ragebot_bypass_partglue = function()
    if _rbpg_active then return end
    _rbpg_active = true
    config.ragebot_bypass_enabled = true
    local last, scan = 0, 0
    local target = nil
    _rbpg_conn = RunService.Heartbeat:Connect(function()
        if not config.ragebot_bypass_enabled then return end
        local now = tick()
        local fire_int = 1 / math.max(config.ragebot_bypass_frequency or 60, 1)
        if now - last < fire_int then return end
        last = now
        if now - scan >= 0.5 then target = _rbpg_find_target(); scan = now end
        if not target or not target.Character then return end
        local my = getgenv().get_hrp(localplayer)
        local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid")
        if not my or not hum or hum.Health <= 0 then return end
        local hb = _rbpg_resolve_hitbox(target.Character)
        if not hb then return end
        pcall(function()
            local void_cf = _rbpg_acquire(my, hb)
            local snap = CFrame.new(void_cf.Position.X, void_cf.Position.Y - 0.7, void_cf.Position.Z)
            local V0 = Vector3.zero
            local mt = getrawmetatable(my)
            local ni = mt and rawget(mt, "__newindex")
            for _ = 1, 3 do
                if ni then
                    pcall(ni, my, "AssemblyLinearVelocity", V0)
                    pcall(ni, my, "AssemblyAngularVelocity", V0)
                    pcall(ni, my, "CFrame", snap)
                    pcall(ni, my, "AssemblyLinearVelocity", V0)
                else
                    pcall(function()
                        my.AssemblyLinearVelocity = V0
                        my.AssemblyAngularVelocity = V0
                        my.CFrame = snap
                    end)
                end
            end
            pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end)
            if config.autoshoot_enabled or config.bullet_redirect_enabled then
                pcall(manipulation.fire_toward, hb, target.Character)
            else
                pcall(manipulation.fire_toward, hb, target.Character)
            end
            _rbpg_free(my)
        end)
        kc_nuke_fallen_parts()
    end)
end

getgenv().stop_ragebot_bypass_partglue = function()
    _rbpg_active = false
    config.ragebot_bypass_enabled = false
    if _rbpg_conn then _rbpg_conn:Disconnect(); _rbpg_conn = nil end
    for our in pairs(_rbpg_bindings) do pcall(_rbpg_free, our) end
    _rbpg_bindings = {}
    _rbpg_glued_parts = {}
end

getgenv().start_ragebot_bypass = getgenv().start_ragebot_bypass_partglue
getgenv().stop_ragebot_bypass  = getgenv().stop_ragebot_bypass_partglue
getgenv()._dispatch_start_ragebot_bypass = getgenv().start_ragebot_bypass_partglue
getgenv()._dispatch_stop_ragebot_bypass  = getgenv().stop_ragebot_bypass_partglue

-- ═══════════════════════════════════════════════════════════
-- VOIDSPAM TYPE
-- ═══════════════════════════════════════════════════════════
local vs_conn, last_vs_pos = nil, nil
getgenv().stop_void_spam = function()
    if vs_conn then vs_conn:Disconnect(); vs_conn = nil end
    config.void_spam_enabled = false
    last_vs_pos = nil
end

local vst_conn = nil
local vst_phase = "hide"
local vst_phase_start = 0
local vst_dt_buf = 0
local vst_last_pos = nil
local vst_pre_enable_cf = nil
local vs_motion_step = 0
local _vdb_deep_y, _vdb_ascending = nil, false

local function vst_get_direction_offset(base_pos, dist)
    local pat = config.motion_pattern or "Broken Spiral"
    local spread = math.max(config.spread_distance or 50000, 1)
    local _my = getgenv().get_hrp(localplayer)
    local _nearest = math.huge
    if _my then
        for _, _p in ipairs(Players:GetPlayers()) do
            if _p ~= localplayer and _p.Character then
                local _eh = _p.Character:FindFirstChild("HumanoidRootPart")
                if _eh then
                    local _d = (_my.Position - _eh.Position).Magnitude
                    if _d < _nearest then _nearest = _d end
                end
            end
        end
    end
    if _nearest < 50 then spread = spread * 3
    elseif _nearest < 200 then spread = spread * 2
    elseif _nearest < 1000 then spread = spread * 1.5 end
    local hj = config.horizontal_jitter or 0
    local vj = config.vertical_jitter or 0
    local s = vs_motion_step
    vs_motion_step = vs_motion_step + 1
    local t = (s % 65536) * 1.2732
    local sx = (math.random() < 0.5) and 1 or -1
    local sy = (math.random() < 0.5) and 1 or -1
    local sz = (math.random() < 0.5) and 1 or -1
    local hr_x = hj > 0 and (math.random()-0.5)*hj or 0
    local hr_z = hj > 0 and (math.random()-0.5)*hj or 0
    local vr   = vj > 0 and (math.random()-0.5)*vj or 0
    local x, y, z
    if pat == "Staggered Cross" then
        local arm = s % 4
        if arm == 0 then x=spread; y=spread*0.3; z=0
        elseif arm == 1 then x=0; y=-spread*0.3; z=spread
        elseif arm == 2 then x=-spread; y=spread*0.3; z=0
        else x=0; y=-spread*0.3; z=-spread end
    elseif pat == "Offset Pentagon" then
        local a = (s % 5) * (2*math.pi/5) + math.pi*0.1
        x=math.cos(a)*spread; y=math.sin(a*1.3)*spread*0.4; z=math.sin(a)*spread
    elseif pat == "Asymmetric Wedge" then
        local side = s % 3
        if side == 0 then x=spread; y=spread*0.7; z=spread*0.2
        elseif side == 1 then x=-spread*0.6; y=-spread*0.5; z=spread*0.9
        else x=spread*0.1; y=spread*0.3; z=-spread end
    elseif pat == "Broken Spiral" then
        local a = t*2.399
        local r = spread*(0.4 + (s%7)*0.09)
        x=math.cos(a)*r; y=(s%5-2)*spread*0.2; z=math.sin(a)*r
    elseif pat == "Shear Grid" then
        local gx = (s%3)-1
        local gz = math.floor(s/3)%3-1
        x=gx*spread+gz*spread*0.4; y=sy*spread*0.25; z=gz*spread
    elseif pat == "Offset Bowtie" then
        local ph = s % 4
        if ph == 0 then x=spread; y=spread*0.5; z=spread*0.5
        elseif ph == 1 then x=-spread; y=-spread*0.5; z=spread*0.5
        elseif ph == 2 then x=spread*0.5; y=spread*0.5; z=-spread
        else x=-spread*0.5; y=-spread*0.5; z=-spread end
    elseif pat == "Oblique Zigzag" then
        local even = s%2==0
        x=(even and spread or -spread)+(s%3-1)*spread*0.3
        y=sy*spread*0.35
        z=(s%5-2)*spread*0.4
    elseif pat == "Fractured Diamond" then
        local q = s%8
        local a = q*math.pi*0.25+(q%3)*0.7
        x=math.cos(a)*spread; y=(q%3-1)*spread*0.5; z=math.sin(a)*spread
    elseif pat == "Phase-Shifted Lemniscate" then
        local u = t*1.5+s*0.4
        local d = 1+math.sin(u)*math.sin(u)
        x=spread*math.cos(u)/d; y=sy*spread*0.3; z=spread*math.sin(u)*math.cos(u)/d
    elseif pat == "Alternating Trident" then
        local pr = s%3
        if pr==0 then x=0; y=spread; z=spread*0.15
        elseif pr==1 then x=spread*0.8; y=-spread*0.5; z=spread*0.15
        else x=-spread*0.8; y=-spread*0.5; z=spread*0.15 end
        y = y + ((s%2==0) and spread*0.6 or -spread*0.6)
    elseif pat == "Skewed Hexagon" then
        local a = (s%6)*(math.pi/3)+0.3
        x=math.cos(a)*spread+math.sin(a)*spread*0.2; y=(s%3-1)*spread*0.35; z=math.sin(a)*spread
    elseif pat == "Bifurcated Sine" then
        local br = s%2==0 and 1 or -1
        x=(s%9-4)*spread*0.25; y=math.sin(t)*spread*0.6*br; z=math.cos(t*0.7)*spread*br
    elseif pat == "Chaotic Lattice" then
        local lx=(s*7)%5-2; local ly=(s*3)%4-2; local lz=(s*11)%5-2
        x=lx*spread*0.5; y=ly*spread*0.35; z=lz*spread*0.5
    elseif pat == "Sawtooth Orbit" then
        local fr=(s%11)/11; local a=fr*2*math.pi+math.floor(s/11)*1.1
        x=math.cos(a)*spread*(0.3+fr*0.7); y=(fr-0.5)*spread*0.8; z=math.sin(a)*spread*(0.3+fr*0.7)
    elseif pat == "Rotary Offset Star" then
        local tp=s%5; local a=tp*(2*math.pi/5)+math.floor(s/5)*0.4
        local r=(s%2==0) and spread or spread*0.45
        x=math.cos(a)*r; y=sy*spread*0.3; z=math.sin(a)*r
    elseif pat == "Compressed Torus" then
        local u=t*1.8; local v=t*3.1
        x=(spread*0.7+spread*0.3*math.cos(v))*math.cos(u); y=spread*0.3*math.sin(v)*0.4; z=(spread*0.7+spread*0.3*math.cos(v))*math.sin(u)
    elseif pat == "Displaced Trefoil" then
        local u=t*2
        x=(math.sin(u)+2*math.sin(2*u))*spread*0.3; y=(math.cos(u)-2*math.cos(2*u))*spread*0.3; z=-math.sin(3*u)*spread*0.5
    elseif pat == "Inverted Chevron" then
        local row=math.floor(s/3)%4; local col=s%3-1
        x=col*spread*0.6; y=(row%2==0 and -1 or 1)*spread*0.5; z=(math.abs(col)*0.5-0.25)*spread*((row%2==0) and 1 or -1)
    elseif pat == "Collapsed Octagon" then
        local a=(s%8)*(math.pi/4)+(math.floor(s/8)%2)*(math.pi/8)
        x=math.cos(a)*spread; y=(math.floor(s/8)%3-1)*spread*0.4; z=math.sin(a)*spread*0.55
    elseif pat == "Wobble Crown" then
        local a=(s%7)*(2*math.pi/7); local w=math.sin(a*3.5)*spread*0.25
        x=math.cos(a)*(spread+w); y=math.abs(math.sin(a*3.5))*spread*0.6-spread*0.15; z=math.sin(a)*(spread+w)
    elseif pat == "Anti-Diagonal Stripe" then
        local d=s%6
        x=(d-2.5)*spread*0.35; y=sy*spread*0.45; z=-(d-2.5)*spread*0.35+(s%3-1)*spread*0.5
    elseif pat == "Split Parabola" then
        local hf=s%2==0 and 1 or -1; local u=((s%9)-4)*spread*0.22
        x=u; y=hf*(u*u/spread*0.8+spread*0.1); z=hf*spread*0.6
    elseif pat == "Phase Jitter Ring" then
        local a=(s%12)*(math.pi/6)+math.random()*0.5
        x=math.cos(a)*spread; y=(math.random()-0.5)*spread*0.7; z=math.sin(a)*spread
    elseif pat == "Stochastic Radial" then
        local a=math.random()*2*math.pi; local r=spread*(0.3+math.random()*0.7)
        x=math.cos(a)*r; y=sy*spread*(0.1+math.random()*0.6); z=math.sin(a)*r
    elseif pat == "Recursive Triangle" then
        local depth=math.floor(s/3)%4; local v2=s%3; local sc=spread*(0.25+depth*0.2)
        if v2==0 then x=0; y=sc; z=0
        elseif v2==1 then x=sc*0.87; y=-sc*0.5; z=sc*0.3
        else x=-sc*0.87; y=-sc*0.5; z=sc*0.3 end
    elseif pat == "Sheared Oval" then
        local a=(s%10)*(2*math.pi/10)
        x=math.cos(a)*spread+math.sin(a)*spread*0.5; y=math.sin(a*2)*spread*0.3; z=math.sin(a)*spread*0.65
    elseif pat == "Axial Lurch" then
        local ax=s%3; local mg=spread*(0.5+(s%5)*0.12); local sg=(s%2==0) and 1 or -1
        if ax==0 then x=sg*mg; y=sy*spread*0.2; z=(math.random()-0.5)*spread*0.3
        elseif ax==1 then x=(math.random()-0.5)*spread*0.3; y=sg*mg; z=(math.random()-0.5)*spread*0.3
        else x=(math.random()-0.5)*spread*0.3; y=sy*spread*0.2; z=sg*mg end
    elseif pat == "Compound Rake" then
        local tooth=s%7; local row=math.floor(s/7)%3
        x=(tooth-3)*spread*0.3; y=(row-1)*spread*0.5; z=(tooth%2==0 and 1 or -1)*spread*0.6
    elseif pat == "Tangent Break" then
        local a=t*2.1; local flip=(s%4<2) and 1 or -1
        x=math.cos(a)*spread; y=flip*math.abs(math.sin(a))*spread*0.7; z=math.sin(a)*spread*flip
    elseif pat == "Glitch Burst" then
        local g=s%5
        if g==0 then x=sx*spread; y=sy*spread*0.9; z=sz*spread*0.1
        elseif g==1 then x=sx*spread*0.1; y=sy*spread; z=sz*spread*0.9
        elseif g==2 then x=sx*spread*0.7; y=-sy*spread*0.3; z=sz*spread*0.7
        elseif g==3 then x=-sx*spread*0.4; y=sy*spread*0.6; z=sx*spread*0.8
        else x=sx*spread*0.9; y=sy*spread*0.1; z=-sz*spread end
    else
        x=sx*spread; y=sy*spread; z=sz*spread
    end
    x = x + hr_x; y = y + vr; z = z + hr_z
    return Vector3.new(x, y, z)
end

getgenv().start_voidspam_type = function()
    if vst_conn then vst_conn:Disconnect(); vst_conn = nil end
    vst_phase = "hide"
    vst_phase_start = tick()
    vst_dt_buf = 0
    vst_last_pos = nil
    _movement_save_pos()
    local _vst_srb_last = 0
    local _vst_burst_running = false
    vst_conn = RunService.Heartbeat:Connect(function(dt)
        if not config.void then return end
        pcall(function() workspace.FallenPartsDestroyHeight = -math.huge end)
        local hrp = getgenv().get_hrp(localplayer)
        local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end
        local vtype = config.vst_type or "Defensive"
        if vtype ~= "Bait" and hum:GetState() ~= Enum.HumanoidStateType.Physics then
            pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end)
        end
        local V0 = Vector3.zero
        local function vst_write(cf)
            local mt = getrawmetatable(hrp)
            local ni = mt and rawget(mt, "__newindex")
            if ni then
                pcall(function()
                    ni(hrp, "AssemblyLinearVelocity", V0)
                    ni(hrp, "AssemblyAngularVelocity", V0)
                    ni(hrp, "CFrame", cf)
                end)
            else
                pcall(function()
                    hrp.AssemblyLinearVelocity = V0
                    hrp.AssemblyAngularVelocity = V0
                    hrp.CFrame = cf
                end)
            end
        end

        local function do_defend_burst()
            if config.vst_defend_proximity_escape ~= false then
                local my_pos = hrp.Position
                local threat, threat_d = nil, math.huge
                local thresh = math.max(config.vst_defend_proximity_radius or 50000000, 1000000)
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= localplayer and p.Character then
                        local th = p.Character:FindFirstChild("HumanoidRootPart")
                        local h = p.Character:FindFirstChildOfClass("Humanoid")
                        if th and h and h.Health > 0 and (localplayer.Team == nil or p.Team == nil or localplayer.Team ~= p.Team) then
                            local d = (my_pos - th.Position).Magnitude
                            if d < thresh and d < threat_d then threat_d = d; threat = th end
                        end
                    end
                end
                if threat then
                    local to = my_pos - threat.Position
                    local dir = to.Magnitude > 0.001 and to.Unit or Vector3.new(0,0,-1)
                    local esc = math.max(config.vst_defend_escape_dist or 3000000, 1000000)
                    vst_write(CFrame.new(my_pos + dir * esc))
                    notify("Void", "Evaded")
                    return
                end
            end
            local iters = math.clamp(config.evs_iter_count or 200, 1, 500)
            local mt = getrawmetatable(hrp)
            local ni = mt and rawget(mt, "__newindex")
            local ox, oy, oz = hrp.Position.X, hrp.Position.Y, hrp.Position.Z
            local rx = math.max(config.evs_x_radius or 0, 0)
            local ry = math.max(config.evs_y_radius or 0, 0)
            local rz = math.max(config.evs_z_radius or 0, 0)
            if rx > 0 then ox = ox + (math.random()<0.5 and rx or -rx) end
            if ry > 0 then oy = oy + (math.random()<0.5 and ry or -ry) end
            if rz > 0 then oz = oz + (math.random()<0.5 and rz or -rz) end
            local px, py, pz = ox, oy, oz
            local MIN, MAX = 25000000, 27000000
            for _ = 1, iters do
                local dist = MIN + math.random() * (MAX - MIN)
                local nx = ox + (math.random()<0.5 and dist or -dist)
                local ny = oy + (math.random()<0.5 and dist or -dist)
                local nz = oz + (math.random()<0.5 and dist or -dist)
                if tt_ok3(nx, ny, nz) then
                    px, py, pz = nx, ny, nz
                    if ni then
                        pcall(ni, hrp, "AssemblyLinearVelocity", V0)
                        pcall(ni, hrp, "CFrame", CFrame.new(nx, ny, nz))
                    else
                        pcall(function() hrp.AssemblyLinearVelocity = V0; hrp.CFrame = CFrame.new(nx, ny, nz) end)
                    end
                end
            end
            if ni then
                pcall(ni, hrp, "AssemblyLinearVelocity", V0)
                pcall(ni, hrp, "AssemblyAngularVelocity", V0)
            else
                pcall(function() hrp.AssemblyLinearVelocity = V0; hrp.AssemblyAngularVelocity = V0 end)
            end
        end

        if vtype == "Defensive" then
            if not _vst_burst_running then
                _vst_burst_running = true
                task.spawn(function()
                    if config.vst_auto_kill then
                        getgenv().start_ragebot_bypass_partglue()
                    else
                        do_defend_burst()
                        local fp, tc = manipulation.get_closest()
                        if fp and tc then
                            pcall(manipulation.fire_toward, fp, tc)
                        end
                    end
                    _vst_burst_running = false
                end)
            end
        elseif vtype == "Attack" then
            if not _vst_burst_running then
                _vst_burst_running = true
                task.spawn(function()
                    local target
                    local sel = config.vst_attack_target_name
                    if sel and sel ~= "" and sel ~= "Closest" then
                        local sp = Players:FindFirstChild(sel)
                        if sp and sp ~= localplayer and sp.Character then
                            local sh = sp.Character:FindFirstChildOfClass("Humanoid")
                            if sh and sh.Health > 0 and not sp.Character:FindFirstChildOfClass("ForceField") then
                                target = sp
                            end
                        end
                    end
                    if not target then target = getgenv().get_closest(true) end
                    if target and target.Character then
                        local th = target.Character:FindFirstChild("HumanoidRootPart")
                        local head = target.Character:FindFirstChild("Head")
                        if th then
                            local st = tick()
                            while tick() - st < 0.25 do
                                local dest = tt_resolve_void_pos_deep(th, head)
                                if dest and tt_okv(dest) then
                                    pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end)
                                    kc_nuke_fallen_parts()
                                    for _ = 1, 4 do tt_write(hrp, CFrame.new(dest)) end
                                    local fp = head or th
                                    pcall(manipulation.fire_toward, fp, target.Character)
                                end
                                task.wait(0.016)
                            end
                        end
                    end
                    _vst_burst_running = false
                end)
            end
        elseif vtype == "Kill" then
            if not _vst_burst_running then
                _vst_burst_running = true
                task.spawn(function()
                    local st = tick()
                    local kill_conn
                    local acc = 0
                    kill_conn = RunService.Heartbeat:Connect(function(dt)
                        if tick() - st > 0.25 then kill_conn:Disconnect(); _vst_burst_running = false; return end
                        acc = acc + dt
                        if acc < 1/128 then return end
                        acc = acc % (1/128)
                        local V0 = Vector3.zero
                        local mt = getrawmetatable(hrp)
                        local ni = mt and rawget(mt, "__newindex")
                        local base = hrp.CFrame
                        for _ = 1, 10 do
                            local kd = 1e15 + math.sin(tick()*2*math.pi*2)*1e11
                            local look = base.LookVector
                            local nx = base.X + look.X * kd * (math.random() < 0.5 and 1 or -1)
                            local ny = base.Y + (math.random() < 0.5 and kd or -kd)
                            local nz = base.Z + look.Z * kd * (math.random() < 0.5 and 1 or -1)
                            if tt_ok3(nx, ny, nz) then
                                if ni then
                                    pcall(ni, hrp, "CFrame", CFrame.new(nx, ny, nz))
                                    pcall(ni, hrp, "AssemblyLinearVelocity", V0)
                                else
                                    pcall(function() hrp.CFrame = CFrame.new(nx, ny, nz) end)
                                end
                            end
                        end
                        if ni then
                            pcall(ni, hrp, "CFrame", base)
                            pcall(ni, hrp, "AssemblyLinearVelocity", V0)
                        end
                    end)
                end)
            end
        elseif vtype == "Bait" then
            local cur = hrp.Position
            local bd = math.clamp(config.vst_bait_depth or 20, 1, 40)
            vst_write(CFrame.new(cur.X, cur.Y - bd, cur.Z))
        elseif vtype == "Minimal" then
            local ang = math.random()*2*math.pi
            local rad = 10000 + math.random()*990000
            vst_write(CFrame.new(hrp.Position.X + math.cos(ang)*rad, hrp.Position.Y, hrp.Position.Z + math.sin(ang)*rad))
        end

        local _now = tick()
        if (config.void_sync_ue_ragebot or config.void_sync_kia_ragebot) and _now - _vst_srb_last >= 0.5 then
            _vst_srb_last = _now
            if config.void_sync_ue_ragebot then pcall(getgenv().srb_write, hrp, hrp.CFrame) end
            if config.void_sync_kicia_ragebot then pcall(getgenv().srb_write_ragebot, hrp, hrp.CFrame) end
        end
    end)
end

getgenv().stop_voidspam_type = function(_keep_flag)
    if not _keep_flag then config.void = false end
    if vst_conn then vst_conn:Disconnect(); vst_conn = nil end
    vst_last_pos = nil
    vst_pre_enable_cf = nil
    _vdb_deep_y = nil
    _vdb_ascending = false
    vs_motion_step = 0
    _movement_restore_pos()
end

-- ═══════════════════════════════════════════════════════════
-- ANTI AFK
-- ═══════════════════════════════════════════════════════════
local afk_conn = nil
getgenv().start_anti_afk = function()
    if afk_conn then afk_conn:Disconnect() end
    afk_conn = localplayer.Idled:Connect(function()
        if config.anti_afk_enabled then
            VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end
    end)
end
getgenv().stop_anti_afk = function()
    if afk_conn then afk_conn:Disconnect(); afk_conn = nil end
end

-- ═══════════════════════════════════════════════════════════
-- AUTOCOLLECT
-- ═══════════════════════════════════════════════════════════
local ac_conn = nil
local ac_last_tick = 0
local ac_kw = {"gem","chest","loot","coin","drop","heal","health","medkit","bandage"}
getgenv().start_autocollect = function()
    if ac_conn then ac_conn:Disconnect() end
    local cached = {}
    local cache_last = 0
    ac_conn = RunService.Heartbeat:Connect(function()
        if not config.auto_collect then return end
        local hrp = getgenv().get_hrp(localplayer)
        if not hrp then return end
        local now = tick()
        if now - ac_last_tick < 0.5 then return end
        ac_last_tick = now
        if now - cache_last >= 2 then
            cache_last = now
            cached = {}
            for _, o in ipairs(workspace:GetDescendants()) do
                if o:IsA("BasePart") then
                    local n = string.lower(o.Name)
                    for _, kw in ipairs(ac_kw) do
                        if n:find(kw, 1, true) then
                            cached[#cached+1] = o
                            break
                        end
                    end
                end
            end
        end
        local best, best_d = nil, math.huge
        local my = hrp.Position
        local radius = config.collect_radius or 120
        for _, o in ipairs(cached) do
            if o and o.Parent then
                local ok, p = pcall(function() return o.Position end)
                if ok and p then
                    local d = (my - p).Magnitude
                    if d < radius and d < best_d then best_d = d; best = o end
                end
            end
        end
        if best then
            pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero end)
            hrp.CFrame = CFrame.new(best.Position)
        end
    end)
end
getgenv().stop_autocollect = function()
    if ac_conn then ac_conn:Disconnect(); ac_conn = nil end
    config.auto_collect = false
end

-- ═══════════════════════════════════════════════════════════
-- RETURN HOME
-- ═══════════════════════════════════════════════════════════
local home_conn = nil
getgenv().start_return_home = function()
    if home_conn then home_conn:Disconnect() end
    local last = 0
    home_conn = RunService.Heartbeat:Connect(function()
        if not config.return_home or not getgenv().home_position then return end
        local now = tick()
        if now - last < 0.1 then return end
        last = now
        local hrp = getgenv().get_hrp(localplayer)
        if not hrp then return end
        local hp = getgenv().home_position
        if (hrp.Position - hp).Magnitude < 1 then return end
        local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end) end
        kc_force_cf(hrp, CFrame.new(hp))
    end)
end
getgenv().stop_return_home = function()
    if home_conn then home_conn:Disconnect(); home_conn = nil end
    config.return_home = false
end

-- ═══════════════════════════════════════════════════════════
-- SAFE ZONE
-- ═══════════════════════════════════════════════════════════
local safe_conn = nil
getgenv().start_safe_zone = function()
    if safe_conn then safe_conn:Disconnect() end
    local last = 0
    safe_conn = RunService.Heartbeat:Connect(function()
        if not config.safe_zone_rescue then return end
        local now = tick()
        if now - last < 0.1 then return end
        last = now
        local hrp = getgenv().get_hrp(localplayer)
        if not hrp then return end
        local th = config.depth_threshold or -10
        if hrp.Position.Y < th then
            local safe_y = math.abs(th) + 50
            local rp = RaycastParams.new()
            rp.FilterDescendantsInstances = { localplayer.Character }
            rp.FilterType = Enum.RaycastFilterType.Exclude
            local res = workspace:Raycast(Vector3.new(hrp.Position.X, th, hrp.Position.Z), Vector3.new(0, safe_y+100, 0), rp)
            local ry = (res and res.Position.Y + 3) or safe_y
            kc_force_cf(hrp, CFrame.new(hrp.Position.X, ry, hrp.Position.Z))
        end
    end)
end
getgenv().stop_safe_zone = function()
    if safe_conn then safe_conn:Disconnect(); safe_conn = nil end
    config.safe_zone_rescue = false
end

-- ═══════════════════════════════════════════════════════════
-- TELEPORT LOOP
-- ═══════════════════════════════════════════════════════════
local tl_conn, tl_active = nil, false
getgenv().start_teleport_loop = function()
    if tl_conn then tl_active = false; tl_conn = nil end
    tl_active = true
    tl_conn = task.spawn(function()
        while tl_active and config.teleport_loop_enabled do
            if #getgenv().loop_waypoints > 0 then
                local idx = getgenv().loop_index
                local wp = getgenv().loop_waypoints[idx]
                if wp then
                    local hrp = getgenv().get_hrp(localplayer)
                    if hrp then kc_force_cf(hrp, CFrame.new(wp)) end
                    getgenv().loop_index = (idx % #getgenv().loop_waypoints) + 1
                end
            end
            task.wait(math.max(config.loop_delay or 0.5, 0.05))
        end
    end)
end
getgenv().stop_teleport_loop = function()
    tl_active = false
    tl_conn = nil
    config.teleport_loop_enabled = false
end

-- ═══════════════════════════════════════════════════════════
-- TRANSLOCATION (safe wrapper)
-- ═══════════════════════════════════════════════════════════
local transloc_conn = nil
local transloc_active = false
local function transloc_ring(anchor, minR, maxR)
    local a = math.random() * 2 * math.pi
    local r = minR + math.random() * (maxR - minR)
    return CFrame.new(anchor + Vector3.new(math.cos(a)*r, 0, math.sin(a)*r))
        * CFrame.fromOrientation(math.random()*2*math.pi, math.random()*2*math.pi, math.random()*2*math.pi)
end
local function translocateEvade(cf, has)
    if not has then return transloc_ring(cf.Position, 10000, 1000000000) end
    local cs = game:GetService("CollectionService")
    local chosen
    local ok = pcall(function()
        for _, part in ipairs(cs:GetTagged("OutOfBoundsPart")) do
            if part:GetAttribute("KillDelay") == 0 then chosen = part; break end
        end
    end)
    if ok and chosen then
        return chosen.CFrame * CFrame.new(0, -chosen.Size.Y/2 - 5, 0)
    end
    return transloc_ring(cf.Position, 10000, 1000000000)
end
getgenv().start_translocation = function()
    if transloc_active then return end
    transloc_active = true
    config.translocation = true
    if transloc_conn then transloc_conn:Disconnect() end
    local last = 0
    local srb_last = 0
    transloc_conn = RunService.Heartbeat:Connect(function()
        if not config.translocation then return end
        local now = tick()
        if now - last < 0.1 then return end
        last = now
        local hrp = getgenv().get_hrp(localplayer)
        if not hrp then return end
        local has = false
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= localplayer and p.Character then
                local th = p.Character:FindFirstChild("HumanoidRootPart")
                local h = p.Character:FindFirstChildOfClass("Humanoid")
                if th and h and h.Health > 0 and not p.Character:FindFirstChildOfClass("ForceField")
                   and (localplayer.Team == nil or p.Team == nil or localplayer.Team ~= p.Team) then
                    has = true; break
                end
            end
        end
        local dest
        pcall(function() dest = translocateEvade(hrp.CFrame, has) end)
        if not dest then return end
        kc_force_cf(hrp, CFrame.new(dest.Position))
        if (config.transloc_sync_ue_ragebot or config.transloc_sync_ragebot) and now - srb_last >= 0.5 then
            srb_last = now
            if config.transloc_sync_ue_ragebot then pcall(getgenv().srb_write, hrp, CFrame.new(dest.Position)) end
            if config.transloc_sync_ragebot then pcall(getgenv().srb_write_ragebot, hrp, CFrame.new(dest.Position)) end
        end
    end)
end
getgenv().stop_translocation = function()
    transloc_active = false
    config.translocation = false
    if transloc_conn then transloc_conn:Disconnect(); transloc_conn = nil end
end

-- ═══════════════════════════════════════════════════════════
-- PERFECT ACCURACY
-- ═══════════════════════════════════════════════════════════
local pa_active = false
getgenv().start_perfect_accuracy = function()
    if pa_active then return end
    pa_active = true
    config.perfect_accuracy_enabled = true
    pcall(function()
        local ok, lib = pcall(require, ReplicatedStorage.Modules.ItemLibrary)
        if not ok or not lib then return end
        local function set(tbl)
            for _, v in pairs(tbl) do
                if typeof(v) == "table" then
                    if v.ShootSpread then v.ShootSpread = 0 end
                    if v.ShootAccuracy then v.ShootAccuracy = 0 end
                    if v.ShootRecoil then v.ShootRecoil = 0 end
                    set(v)
                end
            end
        end
        set(lib)
    end)
end
getgenv().stop_perfect_accuracy = function()
    pa_active = false
    config.perfect_accuracy_enabled = false
end

-- ═══════════════════════════════════════════════════════════
-- KNIFE BYPASS
-- ═══════════════════════════════════════════════════════════
local kb_thread, kb_active = nil, false
local KB_FIELDS = ABILITY_FIELDS
local function kb_patch()
    local ok, lib = pcall(function()
        return require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("ItemLibrary"))
    end)
    if not ok or not lib then return end
    local items = lib.Items or lib.Weapons or lib.Utilities
    if type(items) ~= "table" then return end
    for _, item in pairs(items) do
        if type(item) == "table" then
            for _, f in ipairs(KB_FIELDS) do if item[f] ~= nil then item[f] = 0 end end
        end
    end
end
getgenv().start_knife_bypass = function()
    if kb_active then return end
    kb_active = true
    config.knife_bypass_enabled = true
    kb_thread = task.spawn(function()
        while config.knife_bypass_enabled do pcall(kb_patch); task.wait(2) end
        kb_thread = nil
    end)
end
getgenv().stop_knife_bypass = function()
    config.knife_bypass_enabled = false
    kb_active = false
    kb_thread = nil
end

-- ═══════════════════════════════════════════════════════════
-- RIOT ABUSER
-- ═══════════════════════════════════════════════════════════
local ra_active, ra_conn = false, nil
local ra_rotFn, ra_camTable, ra_orig, ra_angle = nil, nil, nil, 0
local function ra_nz(a) return (a + math.pi) % (2*math.pi) - math.pi end
local function ra_nearest()
    local my = getgenv().get_hrp(localplayer)
    if not my then return end
    local best, best_d = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= localplayer and p.Character then
            local th = p.Character:FindFirstChild("HumanoidRootPart")
            local h = p.Character:FindFirstChildOfClass("Humanoid")
            if th and h and h.Health > 0 then
                local d = (my.Position - th.Position).Magnitude
                if d < best_d then best_d = d; best = p end
            end
        end
    end
    return best
end
local function ra_apply()
    if not config.riot_abuser_enabled or not ra_camTable then return end
    local tgt = ra_nearest()
    if not tgt or not tgt.Character then return end
    local th = tgt.Character:FindFirstChild("HumanoidRootPart")
    local my = getgenv().get_hrp(localplayer)
    if not th or not my then return end
    local spin = math.rad(config.riot_abuser_spin_speed or 720)
    ra_angle = ra_nz(ra_angle + spin * (1/60))
    local pitch = math.rad(config.riot_abuser_pitch or 0)
    ra_camTable.Rotation = Vector2.new(-pitch, ra_angle)
    local radius = config.riot_abuser_iterate_radius or 50
    local ox = math.cos(ra_angle) * radius
    local oz = math.sin(ra_angle) * radius
    pcall(function()
        my.CFrame = CFrame.new(my.Position + Vector3.new(ox, 0, oz)) * CFrame.Angles(pitch, ra_angle, 0)
        my.AssemblyAngularVelocity = Vector3.zero
        my.AssemblyLinearVelocity = Vector3.zero
    end)
end
getgenv().start_riot_abuser = function()
    if ra_active then return end
    ra_active = true
    config.riot_abuser_enabled = true
    ra_angle = 0
    pcall(function()
        ra_rotFn = filtergc("function", {Name = "_UpdateCharacterRotation"}, true)
        if not ra_rotFn then return end
        for _, v in ipairs(debug.getupvalues(ra_rotFn)) do
            if type(v) == "table" and typeof(v.Rotation) == "Vector2" then
                ra_camTable = v; break
            end
        end
        if not ra_camTable then return end
        pcall(function()
            RunService:BindToRenderStep("__ra_mrot", Enum.RenderPriority.Character.Value - 1, ra_apply)
        end)
        if ra_orig then pcall(function() hookfunction(ra_rotFn, ra_orig) end) end
        ra_orig = hookfunction(ra_rotFn, function(...)
            ra_apply()
            return ra_orig(...)
        end)
    end)
end
getgenv().stop_riot_abuser = function()
    ra_active = false
    config.riot_abuser_enabled = false
    pcall(function() RunService:UnbindFromRenderStep("__ra_mrot") end)
    if ra_orig and ra_rotFn then pcall(function() hookfunction(ra_rotFn, ra_orig) end) end
    ra_rotFn, ra_camTable, ra_orig, ra_angle = nil, nil, nil, 0
end

-- ═══════════════════════════════════════════════════════════
-- RIOT BYPASS
-- ═══════════════════════════════════════════════════════════
local rb_conn, rb_active = nil, false
local rb_target, rb_last = nil, 0
getgenv().start_riot_bypass = function()
    if rb_active then return end
    rb_active = true
    config.riot_bypass_enabled = true
    rb_target = nil
    rb_last = 0
    rb_conn = RunService.Heartbeat:Connect(function()
        if not config.riot_bypass_enabled then return end
        local my = getgenv().get_hrp(localplayer)
        if not my then return end
        local now = tick()
        if now - rb_last >= (config.riot_bypass_update_rate or 0.5) then
            rb_last = now
            rb_target = getgenv().get_closest(false)
        end
        if not rb_target or not rb_target.Character then return end
        local th = rb_target.Character:FindFirstChild("HumanoidRootPart")
        if not th then return end
        local behind = th.Position - th.CFrame.LookVector * (config.riot_bypass_distance or 10) + Vector3.new(0, config.riot_bypass_height or 0, 0)
        local tw = TweenService:Create(my, TweenInfo.new(config.riot_bypass_update_rate or 0.5, Enum.EasingStyle.Linear), { CFrame = CFrame.new(behind) })
        tw:Play()
    end)
end
getgenv().stop_riot_bypass = function()
    rb_active = false
    config.riot_bypass_enabled = false
    if rb_conn then rb_conn:Disconnect(); rb_conn = nil end
    rb_target = nil
end

-- ═══════════════════════════════════════════════════════════
-- SMART RIOT
-- ═══════════════════════════════════════════════════════════
local sr_active, sr_conn = false, nil
local sr_origin = nil
getgenv().start_smart_riot = function()
    if sr_active then return end
    sr_active = true
    config.smart_riot_enabled = true
    local hrp = getgenv().get_hrp(localplayer)
    if hrp then sr_origin = hrp.CFrame end
    local flip = false
    local last = 0
    sr_conn = RunService.Heartbeat:Connect(function()
        if not config.smart_riot_enabled then return end
        local now = tick()
        if now - last < 0.016 then return end
        last = now
        local h = getgenv().get_hrp(localplayer)
        if not h then return end
        if not sr_origin then sr_origin = h.CFrame end
        flip = not flip
        local cf = flip and CFrame.new(sr_origin.X, -5e25, sr_origin.Z) or sr_origin
        kc_force_cf(h, cf)
    end)
end
getgenv().stop_smart_riot = function()
    sr_active = false
    config.smart_riot_enabled = false
    if sr_conn then sr_conn:Disconnect(); sr_conn = nil end
    sr_origin = nil
end

-- ═══════════════════════════════════════════════════════════
-- UNDERGROUND
-- ═══════════════════════════════════════════════════════════
local ug_conn, ug_active = nil, false
local ug_lockY, ug_lastPos = nil, nil
getgenv().start_underground = function()
    if ug_active then return end
    ug_active = true
    config.underground_enabled = true
    ug_lockY, ug_lastPos = nil, nil
    ug_conn = RunService.Heartbeat:Connect(function()
        if not config.underground_enabled then return end
        local char = localplayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
            local root = char.HumanoidRootPart
            local hum = char.Humanoid
            local cur = root.Position
            if not ug_lockY then ug_lockY = cur.Y - 7 end
            local md = hum.MoveDirection
            if md.Magnitude > 0 then
                ug_lastPos = root.Position + md * hum.WalkSpeed * 0.016
                root.CFrame = CFrame.new(ug_lastPos.X, ug_lockY, ug_lastPos.Z) * (root.CFrame - cur)
            else
                if not ug_lastPos then ug_lastPos = cur end
                root.CFrame = CFrame.new(ug_lastPos.X, ug_lockY, ug_lastPos.Z) * (root.CFrame - cur)
            end
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        else
            ug_lockY, ug_lastPos = nil, nil
        end
    end)
end
getgenv().stop_underground = function()
    ug_active = false
    config.underground_enabled = false
    ug_lockY, ug_lastPos = nil, nil
    if ug_conn then ug_conn:Disconnect(); ug_conn = nil end
end

-- ═══════════════════════════════════════════════════════════
-- PERFECT BLOCK
-- ═══════════════════════════════════════════════════════════
local pb_conn, pb_active = nil, false
local pb_rotFn, pb_camTable, pb_orig = nil, nil, nil
local function pb_nearest()
    local my = getgenv().get_hrp(localplayer)
    if not my then return end
    local best, best_d = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= localplayer and p.Character then
            local th = p.Character:FindFirstChild("HumanoidRootPart")
            local h = p.Character:FindFirstChildOfClass("Humanoid")
            if th and h and h.Health > 0 then
                local d = (my.Position - th.Position).Magnitude
                if d < best_d then best_d = d; best = p end
            end
        end
    end
    return best
end
local function pb_apply()
    if not config.perfect_block_enabled or not pb_camTable then return end
    local tgt = pb_nearest()
    if not tgt or not tgt.Character then return end
    local th = tgt.Character:FindFirstChild("HumanoidRootPart")
    local head = tgt.Character:FindFirstChild("Head")
    local my = getgenv().get_hrp(localplayer)
    if not th or not my then return end
    local eLook = th.CFrame.LookVector
    local yaw = math.atan2(eLook.X, eLook.Z)
    local myYaw = (yaw + math.pi + math.pi) % (2*math.pi) - math.pi
    local pitch = 0
    if head then pitch = math.asin(math.clamp(head.CFrame.LookVector.Y, -1, 1)) end
    pb_camTable.Rotation = Vector2.new(-pitch, myYaw)
    local counter = Vector3.new(-eLook.X, 0, -eLook.Z)
    if counter.Magnitude > 0.001 then
        pcall(function()
            my.CFrame = CFrame.lookAt(my.Position, my.Position + counter.Unit)
            my.AssemblyAngularVelocity = Vector3.zero
        end)
    end
end
getgenv().start_perfect_block = function()
    if pb_active then return end
    pb_active = true
    config.perfect_block_enabled = true
    pcall(function()
        pb_rotFn = filtergc("function", {Name = "_UpdateCharacterRotation"}, true)
        if not pb_rotFn then return end
        for _, v in ipairs(debug.getupvalues(pb_rotFn)) do
            if type(v) == "table" and typeof(v.Rotation) == "Vector2" then pb_camTable = v; break end
        end
        if not pb_camTable then return end
        pcall(function()
            RunService:BindToRenderStep("__pb_mrot", Enum.RenderPriority.Character.Value - 1, pb_apply)
        end)
        if pb_orig then pcall(function() hookfunction(pb_rotFn, pb_orig) end) end
        pb_orig = hookfunction(pb_rotFn, function(...)
            pb_apply()
            return pb_orig(...)
        end)
    end)
end
getgenv().stop_perfect_block = function()
    pb_active = false
    config.perfect_block_enabled = false
    pcall(function() RunService:UnbindFromRenderStep("__pb_mrot") end)
    if pb_orig and pb_rotFn then pcall(function() hookfunction(pb_rotFn, pb_orig) end) end
    pb_rotFn, pb_camTable, pb_orig = nil, nil, nil
end

-- ═══════════════════════════════════════════════════════════
-- EVASION (uses server-side RootDesync)
-- ═══════════════════════════════════════════════════════════
local _evasion_Config = {
    RandomBaseRadius = 100,
    RandomRadiusFactor = 0.5,
    RandomAnchorFromChar = false,
    DefensiveStance = true,
    ForceCrouch = true,
}
getgenv()._evasion_Config = _evasion_Config

local _evasion_rb = Random.new()
local _evasion_FAR = 1073741824

local _evasion_RootDesync = {}
_evasion_RootDesync.__index = _evasion_RootDesync
function _evasion_RootDesync.new(root)
    local self = setmetatable({
        _rootPart = root,
        _boundId = HttpService:GenerateGUID(false),
        _oldCFrame = root.CFrame,
        _cframe = nil,
    }, _evasion_RootDesync)
    RunService:BindToRenderStep(self._boundId, Enum.RenderPriority.First.Value, function()
        local old = self._oldCFrame
        if old ~= nil then self._rootPart.CFrame = old; self._oldCFrame = nil end
    end)
    return self
end
function _evasion_RootDesync:SetServerCFrame(cf) self._cframe = cf end
function _evasion_RootDesync:GetClientCFrame() return self._oldCFrame or self._rootPart.CFrame end
function _evasion_RootDesync:HeartbeatUpdate()
    local cf = self._cframe
    if cf ~= nil then self._oldCFrame = self._rootPart.CFrame; self._rootPart.CFrame = cf end
end
function _evasion_RootDesync:Destroy()
    pcall(function() RunService:UnbindFromRenderStep(self._boundId) end)
end

local _evasion_Controller = {}
_evasion_Controller.__index = _evasion_Controller
local _evasion_inst = nil
function _evasion_Controller.new()
    return setmetatable({
        _enabled = false,
        _rootDesync = nil,
        _bound = nil,
    }, _evasion_Controller)
end
function _evasion_Controller:_Ensure()
    local char = localplayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then
        if self._rootDesync then self._rootDesync:Destroy(); self._rootDesync = nil; self._bound = nil end
        return nil
    end
    if not self._rootDesync or self._bound ~= root then
        if self._rootDesync then self._rootDesync:Destroy() end
        self._rootDesync = _evasion_RootDesync.new(root)
        self._bound = root
    end
    return self._rootDesync
end
function _evasion_Controller:_EvadeCFrame(cf)
    local anchor = _evasion_Config.RandomAnchorFromChar and cf.Position or Vector3.new(0, cf.Position.Y, 0)
    local a = _evasion_rb:NextNumber(0, 2 * math.pi)
    local r = _evasion_rb:NextNumber(_evasion_Config.RandomBaseRadius, _evasion_Config.RandomBaseRadius * (1 + _evasion_Config.RandomRadiusFactor))
    local ring = CFrame.new(anchor + Vector3.new(math.cos(a)*r, 0, math.sin(a)*r))
        * CFrame.fromOrientation(_evasion_rb:NextNumber(0,2*math.pi), _evasion_rb:NextNumber(0,2*math.pi), _evasion_rb:NextNumber(0,2*math.pi))
    local x, y, z = ring.Position.X, ring.Position.Y, ring.Position.Z
    local pick = _evasion_rb:NextInteger(1, 3)
    if pick == 1 then x = _evasion_FAR
    elseif pick == 2 then y = _evasion_FAR
    else z = _evasion_FAR end
    return ring - ring.Position + Vector3.new(x, y, z)
end
function _evasion_Controller:Update()
    if not self._enabled then return end
    local rd = self:_Ensure()
    if not rd then return end
    local client = rd:GetClientCFrame()
    if client == nil then return end
    rd:SetServerCFrame(self:_EvadeCFrame(client))
    rd:HeartbeatUpdate()
end
function _evasion_Controller:SetEnabled(v)
    if self._enabled == v then return end
    self._enabled = v
    if not v and self._rootDesync then
        self._rootDesync:SetServerCFrame(nil)
        self._rootDesync:HeartbeatUpdate()
    end
end

local _evasion_hb = nil
getgenv().start_evasion = function()
    if not _evasion_inst then _evasion_inst = _evasion_Controller.new() end
    _evasion_inst:SetEnabled(true)
    config.evasion_enabled = true
    if _evasion_hb then _evasion_hb:Disconnect() end
    local last = 0
    _evasion_hb = RunService.Heartbeat:Connect(function()
        if not config.evasion_enabled then return end
        local now = tick()
        if now - last < 0.016 then return end
        last = now
        pcall(function() _evasion_inst:Update() end)
    end)
end
getgenv().stop_evasion = function()
    config.evasion_enabled = false
    if _evasion_hb then _evasion_hb:Disconnect(); _evasion_hb = nil end
    if _evasion_inst then _evasion_inst:SetEnabled(false) end
end

-- ═══════════════════════════════════════════════════════════
-- XYZ OVERLAY
-- ═══════════════════════════════════════════════════════════
local _xyzSg, _xyzConn, _xyzVals
getgenv().buildXYZOverlay = function()
    if _xyzSg and _xyzSg.Parent then return end
    local sg = Instance.new("ScreenGui")
    sg.Name = "MeowwXYZOverlay"; sg.ResetOnSpawn = false; sg.DisplayOrder = 9999
    local ok = pcall(function() sg.Parent = game:GetService("CoreGui") end)
    if not ok then sg.Parent = localplayer:WaitForChild("PlayerGui") end
    _xyzSg = sg
    local panel = Instance.new("Frame")
    panel.Size = UDim2.new(0, 170, 0, 96); panel.Position = UDim2.new(0, 14, 0.5, -48)
    panel.BackgroundColor3 = Color3.fromRGB(18,18,20); panel.BackgroundTransparency = 0.08
    panel.BorderSizePixel = 0; panel.Parent = sg
    local pc = Instance.new("UICorner"); pc.CornerRadius = UDim.new(0,7); pc.Parent = panel
    _xyzVals = {}
    for i, axis in ipairs({"X","Y","Z"}) do
        local y = 8 + (i-1)*26
        local al = Instance.new("TextLabel")
        al.Size = UDim2.new(0,18,0,18); al.Position = UDim2.new(0,10,0,y)
        al.BackgroundTransparency = 1; al.Text = axis
        al.TextColor3 = Color3.fromRGB(120,120,130); al.Font = Enum.Font.GothamBold
        al.TextSize = 12; al.TextXAlignment = Enum.TextXAlignment.Left; al.Parent = panel
        local vl = Instance.new("TextLabel")
        vl.Size = UDim2.new(1,-30,0,18); vl.Position = UDim2.new(0,14,0,y)
        vl.BackgroundTransparency = 1; vl.Text = "0"
        vl.TextColor3 = Color3.fromRGB(230,230,235); vl.Font = Enum.Font.Gotham
        vl.TextSize = 12; vl.TextXAlignment = Enum.TextXAlignment.Right; vl.Parent = panel
        _xyzVals[axis] = vl
    end
    _xyzConn = RunService.Heartbeat:Connect(function()
        local h = getgenv().get_hrp(localplayer)
        if h then
            local p = h.Position
            _xyzVals.X.Text = string.format("%.0f", p.X)
            _xyzVals.Y.Text = string.format("%.0f", p.Y)
            _xyzVals.Z.Text = string.format("%.0f", p.Z)
        end
    end)
end
getgenv().destroyXYZOverlay = function()
    if _xyzConn then pcall(function() _xyzConn:Disconnect() end); _xyzConn = nil end
    if _xyzSg then pcall(function() _xyzSg:Destroy() end); _xyzSg = nil end
end
getgenv().maybe_destroy_xyz = function()
    if not config.void and not config.orbit and not config.ragebot_bypass_enabled then
        getgenv().destroyXYZOverlay()
    end
end

-- ═══════════════════════════════════════════════════════════
-- OBSIDIAN UI
-- ═══════════════════════════════════════════════════════════
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local Window = Library:CreateWindow({
    Title = "meowwCL Premium",
    Center = true, AutoShow = true, Resizable = true, MobileButtonsSide = "Right",
})

local MainTab      = Window:AddTab("Main")
local CombatTab    = Window:AddTab("Combat")
local MovementTab  = Window:AddTab("Movement")
local UtilitiesTab = Window:AddTab("Utilities")
local SettingsTab  = Window:AddTab("Settings")

-- ============= MAIN =============
local MoveBox = MainTab:AddLeftGroupbox("Movement")
MoveBox:AddToggle("FlyMode", { Text="Fly", Default=false, Callback=function(v)
    config.fly_enabled = v
    if v then getgenv().start_fly() else getgenv().stop_fly() end
end })
MoveBox:AddSlider("FlySpeed", { Text="Fly Speed", Default=60, Min=1, Max=2000, Rounding=0,
    Callback=function(v) config.fly_speed = v end })
MoveBox:AddToggle("FlyNoclip", { Text="Fly Noclip", Default=false,
    Callback=function(v) config.fly_noclip = v end })
MoveBox:AddToggle("FlyGrav", { Text="Cancel Gravity", Default=true,
    Callback=function(v) config.fly_gravity_cancel = v end })

local CombatMain = MainTab:AddRightGroupbox("Combat")
CombatMain:AddToggle("RapidFire", { Text="Rapid Fire", Default=false, Callback=function(v)
    config.rapid_fire = v
    if v then getgenv().start_rapid_fire() else getgenv().stop_rapid_fire() end
end })
CombatMain:AddToggle("FastReload", { Text="Fast Reload", Default=false, Callback=function(v)
    config.ability_cooldown_enabled = v
    if v then getgenv().start_ability_cooldown() else getgenv().stop_ability_cooldown() end
end })
CombatMain:AddToggle("KnifeBypass", { Text="Knife Bypass", Default=false, Callback=function(v)
    config.knife_bypass_enabled = v
    if v then getgenv().start_knife_bypass() else getgenv().stop_knife_bypass() end
end })
CombatMain:AddToggle("Autoshoot", { Text="Autoshoot", Default=false, Callback=function(v)
    config.autoshoot_enabled = v
    if v then getgenv().start_autoshoot() else getgenv().stop_autoshoot() end
end })
CombatMain:AddToggle("BulletRedir", { Text="Bullet Redirect", Default=false, Callback=function(v)
    config.bullet_redirect_enabled = v
    if v then getgenv().start_bullet_redirect() else getgenv().stop_bullet_redirect() end
end })
CombatMain:AddToggle("GunBypass", { Text="Gun Bypass", Default=false, Callback=function(v)
    config.gun_bypass_enabled = v
    if v then getgenv().start_gun_bypass() else getgenv().stop_gun_bypass() end
end })
CombatMain:AddToggle("PerfectAcc", { Text="Perfect Accuracy", Default=false, Callback=function(v)
    config.perfect_accuracy_enabled = v
    if v then getgenv().start_perfect_accuracy() else getgenv().stop_perfect_accuracy() end
end })

-- ============= COMBAT =============
local AntiAimBox = CombatTab:AddLeftGroupbox("Anti-Aim")
AntiAimBox:AddToggle("AntiAim", { Text="Anti Aim", Default=false, Callback=function(v)
    config.anti_aim = v
    if v then getgenv().start_body_manip() else getgenv().stop_body_manip() end
end })
AntiAimBox:AddDropdown("AA_Mode", { Text="Mode", Default="Spin",
    Values={"Spin","Static","Jitter","Desync","Flat","Backward","Freestanding","LowerBody","PitchDown","PitchUp","SpinPitch","Random"},
    Callback=function(v) config.anti_aim_mode = v end })
AntiAimBox:AddSlider("AA_Spin", { Text="Spin Speed", Default=720, Min=1, Max=99999, Rounding=0,
    Callback=function(v) config.anti_aim_spin_speed = v end })
AntiAimBox:AddSlider("AA_Pitch", { Text="Pitch Angle", Default=89, Min=-89, Max=89, Rounding=0,
    Callback=function(v) config.anti_aim_pitch_deg = v end })
AntiAimBox:AddSlider("AA_Jit", { Text="Jitter Range", Default=0, Min=0, Max=89, Rounding=0,
    Callback=function(v) config.anti_aim_jitter_deg = v end })

local OrbitBox = CombatTab:AddLeftGroupbox("Orbit")
OrbitBox:AddToggle("OrbitMode", { Text="Orbit", Default=false, Callback=function(v)
    config.orbit = v
    if v then getgenv().start_orbit(); getgenv().buildXYZOverlay()
    else getgenv().stop_orbit(); getgenv().maybe_destroy_xyz() end
end })
OrbitBox:AddSlider("OrbSpeed",  { Text="Orbit Speed", Default=5, Min=1, Max=200, Rounding=0,
    Callback=function(v) config.orbit_speed = v end })
OrbitBox:AddSlider("OrbRad",    { Text="Orbit Radius", Default=50000, Min=1, Max=500000, Rounding=0,
    Callback=function(v) config.orbit_radius = v end })
OrbitBox:AddSlider("OrbIters",  { Text="Iterations", Default=50, Min=1, Max=100, Rounding=0,
    Callback=function(v) config.orbit_iters = v end })
OrbitBox:AddSlider("OrbHgt",    { Text="Height Offset", Default=0, Min=-500000, Max=500000, Rounding=0,
    Callback=function(v) config.orbit_height = v end })
OrbitBox:AddSlider("OrbJit",    { Text="Jitter", Default=0, Min=0, Max=100000, Rounding=0,
    Callback=function(v) config.orbit_jitter = v end })
OrbitBox:AddDropdown("OrbPattern", { Text="Pattern", Default="Circle",
    Values={"Circle","Ellipse","Figure8","Helix","Wave","Spiral","Pulse"},
    Callback=function(v) config.orbit_pattern = v end })
OrbitBox:AddDropdown("OrbTarget", { Text="Target", Default="Closest", Values={"Self","Closest"},
    Callback=function(v) config.orbit_target = v end })
OrbitBox:AddDropdown("OrbAxis", { Text="Axis", Default="Y", Values={"Y","X","Z"},
    Callback=function(v) config.orbit_axis = v end })
OrbitBox:AddDropdown("OrbDir", { Text="Direction", Default="Clockwise",
    Values={"Clockwise","Counter-clockwise"}, Callback=function(v) config.orbit_direction = v end })
OrbitBox:AddDropdown("OrbWarp", { Text="Warp Mode", Default="Instant",
    Values={"Instant","Lerp","Spring","Bounce","Elastic"}, Callback=function(v) config.orbit_warp_mode = v end })

local AntiHitBox = CombatTab:AddRightGroupbox("Slingshot")
AntiHitBox:AddToggle("SlingBypass", { Text="Slingshot Bypass", Default=false, Callback=function(v)
    if v then getgenv().start_slingshot_bypass() else getgenv().stop_slingshot_bypass() end
end })
AntiHitBox:AddToggle("SlingOrbit", { Text="Slingshot Orbit", Default=false, Callback=function(v)
    if v then getgenv().start_slingshot_orbit() else getgenv().stop_slingshot_orbit() end
end })

local RiotBox = CombatTab:AddRightGroupbox("Riot")
RiotBox:AddToggle("RiotAbuser", { Text="Riot Abuser", Default=false, Callback=function(v)
    config.riot_abuser_enabled = v
    if v then getgenv().start_riot_abuser() else getgenv().stop_riot_abuser() end
end })
RiotBox:AddSlider("RA_Spin", { Text="Spin Speed", Default=720, Min=1, Max=99999, Rounding=0,
    Callback=function(v) config.riot_abuser_spin_speed = v end })
RiotBox:AddSlider("RA_Radius", { Text="Iterate Radius", Default=50, Min=1, Max=2000, Rounding=0,
    Callback=function(v) config.riot_abuser_iterate_radius = v end })
RiotBox:AddSlider("RA_Pitch", { Text="Pitch Angle", Default=0, Min=-89, Max=89, Rounding=0,
    Callback=function(v) config.riot_abuser_pitch = v end })

RiotBox:AddToggle("RiotBypass", { Text="Riot Bypass", Default=false, Callback=function(v)
    config.riot_bypass_enabled = v
    if v then getgenv().start_riot_bypass() else getgenv().stop_riot_bypass() end
end })
RiotBox:AddSlider("RB_Dist", { Text="Distance Behind", Default=10, Min=0, Max=50, Rounding=1,
    Callback=function(v) config.riot_bypass_distance = v end })
RiotBox:AddSlider("RB_Hgt", { Text="Height Offset", Default=0, Min=-20, Max=20, Rounding=1,
    Callback=function(v) config.riot_bypass_height = v end })
RiotBox:AddSlider("RB_Rate", { Text="Update Rate (×0.1s)", Default=5, Min=1, Max=100, Rounding=1,
    Callback=function(v) config.riot_bypass_update_rate = v / 10 end })

local MeleeBox = CombatTab:AddRightGroupbox("Melee")
MeleeBox:AddToggle("MeleeBypass", { Text="Melee Bypass", Default=false, Callback=function(v)
    config.kicia_counter_enabled = v
    if v then getgenv().start_kicia_counter() else getgenv().stop_kicia_counter() end
end })
MeleeBox:AddDropdown("MeleeMethod", { Text="Method", Default="Method 2",
    Values={"Method 1","Method 2","Method 3"}, Callback=function(v)
        if v == "Method 1" then config.kicia_counter_method = 1
        elseif v == "Method 2" then config.kicia_counter_method = 2
        else config.kicia_counter_method = 3 end
        if config.kicia_counter_enabled then
            getgenv().stop_kicia_counter(); getgenv().start_kicia_counter()
        end
    end })
MeleeBox:AddSlider("MeleeSpeed", { Text="Speed", Default=1, Min=1, Max=9999999999999, Rounding=0,
    Callback=function(v) config.kicia_counter_speed = v end })

local RageBypassBox = CombatTab:AddLeftGroupbox("Ragebot Bypass")
RageBypassBox:AddToggle("RageBypass", { Text="Ragebot Bypass", Default=false, Callback=function(v)
    config.ragebot_bypass_enabled = v
    if v then getgenv().start_ragebot_bypass_partglue(); getgenv().buildXYZOverlay()
    else getgenv().stop_ragebot_bypass_partglue(); getgenv().maybe_destroy_xyz() end
end })
RageBypassBox:AddSlider("RageFreq", { Text="Frequency (Hz)", Default=60, Min=1, Max=256, Rounding=0,
    Callback=function(v) config.ragebot_bypass_frequency = v end })

-- ============= MOVEMENT =============
local VoidBox = MovementTab:AddLeftGroupbox("Void")
VoidBox:AddToggle("VoidEnable", { Text="Void", Default=false, Callback=function(v)
    config.void = v
    if v then getgenv().start_voidspam_type(); getgenv().buildXYZOverlay()
    else getgenv().stop_voidspam_type(); getgenv().maybe_destroy_xyz() end
end })
VoidBox:AddDropdown("VoidMode", { Text="Mode", Default="Defensive",
    Values={"Defensive","Attack","Kill","Minimal","Bait"},
    Callback=function(v) config.vst_type = v end })
VoidBox:AddSlider("VoidIters", { Text="Iteration Count", Default=200, Min=1, Max=500, Rounding=0,
    Callback=function(v) config.evs_iter_count = v end })
VoidBox:AddSlider("VoidSpeed", { Text="Iteration Speed", Default=1, Min=1, Max=5000000, Rounding=0,
    Callback=function(v) config.evs_iter_speed = v end })
VoidBox:AddSlider("VoidXRad", { Text="X Radius", Default=0, Min=0, Max=1000000000, Rounding=0,
    Callback=function(v) config.evs_x_radius = v end })
VoidBox:AddSlider("VoidYRad", { Text="Y Radius", Default=0, Min=0, Max=1000000000, Rounding=0,
    Callback=function(v) config.evs_y_radius = v end })
VoidBox:AddSlider("VoidZRad", { Text="Z Radius", Default=0, Min=0, Max=1000000000, Rounding=0,
    Callback=function(v) config.evs_z_radius = v end })
VoidBox:AddToggle("VoidSyncUE", { Text="Sync To UE Ragebot", Default=false,
    Callback=function(v) config.void_sync_ue_ragebot = v end })
VoidBox:AddToggle("VoidSyncKicia", { Text="Sync To Kicia Ragebot", Default=false,
    Callback=function(v) config.void_sync_kicia_ragebot = v end })

local MotionBox = MovementTab:AddRightGroupbox("Motion")
MotionBox:AddSlider("MotionSpread", { Text="Spread Distance", Default=50000, Min=1, Max=1000000000, Rounding=0,
    Callback=function(v) config.spread_distance = v end })
MotionBox:AddSlider("MotionHjit", { Text="Horizontal Jitter", Default=0, Min=0, Max=1000000, Rounding=0,
    Callback=function(v) config.horizontal_jitter = v end })
MotionBox:AddSlider("MotionVjit", { Text="Vertical Jitter", Default=0, Min=0, Max=1000000, Rounding=0,
    Callback=function(v) config.vertical_jitter = v end })
MotionBox:AddDropdown("MotionPattern", { Text="Pattern", Default="Broken Spiral",
    Values={"Staggered Cross","Offset Pentagon","Asymmetric Wedge","Broken Spiral","Shear Grid",
            "Offset Bowtie","Oblique Zigzag","Fractured Diamond","Phase-Shifted Lemniscate",
            "Alternating Trident","Skewed Hexagon","Bifurcated Sine","Chaotic Lattice",
            "Sawtooth Orbit","Rotary Offset Star","Compressed Torus","Displaced Trefoil",
            "Inverted Chevron","Collapsed Octagon","Wobble Crown","Anti-Diagonal Stripe",
            "Split Parabola","Phase Jitter Ring","Stochastic Radial","Recursive Triangle",
            "Sheared Oval","Axial Lurch","Compound Rake","Tangent Break","Glitch Burst"},
    Callback=function(v) config.motion_pattern = v end })

local EvasionBox = MovementTab:AddRightGroupbox("Evasion")
EvasionBox:AddToggle("Evasion", { Text="Evasion", Default=false, Callback=function(v)
    config.evasion_enabled = v
    if v then getgenv().start_evasion() else getgenv().stop_evasion() end
end })
EvasionBox:AddSlider("EvasionRadius", { Text="Radius", Default=100, Min=5, Max=100000, Rounding=0,
    Callback=function(v) getgenv()._evasion_Config.RandomBaseRadius = v end })
EvasionBox:AddToggle("EvasionChar", { Text="Character Origin", Default=false,
    Callback=function(v) getgenv()._evasion_Config.RandomAnchorFromChar = v end })

-- ============= UTILITIES =============
local AutoBox = UtilitiesTab:AddLeftGroupbox("Automation")
AutoBox:AddToggle("AutoCollect", { Text="Auto Collect", Default=false, Callback=function(v)
    config.auto_collect = v
    if v then getgenv().start_autocollect() else getgenv().stop_autocollect() end
end })
AutoBox:AddSlider("CollectRadius", { Text="Collect Radius", Default=120, Min=10, Max=300, Rounding=0,
    Callback=function(v) config.collect_radius = v end })
AutoBox:AddToggle("SafeZone", { Text="Safe Zone Rescue", Default=false, Callback=function(v)
    config.safe_zone_rescue = v
    if v then getgenv().start_safe_zone() else getgenv().stop_safe_zone() end
end })
AutoBox:AddSlider("SafeY", { Text="Depth Threshold", Default=-10, Min=-200, Max=50, Rounding=0,
    Callback=function(v) config.depth_threshold = v end })
AutoBox:AddToggle("ReturnHome", { Text="Return Home", Default=false, Callback=function(v)
    config.return_home = v
    if v then getgenv().start_return_home() else getgenv().stop_return_home() end
end })
AutoBox:AddButton("Save Home Position", function()
    local h = getgenv().get_hrp(localplayer)
    if h then getgenv().home_position = h.Position; notify("meowwCL", "Home saved") end
end)
AutoBox:AddToggle("AntiAfk", { Text="Anti AFK", Default=false, Callback=function(v)
    config.anti_afk_enabled = v
    if v then getgenv().start_anti_afk() else getgenv().stop_anti_afk() end
end })

local LoopBox = UtilitiesTab:AddRightGroupbox("Teleport Loop")
LoopBox:AddToggle("LoopEnable", { Text="Teleport Loop", Default=false, Callback=function(v)
    config.teleport_loop_enabled = v
    if v then getgenv().start_teleport_loop() else getgenv().stop_teleport_loop() end
end })
LoopBox:AddSlider("LoopDelay", { Text="Loop Delay (×10ms)", Default=50, Min=10, Max=1000, Rounding=0,
    Callback=function(v) config.loop_delay = v / 100 end })
LoopBox:AddButton("Add Waypoint", function()
    local h = getgenv().get_hrp(localplayer)
    if h then table.insert(getgenv().loop_waypoints, h.Position); notify("meowwCL", "Waypoint added") end
end)
LoopBox:AddButton("Clear Waypoints", function()
    getgenv().loop_waypoints = {}; getgenv().loop_index = 1; notify("meowwCL", "Waypoints cleared")
end)

local DefenseBox = UtilitiesTab:AddLeftGroupbox("Defense")
DefenseBox:AddToggle("Translocation", { Text="Translocation", Default=false, Callback=function(v)
    config.translocation = v
    if v then getgenv().start_translocation() else getgenv().stop_translocation() end
end })
DefenseBox:AddToggle("AntiTransloc", { Text="Anti Translocation", Default=false, Callback=function(v)
    config.anti_translocation = v
    if v then getgenv().start_anti_translocation() else getgenv().stop_anti_translocation() end
end })
DefenseBox:AddToggle("AntiTeleport", { Text="Anti Teleportation", Default=false, Callback=function(v)
    config.anti_teleportation = v
    if v then getgenv().start_anti_teleportation() else getgenv().stop_anti_teleportation() end
end })
DefenseBox:AddSlider("ATP_Threshold", { Text="Detect Threshold", Default=2000, Min=100, Max=100000, Rounding=0,
    Callback=function(v) config.anti_tp_threshold = v end })
DefenseBox:AddSlider("ATP_Escape", { Text="Escape Distance", Default=100000000, Min=1000, Max=1000000000, Rounding=0,
    Callback=function(v) config.anti_tp_escape_dist = v end })

local ProtectionBox = UtilitiesTab:AddRightGroupbox("Protection")
ProtectionBox:AddToggle("PerfectBlock", { Text="Perfect Block", Default=false, Callback=function(v)
    config.perfect_block_enabled = v
    if v then getgenv().start_perfect_block() else getgenv().stop_perfect_block() end
end })
ProtectionBox:AddToggle("SmartRiot", { Text="Smart Riot", Default=false, Callback=function(v)
    config.smart_riot_enabled = v
    if v then getgenv().start_smart_riot() else getgenv().stop_smart_riot() end
end })
ProtectionBox:AddToggle("Underground", { Text="Underground", Default=false, Callback=function(v)
    config.underground_enabled = v
    if v then getgenv().start_underground() else getgenv().stop_underground() end
end })
ProtectionBox:AddToggle("Godmode", { Text="Godmode (Y Range)", Default=false, Callback=function(v)
    config.godmode = v
    if v then getgenv().start_godmode() else getgenv().stop_godmode() end
end })

local CounterBox = UtilitiesTab:AddLeftGroupbox("Counters")
CounterBox:AddToggle("UECounter", { Text="UE Counter", Default=false, Callback=function(v)
    config.ue_counter_enabled = v
    if v then getgenv().start_ue_counter() else getgenv().stop_ue_counter() end
end })
CounterBox:AddToggle("HookCounter", { Text="KiciaHook Counter", Default=false, Callback=function(v)
    config.hook_counter_enabled = v
    if v then getgenv().start_hook_counter() else getgenv().stop_hook_counter() end
end })
CounterBox:AddToggle("SleepyCounter", { Text="SleepyHub Counter", Default=false, Callback=function(v)
    config.sleepyhub_counter_enabled = v
    if v then getgenv().start_sleepyhub_counter() else getgenv().stop_sleepyhub_counter() end
end })
CounterBox:AddToggle("NebulaCounter", { Text="Nebula Counter", Default=false, Callback=function(v)
    config.nebula_counter_enabled = v
    if v then getgenv().start_nebula_counter() else getgenv().stop_nebula_counter() end
end })

-- ============= SETTINGS =============
local CfgBox = SettingsTab:AddLeftGroupbox("Configuration")
CfgBox:AddButton("Save Config", function()
    local t = {}
    for k, v in pairs(config) do
        if type(v) ~= "table" and type(v) ~= "function" then t[k] = v end
    end
    if writefile then
        pcall(function()
            if not isfolder("meowwCL") then makefolder("meowwCL") end
            writefile("meowwCL/config.json", HttpService:JSONEncode(t))
        end)
        notify("meowwCL", "Config saved")
    end
end)
CfgBox:AddButton("Load Config", function()
    if readfile and isfile and isfile("meowwCL/config.json") then
        pcall(function()
            local data = HttpService:JSONDecode(readfile("meowwCL/config.json"))
            for k, v in pairs(data) do
                if config[k] ~= nil and type(config[k]) == type(v) then config[k] = v end
            end
        end)
        notify("meowwCL", "Config loaded")
    end
end)

local SysBox = SettingsTab:AddRightGroupbox("System")
SysBox:AddButton("Unload", function()
    getgenv().meowwCL_loaded = false
    local kills = {
        "stop_fly","stop_orbit","stop_voidspam_type","stop_void_spam","stop_body_manip",
        "stop_translocation","stop_anti_translocation","stop_anti_teleportation",
        "stop_ragebot_bypass_partglue","stop_kicia_counter","stop_nebula_counter",
        "stop_sleepyhub_counter","stop_ue_counter","stop_hook_counter",
        "stop_autoshoot","stop_bullet_redirect","stop_gun_bypass","stop_rapid_fire",
        "stop_ability_cooldown","stop_anti_afk","stop_autocollect","stop_safe_zone",
        "stop_return_home","stop_teleport_loop","stop_evasion","stop_underground",
        "stop_perfect_block","stop_smart_riot","stop_riot_abuser","stop_riot_bypass",
        "stop_knife_bypass","stop_perfect_accuracy","stop_godmode",
        "stop_slingshot_bypass","stop_slingshot_orbit",
    }
    for _, name in ipairs(kills) do
        if type(getgenv()[name]) == "function" then pcall(getgenv()[name]) end
    end
    pcall(getgenv().destroyXYZOverlay)
    for _, c in ipairs(getgenv().all_connections or {}) do pcall(function() c:Disconnect() end) end
    getgenv().all_connections = {}
    pcall(function() Library:Unload() end)
end)

notify("meowwCL Premium", "Loaded — meowluaprivate engine")
getgenv().meowwCL_loaded = true