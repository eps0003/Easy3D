namespace Maths
{
	shared s8 Sign(float value)
	{
		if (value > 0)
			return 1;
		if (value < 0)
			return -1;
		return 0;
	}

	shared float ClampSmart(float value, float bound1, float bound2)
	{
		float low, high;

		if (low < high)
		{
			low = bound1;
			high = bound2;
		}
		else
		{
			low = bound2;
			high = bound1;
		}

		return Maths::Clamp(value, low, high);
	}

	shared float AngleDifference(float angle1, float angle2)
	{
		float diff = (angle2 - angle1 + 180) % 360 - 180;
		return diff < -180 ? diff + 360 : diff;
	}

	shared float LerpAngle(float angle1, float angle2, float t)
	{
		return angle1 + AngleDifference(angle1, angle2) * t;
	}

	shared float toRadians(float degrees)
	{
		return degrees * Maths::Pi / 180.0f;
	}

	shared float toDegrees(float radians)
	{
		return radians * 180.0f / Maths::Pi;
	}
}
