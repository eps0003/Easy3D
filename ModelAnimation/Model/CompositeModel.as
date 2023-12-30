shared class CompositeModel
{
	private Model@ model;
	private CompositeModel@[] children;

	CompositeModel(Model@ model)
	{
		@this.model = model;
	}

	CompositeModel@ Append(CompositeModel@ model)
	{
		children.push_back(model);
		return this;
	}

	void Render(CMatrix matrix = CMatrix())
	{
		model.Render(matrix);

		CMatrix newMatrix = model.getMatrix();
		for (uint i = 0; i < children.size(); i++)
		{
			children[i].Render(newMatrix);
		}
	}
}
