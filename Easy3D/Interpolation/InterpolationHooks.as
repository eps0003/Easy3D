#include "Utilities.as"

#define CLIENT_ONLY

float[] fpsSamples;

void onInit(CRules@ this)
{
	onRestart(this);
}

void onRestart(CRules@ this)
{
	onTick(this);
}

void onTick(CRules@ this)
{
	this.set_f32("inter_frame_time", 0.0f);
	this.set_f32("inter_game_time", getGameTime());

	this.set_u32("fps", Maths::Round(calculateFPS(fpsSamples)));
}

void onRender(CRules@ this)
{
	if (isTickPaused()) return;

	float correction = getRenderExactDeltaTime() * getTicksASecond();
	if (correction <= 0.0f) return;

	this.add_f32("inter_frame_time", correction);
	this.add_f32("inter_game_time", correction);

	fpsSamples.push_back(getTicksASecond() / correction);
}

float calculateFPS(float[] samples)
{
	float fps = 0.0f;
	uint size = samples.size();

	if (size > 0)
	{
		for (uint i = 0; i < size; i++)
		{
			fps += samples[i];
		}
		fps /= size;
		samples.clear();
	}
	else if (!isWindowFocused())
	{
		fps = v_capped ? 30 : 60;
	}

	return fps;
}
