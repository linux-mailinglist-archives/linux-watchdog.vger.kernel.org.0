Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED0849D505
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Jan 2022 23:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbiAZWK4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 Jan 2022 17:10:56 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:42512 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiAZWKz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 Jan 2022 17:10:55 -0500
Received: by mail-oi1-f169.google.com with SMTP id v67so2307257oie.9;
        Wed, 26 Jan 2022 14:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=sbTUBGua5GOv+mh2pAJ2hJl8A5cbSwDu8kHG9Q1vons=;
        b=H5LBwSD3G9ATR0PGrEm+Z8rXbrV4aBVcBDVIrCKGggnEj4nBPDbySgZWm0m2IA5dRS
         xQecA+psl1SeBsy1mNHVeRH5K9lEywOTO/pxqEi7jxbDhHL93fjeYdNGHprjd3/8NTCY
         6Fghv0u186uaE4Aaef4v53tvUwVzm7NEnjpNZR60frwwqgr6WF3XPlEPX8B+6sJzY43W
         WMLaD0gjgScOfxbtZIhsvYz0jpKHxeRTWBxRUyv6+flEtnQ1ZbdJPMwa48LPHZjbKVhl
         gr42qNm+nkGLuNRtkKhXUX0pc5/III3Y4bmgpOWFC6HxE55+2BN3XebgSP7oe3Fe+xRb
         i2tw==
X-Gm-Message-State: AOAM531OYa+RtY5xkngwQUMifjt26hzJODmfsr8OjCPPlj3/OBRzRMYH
        5rRNKJRk1wBTn1vx9z2YjFURP1RVzw==
X-Google-Smtp-Source: ABdhPJyVq86ugfcILsWRaaxFiTHEhQDDDsECW1YhRLC9JSSPSEn6Pz960Q503bvR6Bi+NA7r6zXR8w==
X-Received: by 2002:a05:6808:13d1:: with SMTP id d17mr5360856oiw.62.1643235054553;
        Wed, 26 Jan 2022 14:10:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h27sm5107802ote.57.2022.01.26.14.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:10:53 -0800 (PST)
Received: (nullmailer pid 1535093 invoked by uid 1000);
        Wed, 26 Jan 2022 22:10:52 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org
In-Reply-To: <20220126132116.11070-1-zajec5@gmail.com>
References: <20220126132116.11070-1-zajec5@gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: brcm,bcm7038: add more compatible strings
Date:   Wed, 26 Jan 2022 16:10:52 -0600
Message-Id: <1643235052.838468.1535092.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 26 Jan 2022 14:21:16 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This hardware block is used on almost all BCM63xx family chipsets and
> BCM4908 which reuses a lot of BCM63xx parts. Add relevant compatible
> strings and also include a generic one.
> 
> The only SoC with a different block I found is BCM6838 (thus not included
> in this change).
> 
> It may be worth noting that BCM6338, BCM6345, BCM6348 and BCM63268 don't
> include "SoftRst" register but that can be handled by drivers based on
> precise compatible string.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 21 +++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,twd.example.dt.yaml: timer-mfd@ff800400: watchdog@28:compatible: ['brcm,bcm7038-wdt'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,twd.example.dt.yaml: watchdog@28: compatible: ['brcm,bcm7038-wdt'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1584464

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

