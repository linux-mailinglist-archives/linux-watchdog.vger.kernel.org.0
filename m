Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE462E80FF
	for <lists+linux-watchdog@lfdr.de>; Thu, 31 Dec 2020 16:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgLaPfi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 31 Dec 2020 10:35:38 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:35250 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgLaPfh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 31 Dec 2020 10:35:37 -0500
Received: by mail-oi1-f180.google.com with SMTP id s2so22164055oij.2;
        Thu, 31 Dec 2020 07:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=d/j65F0xDeODzWQ7ItCBXGTIo7MfPYId6+AMLyCdHMo=;
        b=Upk3o48fNW0UA4btqOqhgESVTgVfzjgbxsaVu9raRirbsVmILzxB4fQnsF1hzut5qW
         bnd+9G69vi+xnB6MZHYsAA39HdtPVW+3YSDbe2e93Zq98WLe9WKK0RVnc8KTXVB/adMJ
         R8o9G1lomgPCVJncmI66vukDF3U6F8RcnS+Z82QuyRAajhtrJieJ3dTJNyT0Q+cvH42n
         x5yZ8TDLu6tLD4Kzk6+rpeT7GIMBupv3iEnE5agLj+fr+yRxJF/qt/aD5FU5/JkZOUhC
         ovTuEZC7NYC956bxtyezit5U0doTsYetnWTDs6AaKgpG5XJKZcoJt1wfw69RkL1KfuLJ
         DAHg==
X-Gm-Message-State: AOAM5315dpOgGHjNPtEcG4nV/paA/j6F3BPh12F5myv404Wg6pTVvLwI
        2j1RsDWHm86uYECFpGCVmRj3WZ76Zw==
X-Google-Smtp-Source: ABdhPJwyhSC7NMQ5mvKqpnkKyC/xlzouqKLhslB1LhVgY0S5xZqFE84DSoQ+iZLaIOmB3FFlBE74Mw==
X-Received: by 2002:aca:130a:: with SMTP id e10mr7909601oii.163.1609428895898;
        Thu, 31 Dec 2020 07:34:55 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c204sm10932224oob.44.2020.12.31.07.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 07:34:55 -0800 (PST)
Received: (nullmailer pid 1828659 invoked by uid 1000);
        Thu, 31 Dec 2020 15:34:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     Campion Kang <campion.kang@advantech.com.tw>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        AceLan Kao <chia-lin.kao@canonical.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-watchdog@vger.kernel.org
In-Reply-To: <20201231123948.10473-3-campion.kang@advantech.com.tw>
References: <20201231123948.10473-1-campion.kang@advantech.com.tw> <20201231123948.10473-3-campion.kang@advantech.com.tw>
Subject: Re: [PATCH v5 3/6] dt-bindings: mfd: ahc1ec0.yaml: Add Advantech embedded controller - AHC1EC0
Date:   Thu, 31 Dec 2020 08:34:48 -0700
Message-Id: <1609428888.845662.1828658.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 31 Dec 2020 20:39:45 +0800, Campion Kang wrote:
> Add DT binding schema for Advantech embedded controller AHC1EC0.
> 
> Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
> ---
>  .../devicetree/bindings/mfd/ahc1ec0.yaml      | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/ahc1ec0.example.dts:19:18: fatal error: dt-bindings/mfd/ahc1ec0.h: No such file or directory
   19 |         #include <dt-bindings/mfd/ahc1ec0.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/mfd/ahc1ec0.example.dt.yaml] Error 1
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1421561

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

