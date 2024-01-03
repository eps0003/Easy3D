shared class Repeat : IAnimation
{
	private IAnimation@ animation;
	private uint count = 0;

	Repeat(IAnimation@ animation, uint count)
	{
		@this.animation = animation;
		this.count = count;
	}

	float getDuration()
	{
		return animation.getDuration() * count;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float tNew = (t * count) % 1.0f;
		animation.Animate(tNew, origin, translation, scale, rotation);
	}
}
