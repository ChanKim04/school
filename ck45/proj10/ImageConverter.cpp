/*
 * ImageConverter.cpp declares a class for
 *  various image conversion operations.
 *
 *  Author:  Joel Adams, CS112 @ Calvin College.
 *  Created: March 2015
 *  Revised: November 2016
 */

#include "ImageConverter.h"
#include <unistd.h>            // sleep()

//-----------------  Method definitions ------------------------------

/* explicit constructor
 *
 * @param imageFileName, a string.
 * @param width, an int.
 * @param height, an int.
 *
 * Precondition: imageFileName contains the name of a valid image file
 *               && width > 0 && height > 0
 * Postcondition: myImageFileName == imageFileName
 *                && myWidth == width && myHeight = height
 *                && width x height Canvas containing the image
 *                    from imageFileName has been displayed on screen.
 */
ImageConverter::ImageConverter(const std::string& imageFileName, int width, int height)
 : myCanvas1(0, 0, width, height, imageFileName),
   myImageFileName(imageFileName),
   myWidth(width),
   myHeight(height)
{
    myCanvas1.start();
    myCanvas1.drawImage(myImageFileName, 0, 0, width, height);
    sleep(1);
}

/* destructor
 *
 * Precondition: this ImageConverter object is going out of scope.
 * Postcondition: myCanvas1 has disappeared from the screen.
 */
ImageConverter::~ImageConverter() {
    myCanvas1.wait();
    cout << "\nImageConverter terminated normally." << endl;
}

/* invertImage() inverts the image from myImageFileName.
 *
 * Precondition: myCanvas1 contains a TSGL Image that is to be inverted
 *               && myWidth contains the number of columns in which to display the image
 *               && myHeight contains the number of rows in which to display the image.
 *
 * Postcondition: a myWidth x myHeight Canvas has been displayed
 *                 containing the inverse of the image from myCanvas1
 *                 (which contains the image from myImageFileName).
 */

void ImageConverter::invertImage() {
    // record starting time
    double startTime = omp_get_wtime();

   Canvas canvas2(myWidth+50, 0, myWidth, myHeight, myImageFileName + " Inverted");
   canvas2.start();

   // loop through the image rows
   #pragma omp parallel for
   for (int row = 0; row < myHeight; row++) {
      // slow the processing to simulate a very large image
      canvas2.sleep();
      // loop through the image columns
      for (int col = 0; col < myWidth; col++) {
         // read the pixel at canvas1[row][col]
         ColorInt pixelColor = myCanvas1.getPixel(row, col);
         // compute its inverse
         int invertedR = 255 - pixelColor.R;
         int invertedG = 255 - pixelColor.G;
         int invertedB = 255 - pixelColor.B;
         // draw the inverse at the same spot in canvas2
         canvas2.drawPixel(row, col, ColorInt(invertedR,invertedG,invertedB) );
      } // inner for
  } // outer for

   // compute and display the time difference
   double totalTime = omp_get_wtime() - startTime;
   cout << "\n\nImage inversion took "
         << totalTime << " seconds.\n" << endl;

   //save converted image
   canvas2.takeScreenShot();
  canvas2.wait();
} // invertImage


void ImageConverter::invertImage2() {

   Canvas canvas3(myWidth+50, 0, myWidth, myHeight, myImageFileName + " Inverted, Chunk-Size 1");
   canvas3.start();

   // launch additional threads
   #pragma omp parallel
   {
      // how many workers do we have?
      unsigned numThreads = omp_get_num_threads();
      // which one am I?
      unsigned id = omp_get_thread_num();

      // loop through the image rows
      for (int row = id; row < myHeight; row += numThreads) {
         // slow the processing to simulate a very large image
         canvas3.sleep();
         // loop through the image columns
         for (int col = 0; col < myWidth; col++) {
            // read the pixel at canvas1[row][col]
            ColorInt pixelColor = myCanvas1.getPixel(row, col);
            // compute its inverse
            int invertedR = 255 - pixelColor.R;
            int invertedG = 255 - pixelColor.G;
            int invertedB = 255 - pixelColor.B;
            // draw the inverse at the same spot in canvas3
            canvas3.drawPixel(row, col, ColorInt(invertedR,invertedG,invertedB) );
         } // inner for
      } // outer for
   } // #pragma omp parallel

   canvas3.wait();
} // invertImage2

void ImageConverter::invertImage3() {

   Canvas canvas4(myWidth+50, 0, myWidth, myHeight, myImageFileName + " Inverted, Equal-Sized Chunks ");
   canvas4.start();

   // launch additional threads
   #pragma omp parallel
   {
      // how many workers do we have?
      unsigned numThreads = omp_get_num_threads();
      // which one am I?
      unsigned id = omp_get_thread_num();

      // compute size of chunks (iterations % numThreads may != 0)
      double iterations = myHeight;
      unsigned chunkSize = (unsigned)ceil(iterations / numThreads);

      // compute starting and stopping index values
      int start = id * chunkSize;
      int stop = 0;
      if (id < numThreads-1) {
          stop = start + chunkSize;
      } else {
          stop = myHeight;
      }

      // loop through image rows in equal-sized chunks
      for (int row = start; row < stop; row++) {
         // slow the processing to simulate a very large image
         canvas4.sleep();
         // loop through the image columns
         for (int col = 0; col < myWidth; col++) {
            // read the pixel at canvas1[row][col]
            ColorInt pixelColor = myCanvas1.getPixel(row, col);
            // compute its inverse
            int invertedR = 255 - pixelColor.R;
            int invertedG = 255 - pixelColor.G;
            int invertedB = 255 - pixelColor.B;
            // draw the inverse at the same spot in canvas4
            canvas4.drawPixel(row, col, ColorInt(invertedR,invertedG,invertedB) );
         } // inner for
      } // outer for
   } // #pragma omp parallel

   canvas4.wait();
} // invertImage3

