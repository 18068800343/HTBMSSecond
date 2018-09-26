package hs.bm.vo;

import java.util.List;

public class EvalTree
{
	private String text;
	private String state;
	private List<EvalTree> children;

	public String getText()
	{
		return text;
	}

	public void setText(String text)
	{
		this.text = text;
	}

	public String getState()
	{
		return state;
	}

	public void setState(String string)
	{
		this.state = string;
	}

	public List<EvalTree> getChildren()
	{
		return children;
	}

	public void setChildren(List<EvalTree> children)
	{
		this.children = children;
	}
}
