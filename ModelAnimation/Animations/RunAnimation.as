shared class BodyRunAnimation : DefaultAnimation
{
	float getDuration()
	{
		return 1.0f;
	}

	Vec3f@ getTranslation(float t)
	{
		float t2 = t * Maths::Pi * 2.0f;
		return Vec3f(0, Maths::Abs(Maths::Cos(t2) * 0.1f), 0);
	}

	Quaternion@ getRotation(float t)
	{
		float t2 = t * Maths::Pi * 2.0f;

		Vec2f mousePos = getControls().getInterpMouseScreenPos();
		Vec2f screenPos = getDriver().getScreenDimensions();

		float percentageX = (mousePos.x / screenPos.x) - 0.5f;
		float percentageY = (mousePos.y / screenPos.y) - 0.5f;

		return Quaternion().SetFromEulerDegrees(-4.0f + Maths::Sin(t2 * 2.0f) /*- 100 * percentageY*/, 400 * percentageX, 0);
	}
}

shared class HeadRunAnimation : DefaultAnimation
{
	float getDuration()
	{
		return 1.0f;
	}

	Quaternion@ getRotation(float t)
	{
		float t2 = t * Maths::Pi * 2.0f;
		return Quaternion().SetFromEulerDegrees(Maths::Sin(t2 * 2.0f), 0, 0);
	}
}

shared class UpperLeftArmRunAnimation : DefaultAnimation
{
	float getDuration()
	{
		return 1.0f;
	}

	Quaternion@ getRotation(float t)
	{
		float t2 = t * Maths::Pi * 2.0f;
		return Quaternion().SetFromEulerDegrees(Maths::Cos(t2) * -40.0f, 0, 0);
	}
}

shared class LowerLeftArmRunAnimation : DefaultAnimation
{
	float getDuration()
	{
		return 1.0f;
	}

	Quaternion@ getRotation(float t)
	{
		float t2 = t * Maths::Pi * 2.0f;
		return Quaternion().SetFromEulerDegrees(Maths::Max(0, Maths::Cos(t2) * -40.0f), 0, 0);
	}
}

shared class UpperRightArmRunAnimation : DefaultAnimation
{
	float getDuration()
	{
		return 1.0f;
	}

	Quaternion@ getRotation(float t)
	{
		float t2 = t * Maths::Pi * 2.0f;
		return Quaternion().SetFromEulerDegrees(Maths::Cos(t2) * 40.0f, 0, 0);
	}
}

shared class LowerRightArmRunAnimation : DefaultAnimation
{
	float getDuration()
	{
		return 1.0f;
	}

	Quaternion@ getRotation(float t)
	{
		float t2 = t * Maths::Pi * 2.0f;
		return Quaternion().SetFromEulerDegrees(Maths::Max(0, Maths::Cos(t2) * 40.0f), 0, 0);
	}
}

shared class UpperLeftLegRunAnimation : DefaultAnimation
{
	float getDuration()
	{
		return 1.0f;
	}

	Quaternion@ getRotation(float t)
	{
		float t2 = t * Maths::Pi * 2.0f;
		return Quaternion().SetFromEulerDegrees(Maths::Cos(t2) * 40.0f, 0, 0);
	}
}

shared class LowerLeftLegRunAnimation : DefaultAnimation
{
	float getDuration()
	{
		return 1.0f;
	}

	Quaternion@ getRotation(float t)
	{
		float t2 = t * Maths::Pi * 2.0f;
		return Quaternion().SetFromEulerDegrees(Maths::Min(0, Maths::Sin(t2) * 40.0f), 0, 0);
	}
}

shared class UpperRightLegRunAnimation : DefaultAnimation
{
	float getDuration()
	{
		return 1.0f;
	}

	Quaternion@ getRotation(float t)
	{
		float t2 = t * Maths::Pi * 2.0f;
		return Quaternion().SetFromEulerDegrees(Maths::Cos(t2) * -40.0f, 0, 0);
	}
}

shared class LowerRightLegRunAnimation : DefaultAnimation
{
	float getDuration()
	{
		return 1.0f;
	}

	Quaternion@ getRotation(float t)
	{
		float t2 = t * Maths::Pi * 2.0f;
		return Quaternion().SetFromEulerDegrees(Maths::Min(0, -Maths::Sin(t2) * 40.0f), 0, 0);
	}
}
