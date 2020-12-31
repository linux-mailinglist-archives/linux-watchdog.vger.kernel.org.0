Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4095A2E81C7
	for <lists+linux-watchdog@lfdr.de>; Thu, 31 Dec 2020 20:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgLaTRK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 31 Dec 2020 14:17:10 -0500
Received: from mail-io1-f42.google.com ([209.85.166.42]:45337 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgLaTRK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 31 Dec 2020 14:17:10 -0500
Received: by mail-io1-f42.google.com with SMTP id n4so17821482iow.12;
        Thu, 31 Dec 2020 11:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WIeSBo6yv1g6tueM5MfrSEO4VtHQ5xYK2u3vHaN1aNo=;
        b=LwlaghcTkFsTf1djvS5WkOGXIrSP5w5cy2UhS+okOk636YT+WJleZUDriMjw+4k9m+
         A/9bzi8Ymk2fCNc4D0DhQgc/+ESpt34B68JhRw/VzKNMTG18k2caXDysaGYpcNvoCNzR
         k2tgs00zr77uj+d6yQGawUD0jFCTaTwkaKT7NiC3LN6nRs9kXw7QsBprBViwTsefUTBD
         7dvDcABczQegGd23uOMXRHptaxCoVrK3G+C5LK76TugaNX8G+A/IDrf5j3QLnRWiJU01
         6NsMVCFzSnYn3oNnE800WjWNNk2t7nW30GMgdJdy0og6Ce4f4J+Cfnc+Rpn1aPORMJNI
         YV6Q==
X-Gm-Message-State: AOAM530n4UVnOPrmF+jMdBikXw1zwoJXofJaR2IPjPiskVdd0uDAsXTz
        EOMFeQdE5PhbWHw4m2sEpg==
X-Google-Smtp-Source: ABdhPJwt6KZBt6GUAzo90fcHcUxG/1/p50U6VtuLexqkkODl5UXWnpjzUlJZoIX7YYEyyQMGtbJwdQ==
X-Received: by 2002:a5d:8c85:: with SMTP id g5mr47341946ion.154.1609442189517;
        Thu, 31 Dec 2020 11:16:29 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n10sm35060460ila.69.2020.12.31.11.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 11:16:28 -0800 (PST)
Received: (nullmailer pid 2197700 invoked by uid 1000);
        Thu, 31 Dec 2020 19:16:26 -0000
Date:   Thu, 31 Dec 2020 12:16:26 -0700
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org, heiko@sntech.de,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        jamie@jamieiles.com, linux@roeck-us.net,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/8] dt-binding: watchdog: add more Rockchip compatibles
 to snps, dw-wdt.yaml
Message-ID: <20201231191626.GA2197646@robh.at.kernel.org>
References: <20201218120534.13788-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218120534.13788-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 18 Dec 2020 13:05:27 +0100, Johan Jonker wrote:
> The watchdog compatible strings are suppose to be SoC orientated.
> In the more recently added Rockchip SoC dtsi files only
> the fallback string "snps,dw-wdt" is used, so add the following
> compatible strings:
> 
> "rockchip,px30-wdt", "snps,dw-wdt"
> "rockchip,rk3228-wdt", "snps,dw-wdt"
> "rockchip,rk3308-wdt", "snps,dw-wdt"
> "rockchip,rk3328-wdt", "snps,dw-wdt"
> "rockchip,rk3399-wdt", "snps,dw-wdt"
> "rockchip,rv1108-wdt", "snps,dw-wdt"
> 
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> 
> make ARCH=arm64 dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
