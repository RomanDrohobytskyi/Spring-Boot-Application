package application.services.impl;

import application.services.FileService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class FileServiceImpl implements FileService {

    @Value("${upload.path}")
    private String uploadPath;
    private String createdFileName;

    public String getUploadPath() {
        return uploadPath != null ? uploadPath : "/D:/uploads";
    }

    @Override
    public String getCreatedFileName() {
        return createdFileName;
    }

    @Override
    public void setCreatedFileName(String createdFileName) {
        this.createdFileName = createdFileName;
    }

    @Override
    public void uploadFile(MultipartFile file){
        try {
            if (file != null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(getUploadPath());
                if (!uploadDir.exists())
                    uploadDir.mkdir();
                String uuidFile = UUID.randomUUID().toString();
                String resultFileName = uuidFile + "." + file.getOriginalFilename();

                file.transferTo(new File(getUploadPath() + "/" + resultFileName));
                setCreatedFileName(resultFileName);
            }
        } catch (IOException e){
            e.printStackTrace();
        }
    }

}