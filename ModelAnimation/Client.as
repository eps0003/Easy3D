#include "Utilities.as"
#include "Camera.as"
#include "Model.as"
#include "Animator.as"
#include "IAnimation.as"
#include "TestAnimation.as"
#include "CompositeModel.as"

#define CLIENT_ONLY

Camera@ camera;
CompositeModel@ model;
Animator@ animator;

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
	body.SetTranslation(Vec3f(0, 0.75f, 2.0f));
	body.SetRotation(Quaternion().SetFromEulerDegrees(0, 180, 0));
	head.SetTranslation(Vec3f(0, 0.75f, 0));
	upperLeftArm.SetTranslation(Vec3f(-0.25f, 0.75f, 0));
	lowerLeftArm.SetTranslation(Vec3f(-0.125f, -0.375f, -0.125f));
	upperRightArm.SetTranslation(Vec3f(0.25f, 0.75f, 0));
	lowerRightArm.SetTranslation(Vec3f(0.125f, -0.375f, -0.125f));
	lowerLeftLeg.SetTranslation(Vec3f(-0.125f, -0.375f, 0.125f));
	lowerRightLeg.SetTranslation(Vec3f(0.125f, -0.375f, 0.125f));

	// Animate
	@animator = Animator(body);
	animator.Register("test1", TestAnimation1(body));
	animator.Register("test2", TestAnimation2(body));
	animator.Transition("test1");
}

void onTick(CRules@ this)
{
	if (getControls().isKeyPressed(KEY_SPACE))
	{
		animator.Transition("test2");
	}
	else
	{
		animator.Transition("test1", 0);
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
	animator.Animate();
	model.Render();
}
