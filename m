Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7885F13DC29
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2020 14:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgAPNfd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jan 2020 08:35:33 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53622 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgAPNfc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jan 2020 08:35:32 -0500
Received: by mail-wm1-f66.google.com with SMTP id m24so3786628wmc.3
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Jan 2020 05:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ex5iQAOgOE6sJdpP0UDJP/wplcXOALsRuy3uUtlLaZk=;
        b=qvE1YVwT35KAeibCSPNMT/6IWonjdnLnAq1kCZSEo2b6CAJEN9devCVU4H5nrBg2rO
         v4d7PuV0IkaKNwVaPYX6jabBbx/jR9M39wGOm+HZHZNqIgGZN76fsJvUlDZufuLHPvOJ
         HXr/9CHED1bnmgkT9sgFnuN1mKu7ErycVEgs83sk7SIZ2GoCxuZTB1LUP7Luz76nf7oe
         +cfe3FbC79HZVuUG7Yj315LHG7QVX3BJoTY/1cLlNnHpW2KyYbDRQMYehIQ4UW/9qX+M
         37YsSC5z93n/8D+dDEAGa0xl9vvuSt9ruOiCzeE2BTKLh6bs2lxvVksLKYBVwmUurDHz
         CowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ex5iQAOgOE6sJdpP0UDJP/wplcXOALsRuy3uUtlLaZk=;
        b=kpDJtXdwkzaKLYlQ+tyXtmML3gSGNGpRyeg/X0S/9KkdvbfSEnUiyW91Z148igwAQg
         5WvY/zOD1DNbA4PTsqoab+35ZeQQttfHlLQK9jNca+SgUjvVMTWhAi4ob3DEnmbuiB6J
         AtoXWtZMa4zgCqptXOhP2b3I2qxppGCCXI75DBoZqlTfrHY9H4SGF0ynwI2QlIacMZSs
         Up3eQY/Sq3qdqG+rHP7oZUQ7Bz3Smg2/EpAPvgEekaanmTyMt6y7PJrzww1sYIdLRHsm
         cDPBfSzoPSAQ/n3DhV3gVFqrQtXxrwyLWa06iZWsfKPcVFIqcLiZFPm/6jU7S2Hkcebq
         UAiQ==
X-Gm-Message-State: APjAAAWdRwcFWfCPRy4VSmZvTT5q9ckKeRT6i9OvQMqshJhM9kNQU7jW
        Xfr9wrXb4cRRiR/sihUfGlYk5Q==
X-Google-Smtp-Source: APXvYqzGsGr1esnWAtuowtgwjETYSUMAmmdt6JTJvoDok/p5abyr1h1lybNOYRUwc3ulCQlDtT9X5g==
X-Received: by 2002:a7b:c957:: with SMTP id i23mr6217830wml.49.1579181730878;
        Thu, 16 Jan 2020 05:35:30 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id u18sm28884904wrt.26.2020.01.16.05.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 05:35:30 -0800 (PST)
Date:   Thu, 16 Jan 2020 13:35:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, linux@roeck-us.net,
        robh+dt@kernel.org, stwiss.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/3] mfd: da9062: fix watchdog compatible string
Message-ID: <20200116133546.GR325@dell>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200108095704.23233-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 08 Jan 2020, Marco Felsch wrote:

> The watchdog driver compatible is "dlg,da9062-watchdog" and not
> "dlg,da9062-wdt". Therefore the mfd-core can't populate the of_node and
> fwnode. As result the watchdog driver can't parse the devicetree.
> 
> Fixes: 9b40b030c4ad ("mfd: da9062: Supply core driver")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/mfd/da9062-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
