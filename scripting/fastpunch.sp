/*
 * Fast Punches NMRIH
 * Copyright (C) 2024 Blade (https://github.com/IIBladeII)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#define PLUGIN_VERSION "1.0.2"
#define MAX_MULTIPLIER 1.5

// Configurable punch speed
ConVar g_cvPunchSpeedMultiplier;

public Plugin myinfo = {
    name = "Fast Punches NMRIH",
    author = "IIBladeII",
    description = "Allows players to punch faster in NMRIH",
    version = PLUGIN_VERSION,
    url = "https://github.com/IIBladeII"
};

public void OnPluginStart() {
    g_cvPunchSpeedMultiplier = CreateConVar("sm_fastpunch_multiplier", "1.1", "Punch speed multiplier", FCVAR_NOTIFY, true, 1.0, true, MAX_MULTIPLIER);
    AutoExecConfig(true, "fastpunch", "sourcemod");

    HookEvent("player_spawn", Event_PlayerSpawn);
}

public void OnClientPutInServer(int client) {
    SDKHook(client, SDKHook_PreThink, OnPreThink);
}

public void Event_PlayerSpawn(Event event, const char[] name, bool dontBroadcast) {
    int client = GetClientOfUserId(event.GetInt("userid"));
    if (IsValidClient(client))
    {
        SDKHook(client, SDKHook_PreThink, OnPreThink);
    }
}

public void OnPreThink(int client) {
    if (!IsValidClient(client) || !IsPlayerAlive(client))
        return;
    
    int activeWeapon = GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");
    if (activeWeapon == -1)
        return;
    
    char weaponClass[64];
    GetEntityClassname(activeWeapon, weaponClass, sizeof(weaponClass));
    
    if (StrEqual(weaponClass, "me_fists"))
    {
        float nextAttack = GetEntPropFloat(activeWeapon, Prop_Send, "m_flNextPrimaryAttack");
        float gameTime = GetGameTime();
        
        if (nextAttack > gameTime)
        {
            float timeDifference = nextAttack - gameTime;
            float multiplier = g_cvPunchSpeedMultiplier.FloatValue;
            multiplier = (multiplier > MAX_MULTIPLIER) ? MAX_MULTIPLIER : multiplier;
            float newNextAttack = gameTime + (timeDifference / multiplier);
            SetEntPropFloat(activeWeapon, Prop_Send, "m_flNextPrimaryAttack", newNextAttack);
        }
    }
}

bool IsValidClient(int client) {
    return (client > 0 && client <= MaxClients && IsClientInGame(client) && !IsFakeClient(client));
}