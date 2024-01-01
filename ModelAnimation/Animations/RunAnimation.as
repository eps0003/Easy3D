shared class BodyRunAnimation : DefaultAnimation
{
	Vec3f@ getTranslation(float t)
	{
		return Vec3f(0, Maths::Abs(Maths::Cos(t) * 0.1f), 0);
	}

	Quaternion@ getRotation(float t)
	{
		Vec2f mousePos = getControls().getInterpMouseScreenPos();
		Vec2f screenPos = getDriver().getScreenDimensions();

		float percentageX = (mousePos.x / screenPos.x) - 0.5f;
		float percentageY = (mousePos.y / screenPos.y) - 0.5f;

		return Quaternion().SetFromEulerDegrees(-4.0f + Maths::Sin(t * 2.0f) /*- 100 * percentageY*/, 400 * percentageX, 0);
	}
}

shared class HeadRunAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(Maths::Sin(t * 2.0f), 0, 0);
	}
}

shared class UpperLeftArmRunAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(Maths::Cos(t) * -40.0f, 0, 0);
	}
}

shared class LowerLeftArmRunAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(Maths::Max(0, Maths::Cos(t) * -40.0f), 0, 0);
	}
}

shared class UpperRightArmRunAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(Maths::Cos(t) * 40.0f, 0, 0);
	}
}

shared class LowerRightArmRunAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(Maths::Max(0, Maths::Cos(t) * 40.0f), 0, 0);
	}
}

shared class UpperLeftLegRunAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(Maths::Cos(t) * 40.0f, 0, 0);
	}
}

shared class LowerLeftLegRunAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(Maths::Min(0, Maths::Sin(t) * 40.0f), 0, 0);
	}
}

shared class UpperRightLegRunAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(Maths::Cos(t) * -40.0f, 0, 0);
	}
}

shared class LowerRightLegRunAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(Maths::Min(0, -Maths::Sin(t) * 40.0f), 0, 0);
	}
}
