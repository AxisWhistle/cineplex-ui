package edu.nju.cineplex.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.cineplex.model.Movie;
import edu.nju.cineplex.service.MovieService;
import edu.nju.cineplex.vo.MovieInfo;

public class MovieAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	@Autowired
	private MovieService movieService;
	private Movie movie=new Movie();
	private File image;
	private String imageContentType;
    // 封装上传文件名的属性
	private String imageFileName;
    // 接受依赖注入的属性
	private String savePath;
	
	private String name;
	
	public String addMovie(){
		System.out.println(movie.getOffTime());
		String cover= this.uploadCover();
		if(cover!=null)
			movie.setCover(cover);
		movieService.addMovie(movie);
		//System.out.println(movie.getCover());
		
		return SUCCESS;
	}
	
	public String search(){
		List<MovieInfo> movieInfos=(List<MovieInfo>) session.get("movielist");
		List<MovieInfo> forwardInfos=(List<MovieInfo>) session.get("forwardlist");
		List<MovieInfo> searchInfos=new ArrayList<MovieInfo>();
		for(int i =0;i<movieInfos.size();i++){
			if(movieInfos.get(i).getName().contains(name)){
				searchInfos.add(movieInfos.get(i));
			}
		}
		for(int i =0;i<forwardInfos.size();i++){
			if(forwardInfos.get(i).getName().contains(name)){
				searchInfos.add(forwardInfos.get(i));
			}
		}
		session.put("searchlist", searchInfos);
		return SUCCESS;
	}
	
	private String uploadCover(){
		String result=null;
		if(image!=null){
		 FileOutputStream fos = null;
	     FileInputStream fis = null;
	        try {
	            // 建立文件输出流
	            //System.out.println(getSavePath());
	        	String realPath=context.getRealPath("/"+savePath);
	        	String type[] = imageContentType.split("/");
	        	int id=movieService.getMaxId()+1;
	        	setImageFileName(id+"."+type[1]);
	            fos = new FileOutputStream(realPath + "\\" + getImageFileName());
	            // 建立文件上传流
	            fis = new FileInputStream(getImage());
	            byte[] buffer = new byte[1024];
	            int len = 0;
	            while ((len = fis.read(buffer)) > 0) {
	                fos.write(buffer, 0, len);
	            }
	            //System.out.println(fos.getFD().toString());
	            result=getSavePath() + "/" + getImageFileName();
	        } catch (Exception e) {
	            System.out.println("文件上传失败");
	            e.printStackTrace();
	            
	        } finally {
	            close(fos, fis);
	        }
		}
	        return result;
	}
	
	  private void close(FileOutputStream fos, FileInputStream fis) {
	        if (fis != null) {
	            try {
	                fis.close();
	            } catch (IOException e) {
	                System.out.println("FileInputStream关闭失败");
	                e.printStackTrace();
	            }
	        }
	        if (fos != null) {
	            try {
	                fos.close();
	            } catch (IOException e) {
	                System.out.println("FileOutputStream关闭失败");
	                e.printStackTrace();
	            }
	        }
	    }

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

}
