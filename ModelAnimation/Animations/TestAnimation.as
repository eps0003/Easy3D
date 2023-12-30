shared class TestAnimation1 : IAnimation
{
	private Vec3f initialOrigin;
	private Vec3f initialTranslation;
	private Vec3f initialScale;
	private Quaternion initialRotation;

	TestAnimation1(Model@ model)
	{
		initialOrigin = model.getOrigin();
		initialTranslation = model.getTranslation();
		initialScale = model.getScale();
		initialRotation = model.getRotation();
	}

	Vec3f getOrigin(float t)
	{
		return initialOrigin;
	}

	Vec3f getTranslation(float t)
	{
		return initialTranslation;
	}

	Vec3f getScale(float t)
	{
		return initialScale;
	}

	Quaternion getRotation(float t)
	{
		return initialRotation;
	}
}

shared class TestAnimation2 : IAnimation
{
	private Vec3f initialOrigin;
	private Vec3f initialTranslation;
	private Vec3f initialScale;
	private Quaternion initialRotation;

	TestAnimation2(Model@ model)
	{
		initialOrigin = model.getOrigin();
		initialTranslation = model.getTranslation();
		initialScale = model.getScale();
		initialRotation = model.getRotation();
	}

	Vec3f getOrigin(float t)
	{
		return initialOrigin;
	}

	Vec3f getTranslation(float t)
	{
		return initialTranslation + Vec3f(2, -2, 0);
	}

	Vec3f getScale(float t)
	{
		return initialScale;
	}

	Quaternion getRotation(float t)
	{
		return initialRotation;
	}
}

