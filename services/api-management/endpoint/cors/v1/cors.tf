
locals {

    default_cors_headers = [ "Authorization" ]
    default_subscription_headers = [ "Ocp-Apim-Subscription-Key", "Ocp-Apim-Trace" ]
    merged_cors_default_headers = concat(local.default_cors_headers, local.default_subscription_headers)
    merged_cors_allowed_headers = concat(local.merged_cors_default_headers, var.cors_settings.allowed_headers)

    allowed_headers_xml = "${join("\n", formatlist("<header>%s</header>", local.merged_cors_allowed_headers))}"

    allowed_headers_list = "${join(",", formatlist("%s", local.merged_cors_allowed_headers))}"

    allowed_origin_xml = "${join("\n", formatlist("<origin>%s</origin>", var.cors_settings.allowed_origins))}"

  cors_policy_xml = <<XML
        <cors allow-credentials="true">
            <allowed-origins>
                ${local.allowed_origin_xml}
            </allowed-origins>
            <allowed-methods>
                <method>*</method>
            </allowed-methods>
            <allowed-headers>
                ${local.allowed_headers_xml}
            </allowed-headers>
        </cors>
XML

  cors_on_error_xml = <<XML
        <set-header name="Access-Control-Allow-Origin" exists-action="override">
            <value>@(context.Request.Headers.GetValueOrDefault("Origin",""))</value>
        </set-header>
        <set-header name="Access-Control-Allow-Credentials" exists-action="override">
            <value>true</value>
        </set-header>
        <set-header name="Access-Control-Allow-Methods" exists-action="override">
            <value>*</value>
        </set-header>
        <set-header name="Access-Control-Allow-Headers" exists-action="override">
            <value>${local.allowed_headers_list}</value>
        </set-header>
XML

}