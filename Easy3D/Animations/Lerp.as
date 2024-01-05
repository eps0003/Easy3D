shared class Lerp : IAnimation
{
	private IAnimation@ animation1;
	private IAnimation@ animation2;
	private float percentage = 1.0f;

	Lerp(IAnimation@ animation1, IAnimation@ animation2, float percentage)
	{
		@this.animation1 = animation1;
		@this.animation2 = animation2;
		this.percentage = Maths::Clamp01(percentage);
	}

	float getDuration()
	{
		return animation2.getDuration();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		Vec3f origin1, origin2;
		Vec3f translation1, translation2;
		Vec3f scale1(1), scale2(1);
		Quaternion rotation1, rotation2;

		animation1.Animate(1.0f, origin1, translation1, scale1, rotation1);
		animation2.Animate(t, origin2, translation2, scale2, rotation2);

		float t2 = percentage != 0 ? Maths::Clamp01(t / percentage) : 0.0f;

		origin = origin1.lerp(origin2, t2);
		translation = translation1.lerp(translation2, t2);
		scale = scale1.lerp(scale2, t2);
		rotation = rotation1.lerp(rotation2, t2);
	}
}
