namespace Interpolation
{
	shared float getGameTime()
	{
		return isClient() ? getRules().get_f32("inter_game_time") : ::getGameTime();
	}

	shared float getFrameTime()
	{
		return isClient() ? getRules().get_f32("inter_frame_time") : 1.0f;
	}
}

shared int getFPS()
{
	return getRules().get_u32("fps");
}
