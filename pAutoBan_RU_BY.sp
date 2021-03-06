/* [ Includes ] */
#include <sourcemod>
#include <sdktools>
#include <geoip>
#include <sourcebanspp>

/* [ Compiler Options ] */
#pragma newdecls required
#pragma semicolon		1

/* [ Defines ] */
#define PLUGIN_NAME 		"[CS:GO] Pawel - [ Ban Russia & Belarus ]"
#define PLUGIN_AUTHOR 		"Paweł"
#define PLUGIN_DESC 		"Automatyczne banowanie graczy z Rosji oraz Białorusi na serwery CS:GO by Pawel"
#define PLUGIN_VERSION 		"1.0.0"
#define PLUGIN_URL 			"[ https://steamcommunity.com/id/pawelsteam | Paweł#8244 ]"
#define BAN_MESSAGE			"Your country has invaded Ukraine. You are not allowed to join this server before war ends. ([RU] & [BY])"
#define BAN_TIME			45000 // Minuty

/* [ Plugin Author And Informations ] */
public Plugin myinfo = {
	name = PLUGIN_NAME, 
	author = PLUGIN_AUTHOR, 
	description = PLUGIN_DESC, 
	version = PLUGIN_VERSION, 
	url = PLUGIN_URL
};


/* [ Standard Actions ] */
public void OnClientPostAdminCheck(int iClient){
	char sIp[32], sCountry[3];
	GetClientIP(iClient, sIp, sizeof(sIp));
	if (GeoipCode2(sIp, sCountry)) {
		if (StrEqual(sCountry, "RU") || StrEqual(sCountry, "BY")) {
			SBPP_BanPlayer(0, iClient, BAN_TIME, BAN_MESSAGE);
		}
	}
} 