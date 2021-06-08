function flag=save_data(path,name,data)

    flag=false;

    full_name=strcat(path,filesep,name);

    save(full_name,'data');
    
    flag=true;
    
end