/*
 * =====================================================================================
 *
 *       Filename:  read_ikey.c
 *
 *    Description:  this is a pli module to read the input key 
 *
 *        Version:  1.0
 *        Created:  07/10/2008 09:18:10 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  mengxipeng@gmail.com
 *        Company:  mengxipeng
 *
 * =====================================================================================
 */

#include <string.h>
#include <vpi_user.h>


char  data[120];

static int read_data(char *fn)
{
        vpiHandle    systf_handle;
        vpiHandle    arg_itr;
        vpiHandle    arg_handle;
        s_vpi_value  value_s;

        FILE        *fp;
        FILE        *fp1;
        char         str[120];
        int          i;
        int          n;

        systf_handle = vpi_handle(vpiSysTfCall, NULL);
        arg_itr = vpi_iterate(vpiArgument, systf_handle);
        if (arg_itr == NULL) 
        {
                vpi_printf("ERROR: $pow failed to obtain systf arg handles\n");
                return(0);
        }

        /* read file name */
        arg_handle = vpi_scan(arg_itr);
        value_s.format = vpiStringVal;
        vpi_get_value(arg_handle, &value_s);
        strcpy(str,value_s.value.str);

        fp=fopen(str,"r");
        if(fp)
        {
                fscanf(fp,"%s",&data);
                value_s.format = vpiBinStrVal;
                value_s.value.str=data;
                arg_handle = vpi_scan(arg_itr);
                vpi_put_value(arg_handle, &value_s,NULL, vpiNoDelay);
                fclose(fp);
        }
        else
        {
                vpi_printf("can't open the input file in %s \n", __FUNCTION__);
        }
        
        return 0;
}

static void read_data_register()
{
        s_vpi_systf_data tf_data;
        tf_data.type      = vpiSysTask;
        tf_data.tfname    = "$read_data";
        tf_data.calltf    = read_data;
        tf_data.compiletf = 0;
        tf_data.sizetf    = 0;
        vpi_register_systf(&tf_data);
}

static int write_data(char *xx)
{
        vpiHandle    systf_handle;
        vpiHandle    arg_itr;
        vpiHandle    arg_handle;
        s_vpi_value  value_s;

        FILE        *fp;
        char         str[120];
        int          i;
        int          n;

        systf_handle = vpi_handle(vpiSysTfCall, NULL);
        arg_itr = vpi_iterate(vpiArgument, systf_handle);
        if (arg_itr == NULL) 
        {
                vpi_printf("ERROR: $pow failed to obtain systf arg handles\n");
                return(0);
        }

        /* read file name */
        arg_handle = vpi_scan(arg_itr);
        value_s.format = vpiStringVal;
        vpi_get_value(arg_handle, &value_s);
        strcpy(str,value_s.value.str);

        arg_handle = vpi_scan(arg_itr);
        value_s.format = vpiStringVal;
        vpi_get_value(arg_handle, &value_s);
        if(!strcmp("a",value_s.value.str))
                fp=fopen(str,"a");
        else
                fp=fopen(str,"w");
        if(fp)
        {
                value_s.format = vpiBinStrVal;
                arg_handle = vpi_scan(arg_itr);
                vpi_get_value(arg_handle, &value_s);
                //fprintf(fp,"%s\n",data);
                fprintf(fp,"%s\n",value_s.value.str);
                fclose(fp);
        }
        else
        {
                vpi_printf("can't open the output file in %s \n", __FUNCTION__);
        }
        
        return 0;
}

static void write_data_register()
{
        s_vpi_systf_data tf_data;
        tf_data.type      = vpiSysTask;
        tf_data.tfname    = "$write_data";
        tf_data.calltf    = write_data;
        tf_data.compiletf = 0;
        tf_data.sizetf    = 0;
        vpi_register_systf(&tf_data);
}

void (*vlog_startup_routines[])() = {
        read_data_register,
        write_data_register,
        0
};

