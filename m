Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C1C45A74B
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Nov 2021 17:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238817AbhKWQP7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Nov 2021 11:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238814AbhKWQP6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Nov 2021 11:15:58 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51675C061714;
        Tue, 23 Nov 2021 08:12:50 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id a11-20020a4ad1cb000000b002c2657270a0so7618147oos.8;
        Tue, 23 Nov 2021 08:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x3pTkMBRWPoucw3+uv5s5/MdfOus2wzreQRdSu6RUN4=;
        b=U43BWquqfx/uZQbwONDvjORG8korIBBfnaSmgwhWZER0df4erdqd2WUO14hrrL+LVZ
         nne+eiPmoHu7vkIPtp9pT5wELn45FCLFl/2uSdKgSbmHaCFVA3kRhUgZ8PFgP+cvLC0k
         FBNxCxDtfdKQ3B09CwKCPNS7vAwCY4v23PC5+GBaLPVKQqzLVTT0FGsi7bIaZQVB+I2J
         +/togf0OrDDREM26Ur+gNpfPy+x4UbTlLLWTcXiSZUVe1X9u0AFJcongFsPWeobVV3as
         v/o9zw+Bo2cooPp2+yzI7BCJbLNNz8smS5ZAVwZDTf48n6z2fyFPHz+5/BtYSaJgdB+s
         +8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=x3pTkMBRWPoucw3+uv5s5/MdfOus2wzreQRdSu6RUN4=;
        b=auQz0BEqruaJkkwGl6aMTC/SM81kS/3CHFNphoJIEXDsTXYqLkEpILs0On2YNjD5Yv
         TUbzEq1LnMZSdkgEPOCozf6tEf+IBYTkmFKFXdF5NPTUdbG4TvGcdmBNnyZd5eW2yTSX
         bs03fwTzdij7khy6jK6oatV1mJPugbEFlJblhwatXRsHa5U6lnCdKdVhQgBqDquCteGV
         U0qBJoHRAJ06hINjkl56m65sNQVEdAGGEIi4Edy/SA2/sH0sJbWFUvjU3gQT3JmIm2V6
         7RAsUejuT7E1U1Q5HkQrbVsb5jDetz2jLSwNSujz5GuRZs4oRHJLvCGv4q71WqvKoQLU
         Y+3A==
X-Gm-Message-State: AOAM530YniNIf10iTyPfq3dmV5FtdTAOun3tCgZ1DtD5lvfwYXe5ZWA6
        x/Fh7gBTEDVRdkboTKnxM/E=
X-Google-Smtp-Source: ABdhPJzQ+A5xkRFntGL8OIIeSLsQm6w+7XJ5uSFNKkNcGEMxsD4xykQ2eK6ajrbS3Vjr1bK4xnlEVQ==
X-Received: by 2002:a4a:a88d:: with SMTP id q13mr3854364oom.5.1637683969719;
        Tue, 23 Nov 2021 08:12:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b22sm2630760oib.41.2021.11.23.08.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:12:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 23 Nov 2021 08:12:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v4 12/12] watchdog: s3c2410: Add Exynos850 support
Message-ID: <20211123161247.GD2326185@roeck-us.net>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
 <20211121165647.26706-13-semen.protsenko@linaro.org>
 <CAPLW+4myd2JDEKmv+E1HsxK_yNaLC+iUWSo99+Lqujof3MGpCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPLW+4myd2JDEKmv+E1HsxK_yNaLC+iUWSo99+Lqujof3MGpCg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 22, 2021 at 05:14:35PM +0200, Sam Protsenko wrote:
> On Sun, 21 Nov 2021 at 18:57, Sam Protsenko <semen.protsenko@linaro.org> wrote:
> >
> > Exynos850 is a bit different from SoCs already supported in WDT driver:
> >   - AUTOMATIC_WDT_RESET_DISABLE register is removed, so its value is
> >     always 0; .disable_auto_reset callback is not set for that reason
> >   - MASK_WDT_RESET_REQUEST register is replaced with
> >     CLUSTERx_NONCPU_IN_EN register; instead of masking (disabling) WDT
> >     reset interrupt it's now enabled with the same value; .mask_reset
> >     callback is reused for that functionality though
> >   - To make WDT functional, WDT counter needs to be enabled in
> >     CLUSTERx_NONCPU_OUT register; it's done using .enable_counter
> >     callback
> >
> > Also Exynos850 has two CPU clusters, each has its own dedicated WDT
> > instance. Different PMU registers and bits are used for each cluster. So
> > driver data is now modified in probe, adding needed info depending on
> > cluster index passed from device tree.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> 
> Hi Guenter,
> 
> I've resent the whole series, but I can see you already applied my
> previous series to your watchdog-next branch. So this patch is the
> only one that actually changed in the whole series (with fixes for
> 0-day warning).
> 

No worries. What you did is ok.

Guenter
