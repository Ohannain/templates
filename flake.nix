{
  outputs = {self}: {
    templates = {
      go = {
        path = ./go;
        description = "Go development environment";
      };
      vite = {
        path = ./vite;
        description = "Vite development environment";
      };
    };
  };
}
