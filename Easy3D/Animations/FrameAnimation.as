shared class FrameAnimation : IAnimation
{
	private float durationSeconds = 0.0f;
	private float translationScale = 0.01f;

	private Vec3f[] translations;
	private Quaternion[] rotations;

	FrameAnimation(string cfgName)
	{
		ConfigFile cfg;
		if (cfg.loadFile(cfgName))
		{
			uint frames = cfg.read_u32("frames", 0);
			uint fps = cfg.read_u32("fps", 30);

			durationSeconds = frames / fps;

			for (uint i = 0; i < frames; i++)
			{
				float[] xyz;
				if (cfg.readIntoArray_f32(xyz, "translation" + i))
				{
					translations.push_back(Vec3f(xyz));
				}

				float[] xyzw;
				if (cfg.readIntoArray_f32(xyzw, "rotation" + i))
				{
					rotations.push_back(Quaternion(xyzw));
				}
			}
		}
	}

	float getDuration()
	{
		return durationSeconds * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		uint translationsCount = translations.size();
		if (translationsCount > 0)
		{
			uint index = Maths::Clamp(translationsCount * t, 0, translationsCount - 1);
			translation = translations[index] * translationScale;
		}

		uint rotationsCount = rotations.size();
		if (rotationsCount > 0)
		{
			uint index = Maths::Clamp(rotationsCount * t, 0, rotationsCount - 1);
			rotation = rotations[index];
		}
	}
}
