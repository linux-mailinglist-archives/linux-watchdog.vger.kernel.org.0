Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACC8952716C
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 May 2022 15:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbiENNzn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 14 May 2022 09:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbiENNzl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 14 May 2022 09:55:41 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF275F66;
        Sat, 14 May 2022 06:55:40 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-f16a3e0529so3626739fac.2;
        Sat, 14 May 2022 06:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XhVOx/srzQKVwcq3LfQ0MDcYNQ67q/D60OI0kUuEEYU=;
        b=G5IrVW3ms1SN4npgtpQka+4zZTmDS7945n+xJYCWg6eJtJZIElxkN3Z8eZZMG0TyrZ
         MsHW5dtD8vEy1tL0OrQxvRPP6fKmC4JsF72lmZrfydBLOOKFezCxP3U4grg8eyTqS0Rj
         cVWial8KW5D6HBEzP8fE2K8QZ1IE27NhtQSGuWk6gQCTYMxx1Eer3R7k7TUWQbkqCbNn
         GvbQI+nMWxiAN+U+RtvWpuS25D2rer70ST9hHKeSGPyXGidkCe/bJc65YO24Epv+62wv
         ulz3qXg8zGt6WyXeAe3mTEs+eUu6d2iTL3rdMBWs/6jravVpqgO5I83uj0Fy23t/AeGc
         256Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=XhVOx/srzQKVwcq3LfQ0MDcYNQ67q/D60OI0kUuEEYU=;
        b=Uat6QuRENTcZLRauUVZCRJ8HMBoz5jl+Hi2i0V/v7bJ/AQERV1W32Y/YZW/C+ZpqyN
         dwkB/8V9koecSkAQ9SN6+myThdxV81c2KKUa4VG5ew5tL8QHdhYGzt7zEoOsmrh5NdtY
         O/yzcc5Vobqdct02yfwl2u6qwBuFUq2q5nsJiRGRJ+w3Mgx85T686mLfVDC/GG8Yph3M
         I6xIxvYLz1NrF0FFiaLSugFaNBB/5uM5iUTzWhWDsY2pG9DiSEPgDzhAUh8oPBB6Bwbl
         fprSu4xQXiy6F1GagVt40/ZpyxSXoYD3Je7XQLbLWtuvwFyYNbLr5PrWfRX6tQshJAuu
         xB3g==
X-Gm-Message-State: AOAM53375+2HcEN6qDwWqT29FOfdUbU9t0/BFNSsFbfr/JAnqYulywXL
        yCY/QSxcUjsTlBewnn//k0M=
X-Google-Smtp-Source: ABdhPJxzBNKs2RplcOFNOhdNJ6KrQFTfS755kgd4OYGdACSOgNK84krnW4zz+3qE0CAfCHZFPpNNow==
X-Received: by 2002:a05:6870:2391:b0:e6:706f:832c with SMTP id e17-20020a056870239100b000e6706f832cmr5223236oap.80.1652536539887;
        Sat, 14 May 2022 06:55:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g18-20020a056870c15200b000d6c86ea98dsm2739123oad.1.2022.05.14.06.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 06:55:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 14 May 2022 06:55:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Primoz Fiser <primoz.fiser@norik.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrej Picej <andrej.picej@norik.com>, upstream@phytec.de
Subject: Re: [PATCH 1/3] dt-bindings: mfd: da9063: watchdog: add suspend
 disable option
Message-ID: <20220514135537.GA1203741@roeck-us.net>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422072713.3172345-1-primoz.fiser@norik.com>
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

On Fri, Apr 22, 2022 at 09:27:11AM +0200, Primoz Fiser wrote:
> Document the watchdog disable option which can be used if the hardware
> automatic suspend option is broken.
> 
> Based on commit c514430c51ee8 ("dt-bindings: watchdog: da9062: add
> suspend disable option").
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/mfd/da9063.txt | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
> index 91b79a21d403..aa8b800cc4ad 100644
> --- a/Documentation/devicetree/bindings/mfd/da9063.txt
> +++ b/Documentation/devicetree/bindings/mfd/da9063.txt
> @@ -64,10 +64,13 @@ Sub-nodes:
>      and KEY_SLEEP.
>  
>  - watchdog : This node defines settings for the Watchdog timer associated
> -  with the DA9063 and DA9063L. There are currently no entries in this
> -  binding, however compatible = "dlg,da9063-watchdog" should be added
> -  if a node is created.
> +  with the DA9063 and DA9063L. The node should contain the compatible property
> +  with the value "dlg,da9063-watchdog".
>  
> +  Optional watchdog properties:
> +  - dlg,use-sw-pm: Add this property to disable the watchdog during suspend.
> +  Only use this option if you can't use the watchdog automatic suspend
> +  function during a suspend (see register CONTROL_B).
>  
>  Example:
>  
