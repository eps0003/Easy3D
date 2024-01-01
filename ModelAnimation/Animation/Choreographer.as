shared class Choreographer
{
	private dictionary animations;
	private dictionary animators;

	private IAnimation@[]@ currentAnimations;
	private Animator@[]@ currentAnimators;

	Choreographer@ Register(string name, Animator@ animator, IAnimation@ animation)
	{
		IAnimation@[] animations;
		Animator@[] animators;

		this.animations.get(name, animations);
		this.animators.get(name, animators);

		animations.push_back(animation);
		animators.push_back(animator);

		this.animations.set(name, animations);
		this.animators.set(name, animators);

		return this;
	}

	void Transition(string name)
	{
		animations.get(name, @currentAnimations);
		animators.get(name, @currentAnimators);
	}

	void Animate()
	{
		if (currentAnimations is null || currentAnimators is null) return;

		for (uint i = 0; i < currentAnimations.size(); i++)
		{
			IAnimation@ animation = currentAnimations[i];
			Animator@ animator = currentAnimators[i];

			animator.Animate(animation);
		}
	}
}
