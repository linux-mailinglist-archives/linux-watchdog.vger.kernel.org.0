Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11DCA4B5526
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Feb 2022 16:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346797AbiBNPsw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Feb 2022 10:48:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346014AbiBNPsw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Feb 2022 10:48:52 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D214C60A94;
        Mon, 14 Feb 2022 07:48:44 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id u25-20020a4ad0d9000000b002e8d4370689so19733396oor.12;
        Mon, 14 Feb 2022 07:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eNNtqm8EpmpM3533I3FfPpJ0jXPvy/LfN0oxAHh3x3M=;
        b=EI+aGyX21Q8PfcNohLpV4XGV+abyjxsipwep0JcybqAGDvqFYQeXfqJ7gFegBzd7L7
         Dswir/ivkF3yIy0wTnzyfUFnNyQDRjuZuNWo3JfkuF8MaRqWYhEMifEP9U79VK8nmRdk
         a04I3YtRx6aC88R8ewLtlQ3ph2zD68oesh+UwotboudNujD1pEEtq0WQLLACWpzmIeQr
         bMrpQp/Hq5obBWumz8K5luW7c2GBXA3Mgbjtllc0GVEIPf6TJwMtjcOKVdoa5i7VtWA/
         U6WeBsoq0XhHkp3nRgPQN0hu0WZVBKD0R5RwJs4XxgVgVBWER7xXzZfhU9RDT89M0OpL
         gkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=eNNtqm8EpmpM3533I3FfPpJ0jXPvy/LfN0oxAHh3x3M=;
        b=HNez435M6BLH+EzyYwMnk698dhpgPxsAHZ8b2jUgAzzKmY1ghSQSqPBJ0BPpC8k6V6
         hc3DRnPP/DPkY6JV9Vk+5NI0CxPBtz257yljOV8Sdizi32ObShG/NyGiH+tF2iB8ERxo
         HFVGdu7lecIZuV778MHceEcS6tiP0nLEAjnldXr1IzN6GvAq7+murD6Lb+y742ZjbuWx
         Q5CNpOqU9kN3V5du19F+CTl7H6r5eplFzLixK7W5tcayiEogqCkv+ruv42u9lbF/kGRq
         Wq5AxpoAQUw+nUtOE+H/5679vsOXPMghr+lZYTQ6dE7ggWnee4NvNGwbZdlqpBApXR1p
         0qyg==
X-Gm-Message-State: AOAM530uQnN2sKY+2K8yO7z9Upk6RnXgKrhrZZf5JXWo7KaWYN9/92C3
        cAuOInTlLEG8xWcm3RCcQvw=
X-Google-Smtp-Source: ABdhPJzkywkhm7Rq6NsxeJ2BNJkNSdrH42e5c/sMzjJ4wifWqh1sy4XWOc5vypLnNe3xPZSd3VubIg==
X-Received: by 2002:a05:6870:a11e:: with SMTP id m30mr36609oae.260.1644853724274;
        Mon, 14 Feb 2022 07:48:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v32sm1930812oaa.4.2022.02.14.07.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 07:48:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 14 Feb 2022 07:48:42 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Thanh Quan <thanh.quan.xn@renesas.com>
Subject: Re: [PATCH 2/5] dt-bindings: watchdog: renesas-wdt: Document
 r8a779f0 support
Message-ID: <20220214154842.GA4172444@roeck-us.net>
References: <cover.1642525158.git.geert+renesas@glider.be>
 <cca61a83ae82ecf5c23eb28e30c39f2f661f0e02.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cca61a83ae82ecf5c23eb28e30c39f2f661f0e02.1642525158.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jan 18, 2022 at 06:09:02PM +0100, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> Document support for the Watchdog Timer (WDT) Controller in the Renesas
> R-Car S4-8 (R8A779F0) SoC.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 91a98ccd4226f505..d060438e1402d502 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -55,6 +55,11 @@ properties:
>                - renesas,r8a779a0-wdt     # R-Car V3U
>            - const: renesas,rcar-gen3-wdt # R-Car Gen3 and RZ/G2
>  
> +      - items:
> +          - enum:
> +              - renesas,r8a779f0-wdt     # R-Car S4-8
> +          - const: renesas,rcar-gen4-wdt # R-Car Gen4
> +
>    reg:
>      maxItems: 1
>  
