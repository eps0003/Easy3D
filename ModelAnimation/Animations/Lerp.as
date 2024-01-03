shared class Lerp : IAnimation
{
	private IAnimation@ animation1;
	private IAnimation@ animation2;
	private Easing@ easing;
	private float seconds = 0.0f;

	Lerp(IAnimation@ animation1, IAnimation@ animation2, Easing@ easing, float seconds)
	{
		@this.animation1 = animation1;
		@this.animation2 = animation2;
		@this.easing = easing;
		this.seconds = Maths::Max(0.0f, seconds);
	}

	float getDuration()
	{
		return seconds * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		Vec3f origin1, origin2;
		Vec3f translation1, translation2;
		Vec3f scale1(1), scale2(1);
		Quaternion rotation1, rotation2;

		animation1.Animate(1.0f, origin1, translation1, scale1, rotation1);
		animation2.Animate(0.0f, origin2, translation2, scale2, rotation2);

		float tEase = easing.ease(t);

		origin = origin1.lerp(origin2, tEase);
		translation = translation1.lerp(translation2, tEase);
		scale = scale1.lerp(scale2, tEase);
		rotation = rotation1.lerp(rotation2, tEase);
	}
}
