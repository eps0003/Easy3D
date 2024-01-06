const string[] SCRIPTS = {
	"HuskManager.as",
	"InterpolationHooks.as"
};

void onInit(CRules@ this)
{
	for (uint i = 0; i < SCRIPTS.size(); i++)
	{
		this.AddScript(SCRIPTS[i]);
	}
}
