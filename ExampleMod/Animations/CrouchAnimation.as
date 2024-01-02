shared class BodyCrouchAnimation : DefaultAnimation
{
	Vec3f@ getTranslation(float t)
	{
		return Vec3f(0, -0.375, 0);
	}

	Quaternion@ getRotation(float t)
	{
		Vec2f mousePos = getControls().getInterpMouseScreenPos();
		Vec2f screenPos = getDriver().getScreenDimensions();

		float percentageX = (mousePos.x / screenPos.x) - 0.5f;
		float percentageY = (mousePos.y / screenPos.y) - 0.5f;

		return Quaternion().SetFromEulerDegrees(0 /*-100 * percentageY*/, 400 * percentageX, 0);
	}
}

shared class UpperLeftLegCrouchAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(-10, 0, 0);
	}
}

shared class LowerLeftLegCrouchAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(-80, 0, 0);
	}
}

shared class UpperRightLegCrouchAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(70, 0, 0);
	}
}

shared class LowerRightLegCrouchAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(-70, 0, 0);
	}
}
