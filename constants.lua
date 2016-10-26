PLUGIN = nil;

RESIDENTBUILD = 0x1;
RESIDENTDESTROY = 0x2;
RESIDENTSWITCH = 0x4;
RESIDENTITEMUSE = 0x8;
ALLYBUILD = 0x10;
ALLYDESTROY = 0x20;
ALLYSWITCH = 0x40;
ALLYITEMUSE = 0x80;
OUTSIDERBUILD = 0x100;
OUTSIDERDESTROY = 0x200;
OUTSIDERSWITCH = 0x400;
OUTSIDERITEMUSE = 0x800;

TownRanks = {
	["resident"] = 1,
	["assistant"] = 2,
	["mayor"] = 3,
}

TOWNEXPLOSIONSENABLED = 0x1;
TOWNPVPENABLED = 0x2;
TOWNMOBSENABLED = 0x4;

PLOTMOBSINHERIT = 0x1;
PLOTMOBSENABLED = 0x2;