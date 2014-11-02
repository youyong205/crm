package com.resource;

import java.util.List;

public interface ResourceService {

	public int deleteResource(int id);

	public Resource findByPK(int id);

	public int insertResource(Resource resource);

	public int queryAllSize();

	public List<Resource> queryLimitedResources(int start, int size);

	public int updateResource(Resource resource);

}
