shared class Model
{
	private SMesh mesh;
	private string texture;

	private Vec3f translation;
	private Quaternion rotation;
	private Vec3f scale = Vec3f(1);

	Model(string modelPath, string texture)
	{
		mesh.LoadObjIntoMesh(modelPath);
		SetMaterial(texture);
	}

	private void SetMaterial(string texture)
	{
		if (this.texture == texture) return;

		this.texture = texture;

		SMaterial material;
		material.AddTexture(texture);
		material.SetFlag(SMaterial::LIGHTING, false);
		material.SetFlag(SMaterial::BILINEAR_FILTER, false);
		material.SetFlag(SMaterial::BACK_FACE_CULLING, false);
		material.SetFlag(SMaterial::FOG_ENABLE, true);
		material.SetMaterialType(SMaterial::TRANSPARENT_ALPHA_CHANNEL_REF);
		mesh.SetMaterial(material);
	}

	void SetTranslation(Vec3f translation)
	{
		this.translation = translation;
	}

	void SetRotation(Quaternion rotation)
	{
		this.rotation = rotation;
	}

	void SetScale(Vec3f scale)
	{
		this.scale = scale;
	}

	void SetTexture(string texture)
	{
		SetMaterial(texture);
	}

	void Render()
	{
		CMatrix positionMatrix;
		positionMatrix.SetTranslation(translation);

		CMatrix rotationMatrix;
		rotationMatrix.SetRotationRadians(-rotation.toEulerRadians());

		CMatrix scaleMatrix;
		scaleMatrix.SetScale(scale);

		CMatrix matrix = positionMatrix * scaleMatrix * rotationMatrix;
		Render::SetModelTransform(matrix.toArray());

		mesh.RenderMeshWithMaterial();
	}
}
