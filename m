Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDEE313DF23
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2020 16:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgAPPsS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jan 2020 10:48:18 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45718 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgAPPsS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jan 2020 10:48:18 -0500
Received: by mail-pl1-f194.google.com with SMTP id b22so8469937pls.12;
        Thu, 16 Jan 2020 07:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=huTcCeKRdO6T2NesAaGqeynPCc8WvA8tugh/WJ8Dtbc=;
        b=G0x92qOpFp0qKI6nZ7kGQOhD71Zn/VDKWFJJCIrflldCLCzZXOHAORHnXkmDRhvFfy
         5zUGA5yj0/lLifVw4OCSmPfgq29wdN92rwS5addh6NEsEpUCmxii5jch9eJdJuEKH2oD
         CKSWUCQbU1UozBSDGofweLzCC/1HV5/Q1PI6gw4wBFCtwm5HQPV5Y56GaBXgnfcH5ZQj
         2414/2w2MxK10PI3mHJS3cybbwxRPMQVLKh/VjbaMK/B3E3x0RJZ7WrXE2piq3FvhuTr
         20ls3AX5kjhhCCOKeRzNx7oKXw9v3oSQtvs+QHjUrcYBdpFFvCTmmygweiAqCD1T5G8M
         pbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=huTcCeKRdO6T2NesAaGqeynPCc8WvA8tugh/WJ8Dtbc=;
        b=oGCy50e5zpNSkQ8mn32rR8PP+Bk0d5FfgakGuxqizir95ZRasnL1ZsGSYadaYfLM1f
         WBry2ZnKGAzvyBNdZFdmwZOlP94kDtdzF6gn+y6Jz2+5m1djKmDNGUTgi4EHF2goFNRy
         u9Emindl1lIr+DBkulZcR4vPB6n88R266DJ/zuUxLuTO7y+P4MLpLSY4Dw3P/TWAikzT
         oddg5O+3R8OXmYZTrHnn+dagnRyNhPkPWoTDKOOMcmEAD3Hrms64ieR7Z+ROYGDeDZe5
         A1kQxKXIx9fi8iXO9TuPWGJlIj0uuiCeE9h2KrqO/8ozOjNVGhBgX0U25bAYVlFJvdCH
         RPSg==
X-Gm-Message-State: APjAAAXvk/OBEuZzVhalKua5dIXcr7TjIum57dgP+4mtKNZ5JvxfgcX8
        kto8M4pWQ0mhUjNFubmf8rI6l2JN
X-Google-Smtp-Source: APXvYqyf1XdfYZahE1H4voslQkQxT590gcKa4OeO8qRpdhQpm30jdS2BgPlQ4bM5jJxEU4tr8jUqLg==
X-Received: by 2002:a17:90a:246c:: with SMTP id h99mr7613283pje.134.1579189697928;
        Thu, 16 Jan 2020 07:48:17 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s13sm8048976pjp.1.2020.01.16.07.48.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 07:48:17 -0800 (PST)
Date:   Thu, 16 Jan 2020 07:48:15 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: Re: [PATCH 1/9] watchdog: of_xilinx_wdt: Add comment to spinlock
Message-ID: <20200116154815.GA23637@roeck-us.net>
References: <1579181217-31127-1-git-send-email-srinivas.neeli@xilinx.com>
 <1579181217-31127-2-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579181217-31127-2-git-send-email-srinivas.neeli@xilinx.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jan 16, 2020 at 06:56:49PM +0530, Srinivas Neeli wrote:
> From: Srinivas Goud <srinivas.goud@xilinx.com>
> 
> Based on checkpatch every spinlock should be documented.
> The patch is fixing this issue:
> ./scripts/checkpatch.pl --strict -f drivers/watchdog/of_xilinx_wdt.c
> CHECK: spinlock_t definition without comment
> +	spinlock_t spinlock;

One of the most useless feedback messages from checkpatch.

> 
> Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>  drivers/watchdog/of_xilinx_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
> index 7fe4f7c3f7ce..00549164b3d7 100644
> --- a/drivers/watchdog/of_xilinx_wdt.c
> +++ b/drivers/watchdog/of_xilinx_wdt.c
> @@ -40,7 +40,7 @@
>  struct xwdt_device {
>  	void __iomem *base;
>  	u32 wdt_interval;
> -	spinlock_t spinlock;
> +	spinlock_t spinlock; /* spinlock for register handling */

I don't see the added value here. Besides, what does the lock actually do ?
Watchdog drivers are single-open, so it seems quite difficult for any
of the protected functions to be called multiple times. The spinlock doesn't
disable interrupts, so register accesses by other drivers are still possible.
What am I missing ?

Guenter

>  	struct watchdog_device xilinx_wdt_wdd;
>  	struct clk		*clk;
>  };
> -- 
> 2.7.4
> 
