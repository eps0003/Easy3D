shared class BodyRunAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;

		origin = Vec3f(0, Maths::Abs(Maths::Cos(t2) * 0.1f), 0);
		rotation = Quaternion().SetFromEulerDegrees(-4.0f + Maths::Sin(t2 * 2.0f), 0, 0);
	}
}

shared class HeadRunAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		rotation = Quaternion().SetFromEulerDegrees(Maths::Sin(t2 * 2.0f), 0, 0);
	}
}

shared class UpperLeftArmRunAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		rotation = Quaternion().SetFromEulerDegrees(Maths::Cos(t2) * -40.0f, 0, 0);
	}
}

shared class LowerLeftArmRunAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		rotation = Quaternion().SetFromEulerDegrees(Maths::Max(0, Maths::Cos(t2) * -40.0f), 0, 0);
	}
}

shared class UpperRightArmRunAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		rotation = Quaternion().SetFromEulerDegrees(Maths::Cos(t2) * 40.0f, 0, 0);
	}
}

shared class LowerRightArmRunAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		rotation = Quaternion().SetFromEulerDegrees(Maths::Max(0, Maths::Cos(t2) * 40.0f), 0, 0);
	}
}

shared class UpperLeftLegRunAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		rotation = Quaternion().SetFromEulerDegrees(Maths::Cos(t2) * 40.0f, 0, 0);
	}
}

shared class LowerLeftLegRunAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		rotation = Quaternion().SetFromEulerDegrees(Maths::Min(0, Maths::Sin(t2) * 40.0f), 0, 0);
	}
}

shared class UpperRightLegRunAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		rotation = Quaternion().SetFromEulerDegrees(Maths::Cos(t2) * -40.0f, 0, 0);
	}
}

shared class LowerRightLegRunAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		rotation = Quaternion().SetFromEulerDegrees(Maths::Min(0, -Maths::Sin(t2) * 40.0f), 0, 0);
	}
}
