shared float easeIn(float t, float power = 2.0f)
{
	return Maths::Pow(t, power);
}

shared float easeOut(float t, float power = 2.0f)
{
	return 1 - Maths::Pow(1 - t, power);
}

shared float easeInOut(float t, float power = 2.0f)
{
	return t < 0.5f
		? Maths::Pow(2, power - 1) * Maths::Pow(t, power)
		: 1 - Maths::Pow(-2 * t + 2, power) / 2;
}

shared interface Easing
{
	float ease(float t);
}

shared class EaseLinear : Easing
{
	float ease(float t)
	{
		return t;
	}
}

shared class EaseIn : Easing
{
	private float power = 2.0f;

	EaseIn(float power)
	{
		this.power = power;
	}

	float ease(float t)
	{
		return easeIn(t, power);
	}
}

shared class EaseOut : Easing
{
	private float power = 2.0f;

	EaseOut(float power)
	{
		this.power = power;
	}

	float ease(float t)
	{
		return easeOut(t, power);
	}
}

shared class EaseInOut : Easing
{
	private float power = 2.0f;

	EaseInOut(float power)
	{
		this.power = power;
	}

	float ease(float t)
	{
		return easeInOut(t, power);
	}
}
