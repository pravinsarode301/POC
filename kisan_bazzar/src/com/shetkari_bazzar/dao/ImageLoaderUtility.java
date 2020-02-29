/**
 * 
 */
package com.shetkari_bazzar.dao;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

/**
 * @author pravtej
 *
 */
public class ImageLoaderUtility {

	public static String imageHtmlLoader(String str) {
		String b64 = null;
		if (str != null) {

			// System.out.println("str before " + str);
			str = str.replace("\\", "/");
			// System.out.println("string after " + str);

			try {
				File f = new File(str);
				BufferedImage bImage = ImageIO.read(f);// give the path of an
														// image
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				ImageIO.write(bImage, "jpg", baos);
				baos.flush();
				byte[] imageInByteArray = baos.toByteArray();
				baos.close();
				b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);

			} catch (IOException e) {

			} 
			return b64;
		} else {

			return b64;
		}
	}

}
