shared float getAspectRatio()
{
	return getScreenWidth() / float(getScreenHeight());
}

shared bool isTickPaused()
{
	return isLocalHost() && Menu::getMainMenu() !is null;
}

shared bool isLocalHost()
{
	return isClient() && isServer();
}
