shared class Multi : IAnimation
{
	private IAnimation@[] animations;

	Multi(IAnimation@[] animations)
	{
		this.animations = animations;
	}

	Multi@ Add(IAnimation@ animation)
	{
		animations.push_back(animation);
		return this;
	}

	float getDuration()
	{
		return animations.size() > 0 ? animations[0].getDuration() : 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		for (uint i = 0; i < animations.size(); i++)
		{
			Vec3f _origin;
			Vec3f _translation;
			Vec3f _scale;
			Quaternion _rotation;

			animations[i].Animate(t, _origin, _translation, _scale, _rotation);

			origin += _origin;
			translation += _translation;
			scale *= _scale;
			rotation *= _rotation;
		}
	}
}
