Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D2B47171F
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Dec 2021 23:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbhLKWVR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Dec 2021 17:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhLKWVR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Dec 2021 17:21:17 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3633EC061714;
        Sat, 11 Dec 2021 14:21:17 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso13399277ota.5;
        Sat, 11 Dec 2021 14:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1HIJrKFo0Uu1bw3AG0MQW+64GpOvanRRdRoeIXAV0hI=;
        b=Jn6NxRmVW47bMvzgEWBAR80fk13XejLxgQFBLIR043E+FTS2+sh9caCGY3mAFXEUvX
         rLDbxceT+1WitsLbbv8OEJU4cG/IY5/Znp2hmhh2qCsEUODxRHUhAAYcuDB5a/gho1U7
         Jv29xIbqyad/TvdsVtsMMNVE80T9mbEwtMvYqw/HaKM9sM3w7SQ2OWjGi6aUIpRctXDT
         45Be24Jui6NziL6GfNqCmws90MdACJUFg+rIIAWLQSGK12RKOXMpAyX8gSBLY/Nymyg7
         L2dWswEnIgi5n+iPShjlaVtb5GE2k2rWrXtfXsa3XAvlTkwkley6tib5+P2LH5VtWhqK
         HNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1HIJrKFo0Uu1bw3AG0MQW+64GpOvanRRdRoeIXAV0hI=;
        b=whnPTZlL5kVhUZlsfT6HRqWBODaIq4aXUfzP32VSMCPk33NR4+Aw2SRl3w0AYj6Q+G
         7KSxx4CgqHBsanaSfgbq/m4SCRDlbdtOGzPxWoqWnd0Ccsg+BfrJglbK9KS1/eG/5lGQ
         nv9L6S/46epfUtum38xtaUHUHFh9DgCy4p2z0vjlD2TK+leQcV6Mf9Gd/niSgMh+R7zq
         Vw0fcjA0ZbCu8n/JxEyMVaj4kuk+s5pkRAqBMr7+OgFvAQgdL5AfDFeeHfbp6sRdbjV8
         Mv+LLWxB1fN1kthP6IRe3OBM0H32u5KR1rx25uStbo43x1UGbCsuOJzLklhhZPcBTx3m
         3eyw==
X-Gm-Message-State: AOAM530uIwsXwdKWi+Csq98KhvHC16lRa9OKh3bf4LIQURt1R8TamXk3
        Sp0RjinwqN8Qin5deAd6bP3q1Ez2zKY=
X-Google-Smtp-Source: ABdhPJxQAtXuHeIILXMEpCS3edUYsiASygX85fAD6A2af5kcRw2U65b5LN3B2qxK/rAiuLz5HbGVWA==
X-Received: by 2002:a9d:61c1:: with SMTP id h1mr17891501otk.27.1639261276277;
        Sat, 11 Dec 2021 14:21:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w18sm1302893otm.1.2021.12.11.14.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 14:21:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/4] watchdog: rzg2l_wdt: Fix 32bit overflow issue
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ba572513-0dd5-f95e-2bfc-7fe12153cc03@roeck-us.net>
Date:   Sat, 11 Dec 2021 14:21:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/11/21 1:26 PM, Biju Das wrote:
> The value of timer_cycle_us can be 0 due to 32bit overflow.
> For eg:- If we assign the counter value "0xfff" for computing
> maxval.
> 
> This patch fixes this issue by appending ULL to 1024, so that
> it is promoted to 64bit.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/rzg2l_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 6b426df34fd6..96f2a018ab62 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -53,7 +53,7 @@ static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv)
>   
>   static u32 rzg2l_wdt_get_cycle_usec(unsigned long cycle, u32 wdttime)
>   {
> -	u64 timer_cycle_us = 1024 * 1024 * (wdttime + 1) * MICRO;
> +	u64 timer_cycle_us = 1024 * 1024ULL * (wdttime + 1) * MICRO;
>   
>   	return div64_ul(timer_cycle_us, cycle);
>   }
> 

