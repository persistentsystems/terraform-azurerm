# Building on Hello World

This terraform directory, shows how to build on HelloWorld.  In that
module we created the basic infrastructure to build more services on 
top of.  In keeping this simple, this demo doesn't provide any real
function, but instead just shows the conventions of taking the outputs
from the foundation modules and using them to create more interesting
infrastructure.  In this case , we build an Azure KeyVault in the 
resource group that Hello World creates.

In this case we are using Hello World example as a module, and then 
building more on top of it.  In the real world, you would build the 
base infrastructure in one project, and then import the state into 
another project.  That step requires setting up remote state, and 
would make these demos harder to read and execute.  

