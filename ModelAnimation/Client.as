#include "Utilities.as"
#include "Camera.as"
#include "Model.as"
#include "Animator.as"
#include "Choreographer.as"
#include "IAnimation.as"
#include "DefaultAnimation.as"
#include "IdentityAnimation.as"
#include "RunAnimation.as"
#include "CrouchAnimation.as"
#include "GunHoldAnimation.as"
#include "GunAimAnimation.as"
#include "CompositeModel.as"
#include "CompositeAnimation.as"
#include "Loop.as"
#include "Rate.as"
#include "Wait.as"

#define CLIENT_ONLY

Camera@ camera;
CompositeModel@ model;
Choreographer@ upperChoreographer;
Choreographer@ lowerChoreographer;

void onInit(CRules@ this)
{
	Render::addScript(Render::layer_prehud, "Client.as", "Render", 0);

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
	upperRightArm.SetTranslation(Vec3f(0.25f, 0.75f, 0));
	lowerRightArm.SetTranslation(Vec3f(0.125f, -0.375f, -0.125f));
	lowerLeftLeg.SetTranslation(Vec3f(-0.125f, -0.375f, 0.125f));
	lowerRightLeg.SetTranslation(Vec3f(0.125f, -0.375f, 0.125f));

	// Animate
	@upperChoreographer = Choreographer();
	@lowerChoreographer = Choreographer();

	IAnimation@ anim = CompositeAnimation()
		.Add(Loop(BodyRunAnimation(), 1))
		.Add(Wait(0.5f))
		.Add(Rate(BodyRunAnimation(), -2.0f));

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

	lowerChoreographer.Register("default", bodyAnimator, DefaultAnimation());
	upperChoreographer.Register("default", headAnimator, DefaultAnimation());
	upperChoreographer.Register("default", upperLeftArmAnimator, DefaultAnimation());
	upperChoreographer.Register("default", lowerLeftArmAnimator, DefaultAnimation());
	upperChoreographer.Register("default", upperRightArmAnimator, DefaultAnimation());
	upperChoreographer.Register("default", lowerRightArmAnimator, DefaultAnimation());
	lowerChoreographer.Register("default", upperLeftLegAnimator, DefaultAnimation());
	lowerChoreographer.Register("default", lowerLeftLegAnimator, DefaultAnimation());
	lowerChoreographer.Register("default", upperRightLegAnimator, DefaultAnimation());
	lowerChoreographer.Register("default", lowerRightLegAnimator, DefaultAnimation());

	lowerChoreographer.Register("run", bodyAnimator, anim);
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

	upperChoreographer.Transition("run");
	lowerChoreographer.Transition("run");
}

void onTick(CRules@ this)
{
	if (getControls().isKeyPressed(KEY_KEY_2))
	{
		upperChoreographer.Transition("gun_aim");
		lowerChoreographer.Transition("crouch");
	}
	else if (getControls().isKeyPressed(KEY_KEY_1))
	{
		upperChoreographer.Transition("gun_hold");
		lowerChoreographer.Transition("run");
	}
	else
	{
		upperChoreographer.Transition("run");
		lowerChoreographer.Transition("run");
	}
}

void Render(int id)
{
	Render::SetAlphaBlend(false);
	Render::SetZBuffer(true, true);
	Render::SetBackfaceCull(false);
	Render::ClearZ();

	float t = getControls().getInterpMouseScreenPos().y / getScreenHeight();

	camera.Render();
	upperChoreographer.Animate(t);
	lowerChoreographer.Animate(t);
	model.Render();
}
