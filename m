Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D202537F79
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jun 2019 23:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfFFVWV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Jun 2019 17:22:21 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39984 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbfFFVWU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Jun 2019 17:22:20 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so1418924pla.7;
        Thu, 06 Jun 2019 14:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RBQnY16OoiSU9x2fTbRylbra8bvQfhJHveZ7KsLfXLE=;
        b=r8XX0OP59OQafz2qMA3prFHhtITzIOlZ9tRNin1PaPA5CRz3/Rmq6Gp1R0CCilbiQ5
         9ah41993Yr8w0VBOaqbMcaz5gZrghaXz7dd9TfCi2k0ctANR7Vl7VwL/QtH8BoZL0Ojf
         gAcrDEb4VAuNbzVkL0jjpJzoTmWhj5x4WywG7yijizhplmGQFUkxWAIWZib+N1nvF4C+
         Oks7Dnca+eP8AhqzRHkpXPdFTIEOvRncvW1kFuJrqwUlC86oBSFN1oSRlYashgjYO3AD
         DsFuIRvZzlRrlXmDCjqkNCYlTAAMpmoYRWH5rkTSO+dji/GWII3FLXGZ8+9FtDs3XmbF
         AuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=RBQnY16OoiSU9x2fTbRylbra8bvQfhJHveZ7KsLfXLE=;
        b=NiubWLt12uUebtJ81r7DBcqT+v97M2VdlGTHjQfRgSXwH8QE26x2yFcRLILefGQsK4
         Xek48nIkv109K7EfWk6Bx6Bx7AEtBIHZat8/0uohMda0whaBhJpgiChxdIZuLmQKGbUW
         rMzfEUL619TdnX7b3MMChrsBM/OrDjTL84TFnvvESMCfsfPslMOHXTngXFkY1yDX/lF5
         HDOHEc7P6Ls50iFEkVL9dvoU03FTWo1IRPg2YH2XQfyPp2cus9W78p01XwZT+ue7eyAo
         xhPDreN9mLe2boKlPUhnijKWDXif9j4FcKWV4jBykDSMU9AJ/kjkf4i7tLcGmj/lVgtj
         67uA==
X-Gm-Message-State: APjAAAXtvW4MsU4WjwPv4+BvDCKCQw7iXpcmrrkxV2p0gCVWzKmnt/M0
        U1bRxcjuBXUZrd48x+/UBGQ=
X-Google-Smtp-Source: APXvYqxBi6parEcN6dotMYwWVEm/YadS+PaoRNAtjRDPTr29165cicwhTFOnicMr2GAtIb9XE0WQNA==
X-Received: by 2002:a17:902:2a69:: with SMTP id i96mr43521459plb.108.1559856140254;
        Thu, 06 Jun 2019 14:22:20 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k3sm88985pgo.81.2019.06.06.14.22.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 14:22:19 -0700 (PDT)
Date:   Thu, 6 Jun 2019 14:22:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: meson_wdt: update with SPDX Licence identifier
Message-ID: <20190606212218.GA1578@roeck-us.net>
References: <20190520142847.442-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520142847.442-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, May 20, 2019 at 04:28:47PM +0200, Neil Armstrong wrote:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

This change has been applied system-wide.

Guenter

> ---
>  drivers/watchdog/meson_wdt.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/meson_wdt.c b/drivers/watchdog/meson_wdt.c
> index 01889cef81e1..3389f4c02603 100644
> --- a/drivers/watchdog/meson_wdt.c
> +++ b/drivers/watchdog/meson_wdt.c
> @@ -1,12 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   *      Meson Watchdog Driver
>   *
>   *      Copyright (c) 2014 Carlo Caione
> - *
> - *      This program is free software; you can redistribute it and/or
> - *      modify it under the terms of the GNU General Public License
> - *      as published by the Free Software Foundation; either version
> - *      2 of the License, or (at your option) any later version.
>   */
>  
>  #include <linux/clk.h>
