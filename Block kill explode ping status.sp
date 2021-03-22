#include <sourcemod>
#include <multicolors>

#pragma newdecls required
#pragma semicolon 1

public Plugin myinfo = 
{
	name = "Block kill and explode", 
	author = "LanteJoula", 
	description = "Block kill and explode commands on console", 
	version = "1.1", 
	url = "http://steamcommunity.com/id/lantejoula"
};

public void OnPluginStart()
{
	RegConsoleCmd("kill", Cmd_Kill);
	RegConsoleCmd("killvector", Cmd_Kill);
	
	RegConsoleCmd("explode", Cmd_Explode);
	RegConsoleCmd("explodevector", Cmd_Explode);
	
	RegConsoleCmd("status", block);
	RegConsoleCmd("ping", block);
	
	LoadTranslations("blockkillexplodepingstatus.phrases");
}

public Action Cmd_Kill(int client, int args)
{
	CPrintToChat(client, "%t %t", "Prefix", "You dont have access for kill");
	return Plugin_Handled;
}

public Action Cmd_Explode(int client, int args)
{
	CPrintToChat(client, "%t %t", "Prefix", "You dont have access for explode");
	return Plugin_Handled;
}

public Action block(int client, int args)
{
	if (!(0 < client <= MaxClients) || !(GetUserFlagBits(client) & ADMFLAG_GENERIC))
	{
		return Plugin_Stop;
	}
	return Plugin_Continue;
} 