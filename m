Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0713C5178AA
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 May 2022 22:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236730AbiEBVAI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 May 2022 17:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234261AbiEBVAG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 May 2022 17:00:06 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07F06454;
        Mon,  2 May 2022 13:56:36 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-e93ff05b23so15443959fac.9;
        Mon, 02 May 2022 13:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m8mXd2WXsDw5ZxR8tXdGAkcx5wqJghMKwV/YVSGHE58=;
        b=QI8Urj93S+cdbzGKuMY3uYXA9wxN/TeeGgEZxV+WGBHwFr64DxEnD8sOkL8KnsEv17
         hRWXSYID2w2MFHH8dUPaVY79gC5gdxj2j0/l9JMrnmaJHxUcMi8S6u/d0KAwW8N7PUcL
         EJvNqpg4O9KIntTcogyOSr/s/WbcN6VGVaPDYVB+ELJEylylsX+JNhOdhLaks33vO77m
         LsZObju9hgPoPV0YkTCVRnYQl4ZoJ3CAK2YaA2HO0LiyZwpup0w2tbc9FP/R8X1+m5hW
         7mASVQLf04xAyIhVmtGkaOH4E8BdBUyuPVY5wWjhotMuvEV8ckBEbiqB6Ev+36TKEhr4
         jXTg==
X-Gm-Message-State: AOAM531mxCPFS6KlhEgsc0sh2GT1hNe7OPcGHIAY2nTwSUBi2C3AsJYU
        puyc+14pbWrXJcnqT9uucA==
X-Google-Smtp-Source: ABdhPJybLe+M1VFqkR40g9Ftpvn/1tOwUrBfkSTBgrfUWk6qIHdo4z73Obycbqt9nGGo3H0LIWc2qQ==
X-Received: by 2002:a05:6870:a9a4:b0:e6:4451:f4b0 with SMTP id ep36-20020a056870a9a400b000e64451f4b0mr464214oab.252.1651524996279;
        Mon, 02 May 2022 13:56:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f11-20020a4ae60b000000b0035eb4e5a6bdsm3993595oot.19.2022.05.02.13.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:56:35 -0700 (PDT)
Received: (nullmailer pid 1733995 invoked by uid 1000);
        Mon, 02 May 2022 20:56:35 -0000
Date:   Mon, 2 May 2022 15:56:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Primoz Fiser <primoz.fiser@norik.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrej Picej <andrej.picej@norik.com>, upstream@phytec.de
Subject: Re: [PATCH 1/3] dt-bindings: mfd: da9063: watchdog: add suspend
 disable option
Message-ID: <YnBFg4exZKkqkxDo@robh.at.kernel.org>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422072713.3172345-1-primoz.fiser@norik.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
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

Name the property based on the h/w quirk rather than what to do in 
response. Something like 'dlg,hw-suspend-broken'

> +  Only use this option if you can't use the watchdog automatic suspend
> +  function during a suspend (see register CONTROL_B).
>  
>  Example:
>  
> -- 
> 2.25.1
> 
> 
