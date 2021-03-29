Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB88034D9C0
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 23:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhC2Vyr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 17:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbhC2Vyi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 17:54:38 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE286C061574;
        Mon, 29 Mar 2021 14:54:37 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 91-20020a9d08640000b0290237d9c40382so13687058oty.12;
        Mon, 29 Mar 2021 14:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=63+vlF2FjphVqZ6hemoPd354Yk89yRE4dhfoglq3rLs=;
        b=RkDS4kjN+WfaRpqGOJ06NLL4zUl1dM5zR2/LIUQmceT/UIQ3ZeQ50x2b0by6QhZ2vp
         xxTQwCWZ9c5LuaQm4c/iweL+K8ftLoMshVG1aksY7e9bHfCkazzWTmoeSORcdGYnTgxY
         u24vil+nPbSc2Q2e51+sIE5zn4fXoBr1tEAsiClb0gQrHaXEFjcDUwNfzNRIox7oHT0L
         8W7iIp9U1R/RccI/RooBBREU6Rh3M+HEBAWQh8t8FdsVcC3c/wbtc7moabmnOOADnm0u
         w5BtIE2KYRhajdvMvMs6K3eeNyMKGtymdlMxRkdxpS6Or9s0xe89mpsfGHiwyg5ck7Eo
         SCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=63+vlF2FjphVqZ6hemoPd354Yk89yRE4dhfoglq3rLs=;
        b=C/xrDA1Anc9Q/8SAG1Wv9Uxq/liBZyzx3RkSMymENu6pDn5UnSqkwwMcTtuHCFWgcG
         FASNkrD15OKYKDUiWd3Qv/x39CFECLLbvGJ1un1oVYPWqfPVxPbOO+zarCVF7qV4GTG3
         axxuzTGdlj80aTwTiKI13SiwONSxdWYromdpwpbJdJoerZbXSZ2bZvXpcRiIhz2VbfRk
         COCRGdO2dq/0/PJgOvsUXf5mMKZfJ9ixs2ajuwl/9RKG4+nuRe0Z0gB4BeOZhhiJn7aO
         97hh5xN8Yl3UknxvyvWYTSRqi6E5aOlnEVjoLDGemuN9YRmEZkCZdIOPVLuuYZmfog7r
         StCg==
X-Gm-Message-State: AOAM531Y9wIeaePYtMoc5h4BsxQNQUK6Nk650W7rrVEHEGsjUDHjxrgV
        +7y/DyB8QkI05mst7FFrw3alAr8BD00=
X-Google-Smtp-Source: ABdhPJyZFThaJGebeSuNpXW/oKIb0V/vfeY/u3VpBNTOcLzgvfmnYpr1DLbYTgiBegvTCScvnMHiYw==
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr25360898otb.128.1617054877444;
        Mon, 29 Mar 2021 14:54:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f29sm4782673ots.22.2021.03.29.14.54.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Mar 2021 14:54:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 29 Mar 2021 14:54:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     shubhraj@xilinx.com, sgoud@xilinx.com, michal.simek@xilinx.com,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@xilinx.com,
        Srinivas Goud <srinivas.goud@xilinx.com>
Subject: Re: [PATCH V2 2/5] watchdog: of_xilinx_wdt: Used BIT macro
Message-ID: <20210329215435.GI220164@roeck-us.net>
References: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
 <20210329161939.37680-3-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329161939.37680-3-srinivas.neeli@xilinx.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Mar 29, 2021 at 09:49:36PM +0530, Srinivas Neeli wrote:
> From: Srinivas Goud <srinivas.goud@xilinx.com>
> 
> Used BIT macro instead of mask value.
> 
> Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in V2:
> -Included bits.h header file.
> ---
>  drivers/watchdog/of_xilinx_wdt.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
> index 00549164b3d7..f76ec56859a4 100644
> --- a/drivers/watchdog/of_xilinx_wdt.c
> +++ b/drivers/watchdog/of_xilinx_wdt.c
> @@ -6,6 +6,7 @@
>   * (C) Copyright 2011 (Alejandro Cabrera <aldaya@gmail.com>)
>   */
>  
> +#include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/module.h>
> @@ -24,12 +25,12 @@
>  #define XWT_TBR_OFFSET      0x8 /* Timebase Register Offset */
>  
>  /* Control/Status Register Masks  */
> -#define XWT_CSR0_WRS_MASK   0x00000008 /* Reset status */
> -#define XWT_CSR0_WDS_MASK   0x00000004 /* Timer state  */
> -#define XWT_CSR0_EWDT1_MASK 0x00000002 /* Enable bit 1 */
> +#define XWT_CSR0_WRS_MASK	BIT(3) /* Reset status */
> +#define XWT_CSR0_WDS_MASK	BIT(2) /* Timer state  */
> +#define XWT_CSR0_EWDT1_MASK	BIT(1) /* Enable bit 1 */
>  
>  /* Control/Status Register 0/1 bits  */
> -#define XWT_CSRX_EWDT2_MASK 0x00000001 /* Enable bit 2 */
> +#define XWT_CSRX_EWDT2_MASK	BIT(0) /* Enable bit 2 */
>  
>  /* SelfTest constants */
>  #define XWT_MAX_SELFTEST_LOOP_COUNT 0x00010000
> -- 
> 2.9.1
> 
