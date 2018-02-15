/* copy.c file copying.
 *        a simple version of cp command for cs 232 hw02
 * @author Chan Kim
 * @date 02/13/2018
*/
#define _CRT_SECURE_NO_WARNINGS // prevent strtok error
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

int copy(char *src_name, char *dst_name)
{
    FILE *ptr_src, *ptr_dst;
    int c;

    // check whether source-file exists
    // ex) ./copy Nonexistent_file_or_directory
    if (fopen(src_name, "r") == NULL)
        {
            fprintf(stderr, "copy: cannot start '%s': No such file or directory\n", src_name);
            return -1;
        }
    // check whether destination-file is defined
    // ex) ./copy test.c /home/chan/Sources/    | ./copy test.c /home/chan/Nonexistent_directory/Nonexistent_directory2     
    else if (fopen(dst_name, "w") == NULL)
        {   
            char * src_file;
            char  src_copy[strlen(dst_name)];
            strcpy(src_copy, src_name);
            // check whether src_name is file or directory which is current or not
            // ex) ./copy /home/chan/Sources/test.c /home/chan/Sources2
            if (src_name[0] == '/')
            {
                char * ptr = strtok(src_copy, "/");
                while (ptr != NULL)
                {
                    src_file = ptr;
                    ptr = strtok(NULL, "/");
                }
            }
            // ex) ./copy 02/test.c /home/chan/Sources2            
            else if (src_name[0] != '/')
            {
                char * ptr = strtok(src_copy, "/");
                while (ptr != NULL)
                {
                    src_file = ptr;
                    ptr = strtok(NULL, "/");
                }
            }
            // check whether the directory is exist
            // ex) ./copy test.c /home/chan/Sources2
            //     when the directory Sources2 existes
            if (access(dst_name, F_OK) != -1)
            {
                char end_char = dst_name[strlen(dst_name)-1];
                char dst[strlen(dst_name)+strlen(src_file)+2];
                char src[strlen(src_file)];
                // if the directory exists, check whether the last character of dst_name has '/'
                // ex) two cases    case1 ./copy test.c /home/chan/Sources2/
                //                  case2 ./copy test.c /home/chan/Sources2
                if (end_char != '/')
                {
                    char s[2];
                    strcpy(s, "/");                
                    dst_name = strcat(dst_name, s); // if '/' is not at the end of dst_name, add '/' at the end
                }
                strcpy(dst,dst_name);
                strcpy(src,src_file);
                char * newdst = strcat(dst,src); // put the file name at the end of dst_name

                // check whether the new destination-file exists at the directory
                if (access(newdst, F_OK) != -1)
                {
                    fprintf(stderr, "copy: '%s' and '%s' are the same file\n", src_name, newdst);
                    return -1;
                }
                if ((ptr_src = fopen(src_name, "r")) && (ptr_dst = fopen(newdst, "w")))
                {
                // if the new destination-file does not exist at the location, copy source-file to the given location.
                    while ((c = getc(ptr_src)) != EOF)
                    {
                        fputc(c, ptr_dst);
                        fclose(ptr_dst);
                        fclose(ptr_src);
                    }
                    return 0;
                }
            }
            fprintf(stderr, "copy: cannot create regular file '%s': No such file or directory\n", dst_name);
            return -1;
        }      
    // if everything is correct, copies the contents of src into dest.
    else if ((ptr_src = fopen(src_name, "r") && (ptr_dst = fopen(dst_name, "w"))))
    {
        while ((c = getc(ptr_src)) != EOF)
        {
            fputc(c, ptr_dst);
            fclose(ptr_dst);
            fclose(ptr_src);
        }
        return 0;
    }
    return -1;
}

int main(int argc, char *argv[])
{
    // check whether source-filename is given.
    // ex) ./copy
    if (argc < 2)
    {
        fprintf(stderr, "copy: missing file operand\n");
        return -1;
    }
    // check whetehr destination-filename is given. 
    // ex) ./copy test.c
    else if (argc < 3)
    {
        fprintf(stderr, "copy: missing destination file operand after '%s'\n", argv[1]);
        return -1;
    }
    // check whether destination-file already exists (check whether src and dst are the same)
    // ex) ./copy test.c test.c
    else if ((access(argv[2], F_OK) != -1) && (argv[2][0] != '/'))
    {
        int a;
        // use for loop to check src and dst.
        for (a = 0; a < strlen(argv[2]); a++)
        {   
            // if they are not same, do copy. Otherwise, print the error message.
            if (argv[1][a] != argv[2][a])
            {
                copy(argv[1], argv[2]);
                return 1;
            }
        }
        fprintf(stderr, "copy: '%s' and '%s' are the same file\n", argv[1], argv[2]);
        return -1;
    }    
    else if (copy(argv[1], argv[2]) == -1)
    {   
        return 1;
    }
    return 0;
}