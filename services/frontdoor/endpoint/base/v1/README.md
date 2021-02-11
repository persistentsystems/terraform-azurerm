# Creates an Azure Front Door instance

## Resources Created

[azurerm_frontdoor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/frontdoor):  [API documentation](https://docs.microsoft.com/en-us/rest/api/frontdoorservice/frontdoor/frontdoors/createorupdate)

## Health Probes
Health probes are created with name service_settings.pools[x].name and path service_settings.pools[x].healthprobe_path.
The procotol is "Https" , and the default probe method of 'Get'.  The CLI documentation says that 'Head' is acceptable
but it is not listed in API documentation.


## Inputs
- service_settings
  - name - Name of the Front Door - 'fd-' is prepended to this as per Microsoft Naming Standards.
  - waf_id - The ID of the Web Application Firewall to attach to this front door.
  - pools - A list of backend pools:
    - name - Name of backend pool
    - healthprobe_path - URL path for the healthprobe for this backend
    - latency - is the additional_latency_milliseconds
      > The additional latency in milliseconds for probes to fall into the lowest latency bucket
    - backends - A list of Backends to put add to this pool
      - host_head - This is sent to backend and not used for routing:  
        > The value to use as the host header sent to the backend. If blank or unspecified, this defaults to the incoming host.
      - address - FQDN of backend (could also be IP address)
      - http_port - port to forward HTTP traffic to.
      - https_port - port to forward HTTPS traffic to.
      - weight - it is easiest to think of this as percentage and have all the weights for the backends add to 100.  Then 25 here would indicate 25% of traffic 
      goes to this backend.  But you can have the sum be anything.  If you have 3 backends you can set the weights to 1,1,1 or 33,33,33 for even load distribution.

## Outputs

- id - The ID of this frontdoor.
- cname - The value you would put in your DNSs CNAME record.

## Eample Usage

```hcl
module "frontdoor" {
  source = "../../../submodules/terraform-azurerm/services/frontdoor/endpoint/base/v1"

  context                = local.context
  observability_settings = local.observability_settings 

  service_settings = {
    # This resource is global, so the location is not put in the name
    name              = "${local.context.application_name}-${local.context.environment_name}-${local.random_string}"
    waf_id            = module.waf.id
    pools = [
        {
            name             = "demoapi"
            healthprobe_path = "/demo-health"
            latency          = 0 
            backends = [
                    {
                        host_header = module.apim.gateway_domain
                        address     = module.apim.gateway_domain
                        http_port   = 80
                        https_port  = 443
                        weight      = 100  
                    }
            ]
        }
    ]    
  }

}
```

    