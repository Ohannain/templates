{
  outputs = {self}: {
    templates = {
      go = {
        path = ./go;
        description = "Go development environment";
      };
    };
  };
}
