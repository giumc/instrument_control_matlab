function deleteM(obj)

%Closes and deletes the interface objects.
    fclose(obj.osc.interfObj);
    delete(obj.osc.interfObj);
    fclose(obj.tek.interfObj);
    delete(obj.tek.interfObj);
    fclose(obj.mod.interfObj);
    delete(obj.mod.interfObj);
    delete(obj);
end