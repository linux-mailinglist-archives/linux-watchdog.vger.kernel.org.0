Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5788043FB0D
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 12:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbhJ2KxJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Oct 2021 06:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbhJ2KxJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Oct 2021 06:53:09 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1E8C061570
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 03:50:40 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id o14so15476587wra.12
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7jkLMvKNyTAc4GX0VDOXVG/3dZb3AJ+QQ/jQUw+T8/I=;
        b=wiNOwjCYeSkkvzSU2H7FCJiuv/sFP7Zg3Ii40KalUaOYxZg4/5sRlXVLRWCxCRaDeU
         e66IL2sKrIOWraDfAazBpx/fI21LU1OhWMCxKZ2Mm/mkM5XZCZjMnMqgkfhnE8iLhM8U
         dNQtbcuHeACsRxezsOWffJAhuz7U4fwurfqWtRAPHMegC5v52lp7z5GblZObJDeT8zSU
         ZuLvTUUDsld2lkBwY9W7hx2QmHMbGKQcx1/Q34VEEQ7bi1YTEc2emFlpOkBf7O/1qt+5
         zQg8GkkfwTHPlmRHE6wX2U37THhYC3FF9ecoElEN4u+qA6JHhEYE/yM7SGqgjlKlLe4I
         OYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7jkLMvKNyTAc4GX0VDOXVG/3dZb3AJ+QQ/jQUw+T8/I=;
        b=X3tg3P1tosADM5zN7jWqJIEW6Uzg7QONqTG5hxbxdwe2VW0Vr4v8cjc+dcb+gLDns+
         mdpbJkRUjWRMttnF1e6W73C4qjYFrX17JmsrjvcGvkw0Y5nouO/P8Xm96LcwhqDYeYcZ
         1OyuOtcYY8tNC3zJ5gs5ZTtZpuebXCBz5MqWRj3e4BOxyCitxlbrRNc6yMYO+BgucNqN
         oB2QN8r02FmziuBSckRm6dzCkD6HD0ROnKMTBq9sDrQ1/7u3ifsl1leMduQq7zzFDjdK
         QxAe5qBeEwinSK7lV1pd6qVAwhcnDb7FvtH0AScd5vAqzmpDhBvXkxDKLSCgR2ETsplK
         bepA==
X-Gm-Message-State: AOAM530UGLTo/5Tn4eajfIbeJbapvRWfR1fnk1Q7PFwUrraibtuM3cDC
        GuTFc+DfFYwTsV5YmR6IO/woPw==
X-Google-Smtp-Source: ABdhPJw8+B7pLqyF2MYLvIoTjZP/Rbgj+8lI3MpC+a2+0pKNTa9Yl+18Ixja3/zdHosG0cbzTxpV+g==
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr13338686wrq.409.1635504639525;
        Fri, 29 Oct 2021 03:50:39 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id n12sm1036598wmd.3.2021.10.29.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 03:50:39 -0700 (PDT)
Date:   Fri, 29 Oct 2021 11:50:37 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/3] watchdog: ux500_wdt: Drop platform data
Message-ID: <YXvR/ZNrjxHZM3pY@google.com>
References: <20210922230947.1864357-1-linus.walleij@linaro.org>
 <20211029103128.GA3165629@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211029103128.GA3165629@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 29 Oct 2021, Guenter Roeck wrote:

> On Thu, Sep 23, 2021 at 01:09:45AM +0200, Linus Walleij wrote:
> > Drop the platform data passing from the PRCMU driver. This platform
> > data was part of the ambition to support more SoCs, which in turn
> > were never mass produced.
> > 
> > Only a name remains of the MFD cell so switch to MFD_CELL_NAME().
> > 
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > Lee: it'd be prefect if you could ACK this so the watchdog people
> > can merge it, it shouldn't collide with any other changes to
> > the PRCMU driver.
> 
> Still waiting for an Ack from Lee to be able to apply this patch
> (and with it the rest of the series) through the watchdog tree.

Apologies for not being clear - this was for the series:

https://lore.kernel.org/all/YWfQt8V2YNMr4t8F@google.com/

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
