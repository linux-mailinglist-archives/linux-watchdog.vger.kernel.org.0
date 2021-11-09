Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED8444B031
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 16:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238928AbhKIPWR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 10:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236189AbhKIPWP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 10:22:15 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99CDC061764;
        Tue,  9 Nov 2021 07:19:29 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id u74so13077683oie.8;
        Tue, 09 Nov 2021 07:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v5BQ5l9cKZf8ByTelTtXctDUQ32GQGxJhk2sWcu98+M=;
        b=R9Mhl8UrOxMO+lRTCh2r0MM5vKZ9Kqxm/N9gE46LLwN1DHYZS2DvGP/mFnERF5p2tL
         oM7g4+TaVjZS0GN8rxV9LPZd2X+NUeQNDEXY2ZzKGMRLxfOMnDEf5mgky0a++SQzxYcS
         9m3Qnu7+RhB2mCx+lJRO2GXgcs2zBrsblrrrcsPWizd2cXiGO4sbZvMFmG5tkU6LlVP+
         /rZvdvA6SLBn/l0TVA3kupegWLSSpq/zkOMdJsoCMPBedhT4FnPKAeBFQCvky1zGSxWs
         RKEf5qy60pjYGylPnFYDdRE7vYvbOkBik1TT34e9ygsS2hpoAM+jmYDrB5fgqphK8RWL
         8rKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=v5BQ5l9cKZf8ByTelTtXctDUQ32GQGxJhk2sWcu98+M=;
        b=y3wfr9ahU0DQQcV3IuFxUjkQoCPOqx0IYXGlCooYdPsWkHdewQTUCvoctUSCQ58ucM
         sEEfjyjAMeWFcCcLTQtZIOMrAU7T1N9WdgsFCClmuXgjUSUdWwgDllucrxkum/U6dQ59
         QBqY8Pwl+FOff4WbGWD8DJiz48f4eTYqb8AYvLNADmzrNjSVHebNyH9gChijFmM7g30Q
         4Wp7aXbwNS0HCp4+S9gs5lab5Ncq3TisLhsacZAn46nV4WLSzIepWJciIt2WkScv7V2s
         Oh5pXFciYCFMRHm6SP0DRTUiVuFo5HhYlVDH2crA6gZ5o0Jxtz+Q30e73aAlSGB56QEp
         mZyA==
X-Gm-Message-State: AOAM533CatESt6ldgIWisk5WXeFSwcEZnwt3UyW6cL6T1GXw1JvNG/5K
        SutpPqNbjSCg7wmf3Fwt/IhozINqwz4=
X-Google-Smtp-Source: ABdhPJx8AUDYzRWR0GvZWi7FHCTBT3AknltsiAAbbCJVTuQzz3rzEl95Zi4VutFjyBWR90Du11ruag==
X-Received: by 2002:a05:6808:199f:: with SMTP id bj31mr6426970oib.98.1636471168993;
        Tue, 09 Nov 2021 07:19:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e21sm2129211ote.72.2021.11.09.07.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 07:19:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 9 Nov 2021 07:19:26 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     David Heidelberg <david@ixit.cz>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        ~okias/devicetree@lists.sr.ht, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: sunxi: fix error in schema
Message-ID: <20211109151926.GA3059256@roeck-us.net>
References: <20211029142443.68779-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029142443.68779-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Oct 29, 2021 at 04:24:42PM +0200, David Heidelberg wrote:
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
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 44cad9427ae6..43afa24513b9 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -40,14 +40,12 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    maxItems: 2
>      items:
>        - description: High-frequency oscillator input, divided internally
>        - description: Low-frequency oscillator input, only found on some variants
>  
>    clock-names:
>      minItems: 1
> -    maxItems: 2
>      items:
>        - const: hosc
>        - const: losc
