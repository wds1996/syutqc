package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Download;

public interface DownloadMapper {
	int addDownload(Download download);
	List<Download> findAll();
	int deleteDownload(String id);
	Download selectDownload(String id);
	int updateDownload(Download download);
	List<Download> getNew();
	List<Download> keywordSearch(String name);
}
