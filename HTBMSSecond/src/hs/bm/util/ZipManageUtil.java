package hs.bm.util;

import java.io.File;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Expand;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.types.FileSet;

public class ZipManageUtil {


	/**
	 * 压缩文件夹
	 * 
	 * @author 不想要晴天
	 * @param 要压缩的文件夹
	 *            file
	 * @param 压缩成的文件
	 */
	public static void createZipFile(File file, File zipFile) {
		Project project = new Project();
		Zip zip = new Zip();
		zip.setProject(project);
		zip.setDestFile(zipFile);
		FileSet fileSet = new FileSet();
		fileSet.setProject(project);
		fileSet.setDir(file);
		zip.addFileset(fileSet);
		zip.setEncoding("UTF-8");
		zip.execute();
	}

	/**
	 * 解压zip文件
	 * 
	 * @author 不想要晴天
	 * @param 要解压的文件zipFile
	 * @param 解压到的文件夹
	 *            file
	 */
	public static void openZipFile(File zipFile, File file) {
		Project project = new Project();
		Expand expand = new Expand();
		expand.setProject(project);
		expand.setTaskType("unZip");
		expand.setTaskName("unZip");
		expand.setEncoding("UTF-8");
		expand.setSrc(zipFile);
		expand.setDest(file);
		expand.execute();
	}

}