/* Author:  Chan Kim (ck45)
 * Created: 5/8/2017
 * grayscaleImage() converts the image from myImageFileName to grayscale.
 *
 * Precondition: myCanvas5 contains a TSGL Image that is to be converted to grayscale
 *               && myWidth contains the number of columns in which to display the image
 *               && myHeight contains the number of rows in which to display the image.
 *
 * Postcondition: a myWidth x myHeight Canvas has been displayed
 *                 containing the converted image to grayscale from myCanvas1
 *                 (which contains the image from myImageFileName).
 */

void ImageConverter::grayscaleImage() {
    // record starting time
    double startTime = omp_get_wtime();

   Canvas canvas5(myWidth+50, 0, myWidth, myHeight, myImageFileName + " Inverted, Equal-Sized Chunks ");
   canvas5.start();

   // launch additional threads
   #pragma omp parallel
   {
      // how many workers do we have?
      unsigned numThreads = omp_get_num_threads();
      // which one am I?
      unsigned id = omp_get_thread_num();

      // compute size of chunks (iterations % numThreads may != 0)
      double iterations = myHeight;
      unsigned chunkSize = (unsigned)ceil(iterations / numThreads);

      // compute starting and stopping index values
      int start = id * chunkSize;
      int stop = 0;
      if (id < numThreads-1) {
          stop = start + chunkSize;
      } else {
          stop = myHeight;
      }

      // loop through image rows in equal-sized chunks
      for (int row = start; row < stop; row++) {
         // slow the processing to simulate a very large image
         canvas5.sleep();
         // loop through the image columns
         for (int col = 0; col < myWidth; col++) {
            // read the pixel at canvas1[row][col]
            ColorInt pixelColor = myCanvas1.getPixel(row, col);
            // compute its gray scale
            int intensity = pixelColor.R + pixelColor.G + pixelColor.B/3;
            // draw the gray scale at the same spot in canvas5
            canvas5.drawPixel(row, col, ColorInt(intensity,intensity,intensity) );
         } // inner for
      } // outer for
   } // #pragma omp parallel

   // compute and display the time difference
   double totalTime = omp_get_wtime() - startTime;
   cout << "\n\nImage inversion took "
         << totalTime << " seconds.\n" << endl;

   //save converted image
   canvas5.takeScreenShot();
   canvas5.wait();
} // grayscale

/* Author:  Chan Kim (ck45)
 * Created: 5/8/2017
 * mirrorImage() mirroring the image from myImageFileName.
 *
 * Precondition: myCanvas6 contains a TSGL Image that is to be mirrored
 *               && myWidth contains the number of columns in which to display the image
 *               && myHeight contains the number of rows in which to display the image.
 *
 * Postcondition: a myWidth x myHeight Canvas has been displayed
 *                 containing the mirroring of the image from myCanvas6
 *                 (which contains the image from myImageFileName).
 */

void ImageConverter::mirrorImage() {
    // record starting time
    double startTime = omp_get_wtime();

   Canvas canvas6(myWidth+50, 0, myWidth, myHeight, myImageFileName + " Inverted, Equal-Sized Chunks ");
   canvas6.start();

   // launch additional threads
   #pragma omp parallel
   {
      // how many workers do we have?
      unsigned numThreads = omp_get_num_threads();
      // which one am I?
      unsigned id = omp_get_thread_num();

      // compute size of chunks (iterations % numThreads may != 0)
      double iterations = myHeight;
      unsigned chunkSize = (unsigned)ceil(iterations / numThreads);

      // compute starting, stopping index values and the mirror point
      int mirrorPoint = myWidth/2;
      int start = id * chunkSize;
      int stop = 0;
      if (id < numThreads-1) {
          stop = start + chunkSize;
      } else {
          stop = myHeight;
      }

      // loop through image rows in equal-sized chunks
      for (int row = start; row < stop; row++) {
         // slow the processing to simulate a very large image
         canvas6.sleep();
         // loop through the image columns until the mirror point
         for (int col = 0; col < mirrorPoint; col++) {
            // read the left pixel at canvas1[row][mirrorPoint - col] for mirroring
            ColorInt leftPixel = myCanvas1.getPixel(row, mirrorPoint - col);
            // draw the mirror at the same spot in canvas6
            canvas6.drawPixel(row, mirrorPoint - col, ColorInt(leftPixel) );
            canvas6.drawPixel(row, mirrorPoint + col, ColorInt(leftPixel) );

         } // inner for
      } // outer for
   } // #pragma omp parallel

   // compute and display the time difference
   double totalTime = omp_get_wtime() - startTime;
   cout << "\n\nImage inversion took "
         << totalTime << " seconds.\n" << endl;

   //save converted image
   canvas6.takeScreenShot();
   canvas6.wait();
} // mirror
