Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448C744E0FB
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Nov 2021 05:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhKLEWe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Nov 2021 23:22:34 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:37666 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhKLEWe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Nov 2021 23:22:34 -0500
Received: by mail-ot1-f47.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so11245155otg.4;
        Thu, 11 Nov 2021 20:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qxOn87ULPwV2ERYJX91GmCv249cvAtIa56rKI6JKMzk=;
        b=IxVceATxm+PuainVHnaDeB6OZus2Xuofm3ooeNiE/FMTeP/SoE3dM8jG3mAQ5Z26jS
         xZswqxfepRxz0qi//mmt7qfdtVpHPAGT3LUlGdrtGvUMU+X6ds3y9L5mBXek00ppHlk7
         79UfzKm1lkuKM9K1SBCP9DtG/T0NV+Dfb6Qx3NGGQM4BnqiN6t72pC0HcDyoI8eSHqfC
         SF6UPrUDmuuhZKmb9YHrgOj5LwphUcWYCoSBw+0E769s1F2JuEqx9bxFe056vJxJfyd0
         bDJcHa3bVzcXtRDjR9r5zMGG528/3G+S5x82D17KZ7+BiDzoK/00e97i970x9+3KiEJS
         ssYg==
X-Gm-Message-State: AOAM530AE3qb3ly2o9SdSKo1vqKerFWi4RQLkuuNXbVSjPxNfDjPDnjU
        RpyAQod6H8Z0BKuRuuOHbTGvmGav0A==
X-Google-Smtp-Source: ABdhPJwcK2aLTenLOImwG5si5qgq36w7YMDwGzNedczDclnQAxDotdfG+bzfTYlQD4IWl7Ex88oHCw==
X-Received: by 2002:a05:6830:22d8:: with SMTP id q24mr9908105otc.170.1636690782006;
        Thu, 11 Nov 2021 20:19:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 62sm922824ooa.47.2021.11.11.20.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 20:19:41 -0800 (PST)
Received: (nullmailer pid 756536 invoked by uid 1000);
        Fri, 12 Nov 2021 04:19:39 -0000
Date:   Thu, 11 Nov 2021 22:19:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     linux-sunxi@lists.linux.dev,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Chen-Yu Tsai <wens@csie.org>, ~okias/devicetree@lists.sr.ht,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-watchdog@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: watchdog: sunxi: fix error in schema
Message-ID: <YY3rWykk1lIjPVe8@robh.at.kernel.org>
References: <20211029142443.68779-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029142443.68779-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 29 Oct 2021 16:24:42 +0200, David Heidelberg wrote:
> "maxItems" is not needed with an "items" list
> 
> Fixes:
> $ DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml make dtbs_check
> Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml: properties:clocks: {'required': ['maxItems']} is not allowed for {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'High-frequency oscillator input, divided internally'}, {'description': 'Low-frequency oscillator input, only found on some variants'}]}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> ...
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 --
>  1 file changed, 2 deletions(-)
> 

Applied, thanks!
