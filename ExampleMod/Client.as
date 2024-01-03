#include "ModelAnimation.as"
#include "CrouchAnimation.as"
#include "GunAimAnimation.as"
#include "GunHoldAnimation.as"
#include "RunAnimation.as"
#include "DanceAnimation.as"

#define CLIENT_ONLY

Camera@ camera;
CompositeModel@ model;
Choreographer@ upperChoreographer;
Choreographer@ lowerChoreographer;

void onInit(CRules@ this)
{
	Render::addScript(Render::layer_prehud, getCurrentScriptName(), "Render", 0);

	@camera = Camera();

	// Initialize
	string texture = "KnightSkin.png";
	Model body("ActorBody.obj", texture);
	Model head("ActorHead.obj", texture);
	Model upperLeftArm("ActorUpperLeftArm.obj", texture);
	Model lowerLeftArm("ActorLowerLeftArm.obj", texture);
	Model upperRightArm("ActorUpperRightArm.obj", texture);
	Model lowerRightArm("ActorLowerRightArm.obj", texture);
	Model upperLeftLeg("ActorUpperLeftLeg.obj", texture);
	Model lowerLeftLeg("ActorLowerLeftLeg.obj", texture);
	Model upperRightLeg("ActorUpperRightLeg.obj", texture);
	Model lowerRightLeg("ActorLowerRightLeg.obj", texture);

	// Compose
	@model = CompositeModel(body)
		.Append(CompositeModel(head))
		.Append(CompositeModel(upperLeftArm).Append(CompositeModel(lowerLeftArm)))
		.Append(CompositeModel(upperRightArm).Append(CompositeModel(lowerRightArm)))
		.Append(CompositeModel(upperLeftLeg).Append(CompositeModel(lowerLeftLeg)))
		.Append(CompositeModel(upperRightLeg).Append(CompositeModel(lowerRightLeg)));

	// Arrange
	body.SetTranslation(Vec3f(0, -0.375 * 1.5f, 2.0f));
	body.SetRotation(Quaternion().SetFromEulerDegrees(0, 180, 0));
	head.SetTranslation(Vec3f(0, 0.75f, 0));
	upperLeftArm.SetTranslation(Vec3f(-0.25f, 0.75f, 0));
	lowerLeftArm.SetTranslation(Vec3f(-0.125f, -0.375f, -0.125f));
	lowerLeftArm.SetScale(Vec3f(0.99f));
	upperRightArm.SetTranslation(Vec3f(0.25f, 0.75f, 0));
	lowerRightArm.SetTranslation(Vec3f(0.125f, -0.375f, -0.125f));
	lowerRightArm.SetScale(Vec3f(0.99f));
	lowerLeftLeg.SetTranslation(Vec3f(-0.125f, -0.375f, 0.125f));
	lowerLeftLeg.SetScale(Vec3f(0.99f));
	lowerRightLeg.SetTranslation(Vec3f(0.125f, -0.375f, 0.125f));
	lowerRightLeg.SetScale(Vec3f(0.99f));

	// Animate
	@upperChoreographer = Choreographer();
	@lowerChoreographer = Choreographer();

	float transition = 0.15f;
	float offset = -0.00f;

	IAnimation@ upperLeftArmAnim = Offset(Duration(CompositeAnimation()
		.Add(Repeat(DanceUpperArmAnimation(), 2))
		.Add(Lerp(DanceUpperArmAnimation(), DanceUpperArmAnimation2(), EaseInOut(), transition))
		.Add(Repeat(DanceUpperArmAnimation2(), 2))
		.Add(Lerp(DanceUpperArmAnimation2(), DanceUpperArmAnimation(), EaseInOut(), transition)),
		DanceBodyAnimation().getDuration() * 4), offset);
	IAnimation@ upperRightArmAnim = Offset(Duration(CompositeAnimation()
		.Add(Repeat(Offset(DanceUpperArmAnimation(), 0.5f), 2))
		.Add(Lerp(Offset(DanceUpperArmAnimation(), 0.5f), Offset(DanceUpperArmAnimation2(), 0.5f), EaseInOut(), transition))
		.Add(Repeat(Offset(DanceUpperArmAnimation2(), 0.5f), 2))
		.Add(Lerp(Offset(DanceUpperArmAnimation2(), 0.5f), Offset(DanceUpperArmAnimation(), 0.5f), EaseInOut(), transition)),
		DanceBodyAnimation().getDuration() * 4), offset);
	IAnimation@ lowerLeftArmAnim = Offset(Duration(CompositeAnimation()
		.Add(Repeat(DanceLowerArmAnimation(), 2))
		.Add(Lerp(DanceLowerArmAnimation(), DanceLowerArmAnimation2(), EaseInOut(), transition))
		.Add(Repeat(DanceLowerArmAnimation2(), 2))
		.Add(Lerp(DanceLowerArmAnimation2(), DanceLowerArmAnimation(), EaseInOut(), transition)),
		DanceBodyAnimation().getDuration() * 4), offset);
	IAnimation@ lowerRightArmAnim = Offset(Duration(CompositeAnimation()
		.Add(Repeat(Offset(DanceLowerArmAnimation(), 0.5f), 2))
		.Add(Lerp(Offset(DanceLowerArmAnimation(), 0.5f), Offset(DanceLowerArmAnimation2(), 0.5f), EaseInOut(), transition))
		.Add(Repeat(Offset(DanceLowerArmAnimation2(), 0.5f), 2))
		.Add(Lerp(Offset(DanceLowerArmAnimation2(), 0.5f), Offset(DanceLowerArmAnimation(), 0.5f), EaseInOut(), transition)),
		DanceBodyAnimation().getDuration() * 4), offset);

	Animator bodyAnimator(body);
	Animator headAnimator(head);
	Animator upperLeftArmAnimator(upperLeftArm);
	Animator lowerLeftArmAnimator(lowerLeftArm);
	Animator upperRightArmAnimator(upperRightArm);
	Animator lowerRightArmAnimator(lowerRightArm);
	Animator upperLeftLegAnimator(upperLeftLeg);
	Animator lowerLeftLegAnimator(lowerLeftLeg);
	Animator upperRightLegAnimator(upperRightLeg);
	Animator lowerRightLegAnimator(lowerRightLeg);

	lowerChoreographer.Register("run", bodyAnimator, BodyRunAnimation());
	upperChoreographer.Register("run", headAnimator, HeadRunAnimation());
	upperChoreographer.Register("run", upperLeftArmAnimator, UpperLeftArmRunAnimation());
	upperChoreographer.Register("run", lowerLeftArmAnimator, LowerLeftArmRunAnimation());
	upperChoreographer.Register("run", upperRightArmAnimator, UpperRightArmRunAnimation());
	upperChoreographer.Register("run", lowerRightArmAnimator, LowerRightArmRunAnimation());
	lowerChoreographer.Register("run", upperLeftLegAnimator, UpperLeftLegRunAnimation());
	lowerChoreographer.Register("run", lowerLeftLegAnimator, LowerLeftLegRunAnimation());
	lowerChoreographer.Register("run", upperRightLegAnimator, UpperRightLegRunAnimation());
	lowerChoreographer.Register("run", lowerRightLegAnimator, LowerRightLegRunAnimation());

	lowerChoreographer.Register("crouch", bodyAnimator, BodyCrouchAnimation());
	lowerChoreographer.Register("crouch", upperLeftLegAnimator, UpperLeftLegCrouchAnimation());
	lowerChoreographer.Register("crouch", lowerLeftLegAnimator, LowerLeftLegCrouchAnimation());
	lowerChoreographer.Register("crouch", upperRightLegAnimator, UpperRightLegCrouchAnimation());
	lowerChoreographer.Register("crouch", lowerRightLegAnimator, LowerRightLegCrouchAnimation());

	upperChoreographer.Register("gun_hold", headAnimator, DefaultAnimation());
	upperChoreographer.Register("gun_hold", upperLeftArmAnimator, UpperLeftArmGunHoldAnimation());
	upperChoreographer.Register("gun_hold", lowerLeftArmAnimator, LowerLeftArmGunHoldAnimation());
	upperChoreographer.Register("gun_hold", upperRightArmAnimator, UpperRightArmGunHoldAnimation());
	upperChoreographer.Register("gun_hold", lowerRightArmAnimator, LowerRightArmGunHoldAnimation());

	upperChoreographer.Register("gun_aim", headAnimator, DefaultAnimation());
	upperChoreographer.Register("gun_aim", upperLeftArmAnimator, UpperLeftArmGunAimAnimation());
	upperChoreographer.Register("gun_aim", lowerLeftArmAnimator, LowerLeftArmGunAimAnimation());
	upperChoreographer.Register("gun_aim", upperRightArmAnimator, UpperRightArmGunAimAnimation());
	upperChoreographer.Register("gun_aim", lowerRightArmAnimator, LowerRightArmGunAimAnimation());

	lowerChoreographer.Register("dance", bodyAnimator, DanceBodyAnimation());
	upperChoreographer.Register("dance", headAnimator, DanceHeadAnimation());
	upperChoreographer.Register("dance", upperLeftArmAnimator, upperLeftArmAnim);
	upperChoreographer.Register("dance", lowerLeftArmAnimator, lowerLeftArmAnim);
	upperChoreographer.Register("dance", upperRightArmAnimator, upperRightArmAnim);
	upperChoreographer.Register("dance", lowerRightArmAnimator, lowerRightArmAnim);
	lowerChoreographer.Register("dance", upperLeftLegAnimator, DanceUpperLegAnimation(2));
	lowerChoreographer.Register("dance", lowerLeftLegAnimator, DanceLowerLegAnimation());
	lowerChoreographer.Register("dance", upperRightLegAnimator, DanceUpperLegAnimation(-2));
	lowerChoreographer.Register("dance", lowerRightLegAnimator, DanceLowerLegAnimation());

	upperChoreographer.Transition("dance");
	lowerChoreographer.Transition("dance");
}

void onTick(CRules@ this)
{
	// if (getControls().isKeyPressed(KEY_KEY_2))
	// {
	// 	upperChoreographer.Transition("gun_aim");
	// 	lowerChoreographer.Transition("crouch");
	// }
	// else if (getControls().isKeyPressed(KEY_KEY_1))
	// {
	// 	upperChoreographer.Transition("gun_hold");
	// 	lowerChoreographer.Transition("run");
	// }
	// else
	// {
	// 	upperChoreographer.Transition("run");
	// 	lowerChoreographer.Transition("run");
	// }
}

void Render(int id)
{
	Render::SetAlphaBlend(false);
	Render::SetZBuffer(true, true);
	Render::SetBackfaceCull(false);
	Render::ClearZ();

	float t = Interpolation::getGameTime();

	camera.Render();
	upperChoreographer.Animate(t);
	lowerChoreographer.Animate(t);
	model.Render();
}
