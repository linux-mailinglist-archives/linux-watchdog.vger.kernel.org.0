Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B9B4420B7
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Nov 2021 20:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhKATYc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 1 Nov 2021 15:24:32 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:35486 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhKATYc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 1 Nov 2021 15:24:32 -0400
Received: by mail-oi1-f181.google.com with SMTP id x8so22132018oix.2;
        Mon, 01 Nov 2021 12:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CK8bDl/UZF3iJElpM0AUZ8j3XZuMtTVDa42QmfBmzIg=;
        b=iGBGHlowYwzp8ZLK5CoWRa0m2noAmcSFOdV0p5NkbKRxGyHi2CSNI6PhO8cFsSaJSZ
         iizLeyJeSJ2MxinriMdka/Jmj9lEB4VkECYO39t9bN7Z8SVHQKPnvGndACCLaHb4KiOG
         9GWgInej3/5SJ3t4gCUvQxTZ1or965PL+3c+Z7Jm6bwfuxSMzPe4hq/4VUc4Az8Ows29
         gTYNFZzNhXyJHH50m0On/xSZoZGoYMxiT0ghlyKAnnY/CPjvinBUet51Ff2ILW9AgAJj
         hSpWOyhaVHe3Q3xsEzKBe7JItkzoohAcGdBcd1Bs/I6v3lTHH0hwIJX9dfG13nZhpIfy
         e6hQ==
X-Gm-Message-State: AOAM5308mz+LiUtdkHbjyi/dcEDJelfqEvwl04xmzCxAAj1/jVdsq3le
        qlDSGduQKuEEWblKuwEKyzgZlP/+cQ==
X-Google-Smtp-Source: ABdhPJxbovHOnNGmkHJoaK9iKIkmrwObE/xyfVNB/TKcn30ifdXMxz2LnyePis97GkWQgLPBIywSuA==
X-Received: by 2002:a05:6808:3d2:: with SMTP id o18mr769126oie.121.1635794518037;
        Mon, 01 Nov 2021 12:21:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bi40sm569733oib.51.2021.11.01.12.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 12:21:57 -0700 (PDT)
Received: (nullmailer pid 869326 invoked by uid 1000);
        Mon, 01 Nov 2021 19:21:56 -0000
Date:   Mon, 1 Nov 2021 14:21:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: watchdog: Require
 samsung,syscon-phandle for Exynos7
Message-ID: <YYA+VH5PLSFvq1H0@robh.at.kernel.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-2-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211031122216.30212-2-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, 31 Oct 2021 14:22:05 +0200, Sam Protsenko wrote:
> Exynos7 watchdog driver is clearly indicating that its dts node must
> define syscon phandle property. That was probably forgotten, so add it.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Fixes: 2b9366b66967 ("watchdog: s3c2410_wdt: Add support for Watchdog device on Exynos7")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
> Changes in v2:
>   - Added R-b tag by Krzysztof Kozlowski
>   - Added "Fixes" tag
> 
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
