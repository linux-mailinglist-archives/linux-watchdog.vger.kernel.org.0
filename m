Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF786D1048
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Mar 2023 22:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbjC3Uu6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Mar 2023 16:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjC3Uu5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Mar 2023 16:50:57 -0400
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF91749CF;
        Thu, 30 Mar 2023 13:50:56 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id k14-20020a9d700e000000b0069faa923e7eso10743886otj.10;
        Thu, 30 Mar 2023 13:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680209456;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e5eLhRpS5QUemU171kaJZBbMWe4s/0L9/7Btk4sk5Zs=;
        b=IY5mjdkikKw049rAsr2hbu4Ku3p2j9tWTApP6le5uijxRZeNmZZqTvkSAnxnsRIpVs
         LcOzERom++aK1/kBmregw9CpHtLTuJ1MN/MAWYG43otHTHlxpGyCPoeINhtskwI8VrYm
         nycedgX1dgT+ENOau3rZDFzEfKeUvGyOnEeI0WNTJKerTZqYOZwLSg02+PjiaHtasY30
         HIWc6TWq1vTTtPWHBeMVlZ8y0fhS319gNPW76rOiNSFIuhZdR9VzzA1/trwkRzwfTJH7
         avM6fX5+jDbnxipbGOUNOYwVmQ2en5MaW0BxGP437wmXPNtZ0L3Nh1P+dadyRZE6ZqMt
         brqA==
X-Gm-Message-State: AO0yUKWJgYS4DbAVsuLLz1Qz6sg731FW4IMMGbwK4Gnxfx9yFmnq5AzV
        UG6CdbM1OBeLII5qzc4tIw==
X-Google-Smtp-Source: AK7set/GHdEnabZLNc3Ajn9m0NHgQ0cQjBi09b9EvaWxQBT1iWIQnNEzMxA9287IJxFAsT7DwLzeHA==
X-Received: by 2002:a05:6830:146:b0:68c:1b5f:96de with SMTP id j6-20020a056830014600b0068c1b5f96demr11920049otp.2.1680209456174;
        Thu, 30 Mar 2023 13:50:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l26-20020a9d6a9a000000b0069fb690b38esm371652otq.21.2023.03.30.13.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 13:50:55 -0700 (PDT)
Received: (nullmailer pid 2782004 invoked by uid 1000);
        Thu, 30 Mar 2023 20:50:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Nikita Bondarenko <n2h9z4@gmail.com>
Cc:     rjui@broadcom.com, linux-watchdog@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sbranden@broadcom.com,
        linux@roeck-us.net, robh+dt@kernel.org, f.fainelli@gmail.com,
        devicetree@vger.kernel.org, wim@linux-watchdog.org,
        bcm-kernel-feedback-list@broadcom.com
In-Reply-To: <20230330182447.51674-1-n2h9z4@gmail.com>
References: <20230330182447.51674-1-n2h9z4@gmail.com>
Message-Id: <168020932908.2779835.7122491631340015762.robh@kernel.org>
Subject: Re: [PATCH] Convert brcm,kona-wdt.txt to brcm,kona-wdt.yaml
Date:   Thu, 30 Mar 2023 15:50:54 -0500
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On Thu, 30 Mar 2023 20:24:47 +0200, Nikita Bondarenko wrote:
> Signed-off-by: Nikita Bondarenko <n2h9z4@gmail.com>
> ---
>  .../bindings/watchdog/brcm,kona-wdt.txt       | 15 -------
>  .../bindings/watchdog/brcm,kona-wdt.yaml      | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230330182447.51674-1-n2h9z4@gmail.com


watchdog@35002f40: compatible: ['brcm,bcm11351-wdt', 'brcm,kona-wdt'] is too long
	arch/arm/boot/dts/bcm28155-ap.dtb

watchdog@35002f40: Unevaluated properties are not allowed ('compatible' was unexpected)
	arch/arm/boot/dts/bcm28155-ap.dtb

