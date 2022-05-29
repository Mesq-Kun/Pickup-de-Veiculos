//* Sistema criado por mesq#2675*//
//* Github: https://github.com/Mesq-Kun*//


public OnGameModeInit()
{
    AddStaticPickup(1239, 23, 1585.9441,-1677.5337,5.8970);
    Create3DTextLabel("[Nome do Server]\n{FFFFFF}Pressione 'Y' para spawnar um veiculo patrulha",0x1E90FFFF,1585.9441,-1677.5337,5.8970,30.0,0);
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys==KEY_YES) //botao 'Y'
    //voce pode por qualquer parametro aqui
    if(IsPlayerInRangeOfPoint(playerid,10.0,1440.9050,-1639.1666,13.3934)){ //IsPlayerInRangeOfPoint onde o player executara o comando apos apertar 'Y'
    if(GetPVarInt(playerid, "VeiculoS") == 1)
    {
    DestroyVehicle(GetPVarInt(playerid, "VeiculoCriado"));
    SetPVarInt(playerid, "VeiculoS", 0);
    SendClientMessage(playerid, 0xFF0000FF, "Veiculo Destruido!");
    return 1;
    } else if(GetPVarInt(playerid, "VeiculoS") == 0) {
    new Float:Pos[4];
    new ID;
    SendClientMessage(playerid, 0xFF0000FF, "{FFD700}Use: '/mt ou Y' para ligar ou desligar o veiculo e '/cinto'"); //mensagem apos o player entrar no veiculo
    GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
    GetPlayerFacingAngle(playerid, Pos[3]);
    ID = CreateVehicle(510,Pos[0], Pos[1], Pos[2],Pos[3],1,1,-1); //para mudar o id do veiculo basta mudar o '510' para o id do veiculo que queira
    PutPlayerInVehicle(playerid, ID, 0);
    SetPVarInt(playerid, "VeiculoCriado", ID);
	SetPVarInt(playerid, "VeiculoS", 1);
	Gasosa[ID] = 60; //variavel da gasolina
    return 1;
        }
    }
	return 1;
}