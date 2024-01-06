shared float getAspectRatio()
{
	return getScreenWidth() / float(getScreenHeight());
}

shared int getFPS()
{
	return getRules().get_u32("fps");
}

shared float getInterpolatedGameTime()
{
	return isClient() ? getRules().get_f32("inter_game_time") : ::getGameTime();
}

shared bool isLocalHost()
{
	return isClient() && isServer();
}

shared bool isTickPaused()
{
	return isLocalHost() && Menu::getMainMenu() !is null;
}
