public_medic_message = [];

while { true } do {
	waitUntil { count public_medic_message != 0 };
	(public_medic_message select 0) sidechat (public_medic_message select 1);
	public_medic_message = [];
};