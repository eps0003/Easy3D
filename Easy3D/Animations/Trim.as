shared class Trim : IAnimation
{
	private IAnimation@ animation;
	private float start = 0.0f;
	private float end = 1.0f;

	Trim(IAnimation@ animation, float start, float end)
	{
		@this.animation = animation;
		this.start = start;
		this.end = end;
	}

	float getDuration()
	{
		return Maths::Abs(animation.getDuration() * (end - start));
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float tNew = (start + (end - start) * t) % 1.0f;
		animation.Animate(tNew, origin, translation, scale, rotation);
	}
}
