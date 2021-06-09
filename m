Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3D33A210F
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Jun 2021 01:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhFIX57 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Jun 2021 19:57:59 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:44021 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFIX57 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Jun 2021 19:57:59 -0400
Received: by mail-oi1-f172.google.com with SMTP id x196so101019oif.10;
        Wed, 09 Jun 2021 16:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0BAkC6SDg+gNX9Eg6Cq1bSt7plTJAqywTZpNENH6AqA=;
        b=aD/VDvZoO69WHrj0j5dkqQHbondnOBSIAfssxrd2/9ov+ZHMLRTXfcUJPJqaLKN5li
         IK1ksJ4yG++gLs81C1pA42Y8ThRNjSxAjTc887SX1Y1hpurwlbgYw47k1e0owSpOwWRE
         NbeIuPzJzD3bhbzrnaeIG281j9yAtj/yp0NjhifXLEwOKiP6zSE1XiSbUFtiRDHQv/IH
         VWruU2JRmStOpoc2u3okt2lYVHvZ0KiwRZE/HdeD/PrkXINX0LGcCZS6cHKyQ1463CYo
         sQ7sSm5/6oOFSTZR7ynGEfoIM90zl7IyEmHp8U6vhAHjeHSTqAoj98q4NsYS0tygzbmB
         ucTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=0BAkC6SDg+gNX9Eg6Cq1bSt7plTJAqywTZpNENH6AqA=;
        b=b4530TP4fp8xLMxKkPG6hk4/rG0i7GR4yLgAK8oBpf+PMejw7QkEhQEd0JiPgR3SVr
         cFnJK7wDLRMj+TuZXOaBV3pbqRfQaZE2h1oCpRakCdIGKQrD4CoLjIfiH8Vklk3pVucX
         Kby0kqDOSJS96p/eDMhemvPM4GrqSjua+O3PTFi2Wu1ZUlMZcgif36drIcJVdg2t7CIa
         a1h2OuB2262mKE7+tZiky0UaU8tDdLreKnixn/d0chT/d+4Sp/8NL36a46h5q7+BjD+Y
         MtRKpynZCZS4B6pKirQzAJiYuJtQ6N8hzNWPQwkAqOC3egxwY18LQ+QOIrskzo+V9192
         E8Ag==
X-Gm-Message-State: AOAM532vo5BWIHCiG2gYrzYvagfoeXapJeV2YnX47uwBrbK6ibBIeqWB
        /+MxDAh9RVWOq9TfGE+sK6hmotg6PSE=
X-Google-Smtp-Source: ABdhPJyenjUerRx6o7lhPtXOpcqaJZ+rgXnyiRndEJdjkdChPUvVuiJ9xwcfMDS9esCZquSRqW5srg==
X-Received: by 2002:aca:c302:: with SMTP id t2mr7963850oif.67.1623282888572;
        Wed, 09 Jun 2021 16:54:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 16sm257198oie.33.2021.06.09.16.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 16:54:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 16:54:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: iTCO_wdt: use dev_*() instead of pr_*()
 for logging
Message-ID: <20210609235446.GA2542004@roeck-us.net>
References: <20201117152214.32244-2-info@metux.net>
 <20210609203229.GA2664456@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609203229.GA2664456@bjorn-Precision-5520>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 09, 2021 at 03:32:29PM -0500, Bjorn Helgaas wrote:
> On Tue, Nov 17, 2020 at 04:22:13PM +0100, Enrico Weigelt, metux IT consult wrote:
> > For device log outputs, it's better to have device name / ID
> > prefixed in all messages, so use the proper dev_*() functions here.
> > 
> > Explicit message on module load/unload don't seem to be really helpful
> > (we have other means to check which modules have been loaded), instead
> > just add noise to the kernel log. So, removing them.
> > 
> > Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> 
> I like this patch a lot; thanks for doing it!  It's merged upstream as
> c21172b3a73e ("watchdog: iTCO_wdt: use dev_*() instead of pr_*() for
> logging").
> 
> It looks like there are a couple more pr_err() uses, so I wondered if
> they were missed or skipped intentionally:
> 
>   if (p->smi_res) {
>           /* The TCO logic uses the TCO_EN bit in the SMI_EN register */
>           if (!devm_request_region(dev, p->smi_res->start,
>                                    resource_size(p->smi_res),
>                                    pdev->name)) {
>                   pr_err("I/O address 0x%04llx already in use, device disabled\n",
>                          (u64)SMI_EN(p));
>                   return -EBUSY;
>           }
>   } else if (iTCO_vendorsupport ||
>              turn_SMI_watchdog_clear_off >= p->iTCO_version) {
>           pr_err("SMI I/O resource is missing\n");
>           return -ENODEV;
>   }
> 
The above came in with a recent commit. I suspect they simply got lost,
and they should be converted as well.

Guenter
