package com.veracode.verademo.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@Scope("request")
public class FaceScanController {
    private static final Logger logger = LogManager.getLogger("VeraDemo:FaceScanController");

    // WWE 2K26 face scan image requirements
    private static final long MAX_FILE_SIZE_BYTES = 5 * 1024 * 1024; // 5 MB
    private static final int MIN_WIDTH = 512;
    private static final int MIN_HEIGHT = 512;

    @Autowired
    ServletContext context;

    @RequestMapping(value = "/facescan", method = RequestMethod.GET)
    public String showFaceScan(HttpServletRequest request, HttpServletResponse response, Model model) {
        logger.info("Entering showFaceScan");

        String sessionUsername = (String) request.getSession().getAttribute("username");
        if (sessionUsername == null) {
            logger.info("User is not logged in - redirecting...");
            return "redirect:login?target=facescan";
        }

        model.addAttribute("username", sessionUsername);
        return "face-scan";
    }

    @RequestMapping(value = "/facescan", method = RequestMethod.POST)
    public String processFaceScan(
            @RequestParam(value = "faceImage", required = false) MultipartFile faceImage,
            HttpServletRequest request,
            HttpServletResponse response,
            Model model) {
        logger.info("Entering processFaceScan");

        String sessionUsername = (String) request.getSession().getAttribute("username");
        if (sessionUsername == null) {
            logger.info("User is not logged in - redirecting...");
            return "redirect:login?target=facescan";
        }

        model.addAttribute("username", sessionUsername);

        if (faceImage == null || faceImage.isEmpty()) {
            model.addAttribute("error", "Please select an image file to upload.");
            return "face-scan";
        }

        String originalFilename = faceImage.getOriginalFilename();
        if (originalFilename == null || originalFilename.isEmpty()) {
            model.addAttribute("error", "Invalid file name.");
            return "face-scan";
        }

        // Validate file extension
        String lowerName = originalFilename.toLowerCase();
        if (!lowerName.endsWith(".jpg") && !lowerName.endsWith(".jpeg") && !lowerName.endsWith(".png")) {
            model.addAttribute("error", "Invalid file type. WWE 2K26 face scan requires a JPG or PNG image.");
            return "face-scan";
        }

        // Validate file size
        if (faceImage.getSize() > MAX_FILE_SIZE_BYTES) {
            model.addAttribute("error", "File too large. Maximum allowed size is 5 MB.");
            return "face-scan";
        }

        // Save the uploaded face scan image
        try {
            String uploadDir = context.getRealPath("/resources/images/facescans") + File.separator;
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String extension = originalFilename.substring(originalFilename.lastIndexOf('.'));
            String savedFileName = sessionUsername + "_facescan" + extension;
            File dest = new File(uploadDir + savedFileName);

            faceImage.transferTo(dest);
            logger.info("Face scan image saved: " + dest.getAbsolutePath());

            model.addAttribute("successMessage", "Face scan image uploaded successfully! Your image has been saved as: " + savedFileName);
            model.addAttribute("uploadedImage", "resources/images/facescans/" + savedFileName);
        } catch (IllegalStateException | IOException ex) {
            logger.error(ex);
            model.addAttribute("error", "An error occurred while saving your image. Please try again.");
        }

        return "face-scan";
    }
}
