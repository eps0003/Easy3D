#include "Utilities.as"
#include "Camera.as"
#include "Model.as"
#include "Animator.as"
#include "IAnimation.as"
#include "IdentityAnimation.as"
#include "RunAnimation.as"
#include "CompositeModel.as"

#define CLIENT_ONLY

Camera@ camera;
CompositeModel@ model;
Animator@ bodyAnimator;
Animator@ headAnimator;
Animator@ upperLeftArmAnimator;
Animator@ lowerLeftArmAnimator;
Animator@ upperRightArmAnimator;
Animator@ lowerRightArmAnimator;
Animator@ upperLeftLegAnimator;
Animator@ lowerLeftLegAnimator;
Animator@ upperRightLegAnimator;
Animator@ lowerRightLegAnimator;

void onInit(CRules@ this)
{
	GUI::SetFont("menu");
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
	body.SetTranslation(Vec3f(0, -0.375, 2.0f));
	body.SetRotation(Quaternion().SetFromEulerDegrees(0, 225, 0));
	head.SetTranslation(Vec3f(0, 0.75f, 0));
	upperLeftArm.SetTranslation(Vec3f(-0.25f, 0.75f, 0));
	lowerLeftArm.SetTranslation(Vec3f(-0.125f, -0.375f, -0.125f));
	upperRightArm.SetTranslation(Vec3f(0.25f, 0.75f, 0));
	lowerRightArm.SetTranslation(Vec3f(0.125f, -0.375f, -0.125f));
	lowerLeftLeg.SetTranslation(Vec3f(-0.125f, -0.375f, 0.125f));
	lowerRightLeg.SetTranslation(Vec3f(0.125f, -0.375f, 0.125f));

	// Animate
	@bodyAnimator = Animator(body);
	@headAnimator = Animator(head);
	@upperLeftArmAnimator = Animator(upperLeftArm);
	@lowerLeftArmAnimator = Animator(lowerLeftArm);
	@upperRightArmAnimator = Animator(upperRightArm);
	@lowerRightArmAnimator = Animator(lowerRightArm);
	@upperLeftLegAnimator = Animator(upperLeftLeg);
	@lowerLeftLegAnimator = Animator(lowerLeftLeg);
	@upperRightLegAnimator = Animator(upperRightLeg);
	@lowerRightLegAnimator = Animator(lowerRightLeg);

	bodyAnimator.Register("run", BodyRunAnimation());
	headAnimator.Register("run", HeadRunAnimation());
	upperLeftArmAnimator.Register("run", UpperLeftArmRunAnimation());
	lowerLeftArmAnimator.Register("run", LowerLeftArmRunAnimation());
	upperRightArmAnimator.Register("run", UpperRightArmRunAnimation());
	lowerRightArmAnimator.Register("run", LowerRightArmRunAnimation());
	upperLeftLegAnimator.Register("run", UpperLeftLegRunAnimation());
	lowerLeftLegAnimator.Register("run", LowerLeftLegRunAnimation());
	upperRightLegAnimator.Register("run", UpperRightLegRunAnimation());
	lowerRightLegAnimator.Register("run", LowerRightLegRunAnimation());

	bodyAnimator.Register("freeze", IdentityAnimation());
	headAnimator.Register("freeze", IdentityAnimation());
	upperLeftArmAnimator.Register("freeze", IdentityAnimation());
	lowerLeftArmAnimator.Register("freeze", IdentityAnimation());
	upperRightArmAnimator.Register("freeze", IdentityAnimation());
	lowerRightArmAnimator.Register("freeze", IdentityAnimation());
	upperLeftLegAnimator.Register("freeze", IdentityAnimation());
	lowerLeftLegAnimator.Register("freeze", IdentityAnimation());
	upperRightLegAnimator.Register("freeze", IdentityAnimation());
	lowerRightLegAnimator.Register("freeze", IdentityAnimation());

	bodyAnimator.Transition("run");
	headAnimator.Transition("run");
	upperLeftArmAnimator.Transition("run");
	lowerLeftArmAnimator.Transition("run");
	upperRightArmAnimator.Transition("run");
	lowerRightArmAnimator.Transition("run");
	upperLeftLegAnimator.Transition("run");
	lowerLeftLegAnimator.Transition("run");
	upperRightLegAnimator.Transition("run");
	lowerRightLegAnimator.Transition("run");
}

void onTick(CRules@ this)
{
	if (getControls().isKeyPressed(KEY_SPACE))
	{
		bodyAnimator.Transition("freeze");
		headAnimator.Transition("freeze");
		upperLeftArmAnimator.Transition("freeze");
		lowerLeftArmAnimator.Transition("freeze");
		upperRightArmAnimator.Transition("freeze");
		lowerRightArmAnimator.Transition("freeze");
		upperLeftLegAnimator.Transition("freeze");
		lowerLeftLegAnimator.Transition("freeze");
		upperRightLegAnimator.Transition("freeze");
		lowerRightLegAnimator.Transition("freeze");
	}
	else
	{
		bodyAnimator.Transition("run");
		headAnimator.Transition("run");
		upperLeftArmAnimator.Transition("run");
		lowerLeftArmAnimator.Transition("run");
		upperRightArmAnimator.Transition("run");
		lowerRightArmAnimator.Transition("run");
		upperLeftLegAnimator.Transition("run");
		lowerLeftLegAnimator.Transition("run");
		upperRightLegAnimator.Transition("run");
		lowerRightLegAnimator.Transition("run");
	}
}

void onRender(CRules@ this)
{
	uint w = getScreenWidth();
	uint h = getScreenHeight();

	GUI::DrawRectangle(Vec2f(0, h * 0.5f - 1), Vec2f(w, h * 0.5f + 1), color_white);
	GUI::DrawRectangle(Vec2f(w * 0.5f - 1, 0), Vec2f(w * 0.5f + 1, h), color_white);

	GUI::DrawText("Position: " + camera.getPosition().toString(), Vec2f(10, 10), color_white);
}

void Render(int id)
{
	Render::SetAlphaBlend(false);
	Render::SetZBuffer(true, true);
	Render::SetBackfaceCull(false);
	Render::ClearZ();

	camera.Render();

	bodyAnimator.Animate();
	headAnimator.Animate();
	upperLeftArmAnimator.Animate();
	lowerLeftArmAnimator.Animate();
	upperRightArmAnimator.Animate();
	lowerRightArmAnimator.Animate();
	upperLeftLegAnimator.Animate();
	lowerLeftLegAnimator.Animate();
	upperRightLegAnimator.Animate();
	lowerRightLegAnimator.Animate();

	model.Render();
}
