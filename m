Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8144366D7
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Oct 2021 17:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhJUP4L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Oct 2021 11:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbhJUP4K (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Oct 2021 11:56:10 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EEFC0613B9
        for <linux-watchdog@vger.kernel.org>; Thu, 21 Oct 2021 08:53:53 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id d198-20020a1c1dcf000000b00322f53b9b89so168369wmd.0
        for <linux-watchdog@vger.kernel.org>; Thu, 21 Oct 2021 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RiUvh0ktpqCA7fZqTGI1aV30cE3yIMDtrq4XdFWDz3c=;
        b=nxj/lswM3BP8tKL+rxtxFVguaNRMLh/Hjxrj5bltEa6eCcDJl12Ha/csvdw8STAA5t
         jnbuCfkdwo11Hx3ctxt+jRCXDWDw473brc53wDYCah3M2OfH4v2GWfSZcwuPD85T1HPl
         hWKnWcdZ+mHgfHJl+TlL+tePN56EN+xf580Y5sOaylG0M85HywFn5fHnb67cJo0nCtIa
         un7to2Z0IuBebbI9xQgF3V1C4vZXLt+0gfUYZOgo4n97bZTTkDO6USGQ7EZN3zabiiKa
         VtClWI0F0OjUZaPsZF/jHMpCc6hO2MKNM1pjLT0rIdNUdR75woY7SkTeNgZ0YYbkrCZG
         ZG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RiUvh0ktpqCA7fZqTGI1aV30cE3yIMDtrq4XdFWDz3c=;
        b=KuuNatCezto2+Q4S3iZOyfVLJZL9Z0t1S8A4lm9gviTXvPcAW83fGAbXiaGwY3esBS
         wUYbrmcnTjfYujOnRk4vSxSqKaYggfmSh6JmGO+2GUa57/Mc1cpqbQNa6cWi06SxB47O
         lEbyoV/rAMkPCPN8bSXq0SWCLr7Kqwxlw5zPyzt2DAX2kIGRU2bLxOmM410UNQU4PRZl
         OYAOav9p4lCNOfmrnD+xhiLOygtyWm4YU3frHj96lW9nCATzQUUFMZxoA73+WlK2NHOM
         owim0ufDlqox1OOL/JXRBvf+E/LODe8ojDvYusdNwUoHUgyyv9nTRALs6lF3SsS3hytp
         xxwg==
X-Gm-Message-State: AOAM531ZcyFuR5T6zCGigtJSHRb32x21LA8nf41aYmauK9oBRPxXT1Sn
        BhWL0zIuz4gwaxB8T9gIvwDOCA==
X-Google-Smtp-Source: ABdhPJyoyHKkVFQ93CGd5H00pN/2DftHR/6cPv38ILBCxFjUmjec2Asvge3c71IyKbmo65Vu90PmbQ==
X-Received: by 2002:a7b:cb10:: with SMTP id u16mr21967132wmj.65.1634831632452;
        Thu, 21 Oct 2021 08:53:52 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id n11sm5217954wrw.43.2021.10.21.08.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 08:53:51 -0700 (PDT)
Date:   Thu, 21 Oct 2021 16:53:49 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/9] mfd: max77686: Correct tab-based alignment of
 register addresses
Message-ID: <YXGNDZCMHYjr2B9s@google.com>
References: <20211019145919.7327-1-luca@lucaceresoli.net>
 <20211019145919.7327-2-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211019145919.7327-2-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 19 Oct 2021, Luca Ceresoli wrote:

> Some lines have an extra tab, remove them for proper visual alignment as
> present on the rest of this file.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> ---
> 
> Changes in v2: none
> ---
>  include/linux/mfd/max77686-private.h | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
