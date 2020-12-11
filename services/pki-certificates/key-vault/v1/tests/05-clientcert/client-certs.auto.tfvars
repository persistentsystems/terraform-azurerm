# This is setup so I can easily for_each through the list and create
# all the client certs with minimal terraform repetition.
client_certs = {
    # KeyVaultPath  = Certificate common name
    joesmith     = "joesmith@acme.com"
    sallyjones   = "sallyjones@acme.com"
}