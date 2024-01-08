shared class DanceBodyAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 4.0f;
		float t3 = Maths::Cos(t2);

		translation = Vec3f(0, -0.04f * t3, 0);
		rotation = Quaternion().SetFromEulerDegrees(-4 - 4 * t3, 0, 0);
	}
}

shared class DanceHeadAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 4.0f;
		float t3 = Maths::Cos(t2);

		rotation = Quaternion().SetFromEulerDegrees(4 + 4 * t3, 0, 0);
	}
}

shared class DanceUpperArmAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		float t3 = Maths::Sin(Maths::Pi * 0.5f * Maths::Cos(t2));

		rotation = Quaternion().SetFromEulerDegrees(10 + 10 * t3, 0, 0);
	}
}

shared class DanceLowerArmAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		float t3 = Maths::Sin(Maths::Pi * 0.5f * Maths::Cos(t2));

		rotation = Quaternion().SetFromEulerDegrees(60 + 20 * t3, 0, 0);
	}
}

shared class DanceUpperLegAnimation : IAnimation
{
	private float legSpread = 0.0f;

	DanceUpperLegAnimation(float legSpread)
	{
		this.legSpread = legSpread;
	}

	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 4.0f;
		float t3 = Maths::Cos(t2);

		rotation = Quaternion().SetFromEulerDegrees(8 + 8 * t3, 0, legSpread);
	}
}

shared class DanceLowerLegAnimation : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 4.0f;
		float t3 = Maths::Cos(t2);

		rotation = Quaternion().SetFromEulerDegrees(-8 - 8 * t3, 0, 0);
	}
}

// =====================

shared class DanceUpperArmAnimation2 : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		float t3 = Maths::Sin(Maths::Pi * 0.5f * Maths::Cos(t2));

		rotation = Quaternion().SetFromEulerDegrees(30 + 30 * t3, 0, 0);
	}
}

shared class DanceLowerArmAnimation2 : IAnimation
{
	float getDuration()
	{
		return 0.8f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float t2 = t * Maths::Pi * 2.0f;
		float t3 = Maths::Sin(Maths::Pi * 0.5f * Maths::Cos(t2));

		rotation = Quaternion().SetFromEulerDegrees(60 - 20 * t3, 0, 0);
	}
}
