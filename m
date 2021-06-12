Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0A53A4F04
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Jun 2021 14:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbhFLNBZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 12 Jun 2021 09:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhFLNBY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 12 Jun 2021 09:01:24 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF98CC061574;
        Sat, 12 Jun 2021 05:59:17 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id w23-20020a9d5a970000b02903d0ef989477so6005578oth.9;
        Sat, 12 Jun 2021 05:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZIFz0BtmkjFj3bkkH8PuE91K4c5YccOjYJdoSb+1UZw=;
        b=TEkxtKoVCT/P8tBtKk8O15WKo/797BscQjnlCuX2IA3xQf0iYThWesfGQMY1CnoUin
         gustkgdgRrzJcapw+1Vmpgsu2e2lsPAPTtb4Ayq5J5VMnAKePlryv1NZlR+GYHi49G5r
         ARs7mIJq2GVop/5aA2I5ZQCTOFdK8XVzd1WlftzkrCO9oQWILxqpVs5maQnI4jcoJfxt
         0zHK5WuAguUvGwNZEO6N+vz7i5m+6wfdx7EA7/v2WScZMjdZ9+TRo9j3t/T6C+wOtVUE
         ffqsOUtTIpX6kyKl1R6v4uVHw4m6W8nVRWjJiVTdF2DfxgvQGNWkXgQpT1lrocFhqrPk
         2C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ZIFz0BtmkjFj3bkkH8PuE91K4c5YccOjYJdoSb+1UZw=;
        b=msj3994rfrMVVLbKapq3wAXYvngZjUIsMaSeltNPrL8Gr//xIdCmGA1NUgsGAAThKZ
         f1DyB7QdwoBONj8I//y+4V7xZgbMg8gCH4h+V8PnZaNiGwb8zOD89J6NX7Wl25v6+zEq
         cwFproSSiylSBE4nG8QTx+y8dnrmQa+xwYosJtYA6taR/TsB7mvUERL1zXVRvxBh8/28
         IJknZXerKpRUTpHgrF+KhoWb8qrw+3UZQVPyVTvzr3qGZEuaHhXdiX/5vW7RbnzOO9ta
         pOPaU1WFHeveGhOUEJF/uUQf1Ga7yV+JaFm7ZvlmxCLISk9M08QhdiPt/SUWSm0l3Zpd
         Z/rA==
X-Gm-Message-State: AOAM530PIs2lppxOj7QCbmErYMkg/P+f75PcrxFgiztjXYHmny94OW1t
        137zwbAoPDaRaCCBfo38aTo=
X-Google-Smtp-Source: ABdhPJwiJaZfxu8otOuUwqtwrbMTXy7n3lY+zzFDQduJ2Gxx49M4jTtI7sp1U2Tl2OwQvLS+N1bH9w==
X-Received: by 2002:a9d:77c8:: with SMTP id w8mr6632293otl.137.1623502757252;
        Sat, 12 Jun 2021 05:59:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s15sm1792922oih.15.2021.06.12.05.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 05:59:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 12 Jun 2021 05:59:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Add watchdog for Mstar SoCs
Message-ID: <20210612125915.GA320112@roeck-us.net>
References: <20210611200801.52139-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611200801.52139-1-romain.perier@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 11, 2021 at 10:07:58PM +0200, Romain Perier wrote:
> This patches series adds a new driver for the watchdog found in the Mstar
> MSC313e SoCs and newer. It adds a basic watchdog driver, the
> corresponding devicetree bindings and its documentation.
> 
> This work has been co-developed with Daniel Palmer.
> 
> Changes since v3:
> - Rebased onto v5.13-rc5
> - Added Reviewed-by tags

This works better. I applied patches 1 & 2 to my watchdog-next branch for
hand-off to Wim. Note that the arm dts patch needs to be pushed through the
arm tree.

Thanks,
Guenter

> 
> Changes since v2:
> - Renamed the dt-bindings documentation to mstar,msc313e-wdt.yaml
> - Fixed the subject of the first commit
> - Dropped unused dt labels
> 
> Changes since v1:
> - Dropped "depends OF" from Kconfig (not required)
> - Dropped unneeded include files
> - Re-ordered include files
> - Compute timeout_max dynamically from the probe function to avoid
>   an overflow in _start().
> 
> Daniel Palmer (1):
>   watchdog: Add Mstar MSC313e WDT driver
> 
> Romain Perier (2):
>   dt-bindings: watchdog: Add Mstar MSC313e WDT devicetree bindings
>     documentation
>   ARM: dts: mstar: Add watchdog device_node definition
> 
>  .../bindings/watchdog/mstar,msc313e-wdt.yaml  |  40 +++++
>  MAINTAINERS                                   |   1 +
>  arch/arm/boot/dts/mstar-v7.dtsi               |  14 ++
>  drivers/watchdog/Kconfig                      |  12 ++
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/msc313e_wdt.c                | 166 ++++++++++++++++++
>  6 files changed, 234 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/mstar,msc313e-wdt.yaml
>  create mode 100644 drivers/watchdog/msc313e_wdt.c
> 
> -- 
> 2.30.2
> 
