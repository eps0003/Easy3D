#include "CMatrix.as"
#include "Interpolation.as"
#include "Maths.as"
#include "Quaternion.as"
#include "Vec3f.as"

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
