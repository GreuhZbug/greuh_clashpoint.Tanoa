if ( isNil "public_killspam" ) then { public_killspam = []; };
while { true } do {
	waitUntil { count public_killspam != 0 };
	[public_killspam select 0, public_killspam select 1] call killspam_add;
	public_killspam = [];
};