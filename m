Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3251C2D0AFF
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Dec 2020 08:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgLGHO2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Dec 2020 02:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgLGHO2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Dec 2020 02:14:28 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5CFC061A4F;
        Sun,  6 Dec 2020 23:13:47 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id y74so14354062oia.11;
        Sun, 06 Dec 2020 23:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PQPYEvLRrTwSFcvA04hUIDPjTx6k8LRCQZ0ROniqN0Y=;
        b=YtJLeR1CFdMqbDyy+F2d4hGKjjDev5p5l4J2qNcClVafmYE4ZGpxhXJAXD0mCWRQ2Y
         xEhZxr7yxWA4Uw72DbsEDqPb0Z+ETIkeVX5Ln8/foX8xC8L/sh/6ptBqU93IqPenbBzs
         KH7DiA4QF+kbfoLXIqf+lhzlANOC8FA53VihWdufQuo23cm/gry2wGE7JYBGpxrys9kw
         k/OXm844p1LWj92Esj8xXxnIikAOPqcdx7QFFg9REbD27QAp4Ppb8zeXBzF87zJPVoxY
         btgxiSDa7s2zPRLM8Fw/uhr6j/RRq6ZGpn4VNHtcoElB2RmybUg/4k4fpT8lRCkANerq
         CgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=PQPYEvLRrTwSFcvA04hUIDPjTx6k8LRCQZ0ROniqN0Y=;
        b=S/yUJ9Y2k0ZJKf/EPI1NTU/kbjezHWMFgdXtrn/uQRBjhOnrt2G8RduW3snx6SYdUd
         fb5wf57T9WQs+NTtwFeg87TZKWRYCjuBvHDqoPZGn9snh3DuxWxNnimOJHL9ERA1yGLI
         JWeZhvRY0uilhU6EDa1RgbeJVg4Mc9IhSm32X49IMmHteRCqPIp4n8gYN354H4u4vWJZ
         kXcqbBhrOixKWodrB+ir46+kTCp+OTUklnnA/XnOYhY4IqAnZzKLsmATdLz193pG1WLO
         MmEG5CqIBFIsZaHZe8kX1I0buRnnWqakD5z6izX0HAQsOanXkgHXgZw+hAZq6/yImk3T
         e1uA==
X-Gm-Message-State: AOAM531pnsnwPgO+i4CxDwgflxrYsR3dwU2n3BLNQ5/H6Wk/V10IPV/g
        4oZ++oFt/2iP2eHSj15FElw06rCIUGk=
X-Google-Smtp-Source: ABdhPJw88XAyZvqaT847kUA8RIc4TiApi/pxJSw6Zu77/VEKazUwDZIEUd1DkHNVwZprJX/XaV047g==
X-Received: by 2002:aca:ba86:: with SMTP id k128mr11413150oif.9.1607325227004;
        Sun, 06 Dec 2020 23:13:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e1sm2181695oib.11.2020.12.06.23.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Dec 2020 23:13:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: qcom: Avoid context switch in restart handler
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        wim@linux-watchdog.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201207060005.21293-1-manivannan.sadhasivam@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <c2ba5062-3274-e706-3e43-cb2ca6919154@roeck-us.net>
Date:   Sun, 6 Dec 2020 23:13:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207060005.21293-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/6/20 10:00 PM, Manivannan Sadhasivam wrote:
> The use of msleep() in the restart handler will cause scheduler to
> induce a context switch which is not desirable. This generates below
> warning on SDX55 when WDT is the only available restart source:
> 
> [   39.800188] reboot: Restarting system
> [   39.804115] ------------[ cut here ]------------
> [   39.807855] WARNING: CPU: 0 PID: 678 at kernel/rcu/tree_plugin.h:297 rcu_note_context_switch+0x190/0x764
> [   39.812538] Modules linked in:
> [   39.821954] CPU: 0 PID: 678 Comm: reboot Not tainted 5.10.0-rc1-00063-g33a9990d1d66-dirty #47
> [   39.824854] Hardware name: Generic DT based system
> [   39.833470] [<c0310fbc>] (unwind_backtrace) from [<c030c544>] (show_stack+0x10/0x14)
> [   39.838154] [<c030c544>] (show_stack) from [<c0c218f0>] (dump_stack+0x8c/0xa0)
> [   39.846049] [<c0c218f0>] (dump_stack) from [<c0322f80>] (__warn+0xd8/0xf0)
> [   39.853058] [<c0322f80>] (__warn) from [<c0c1dc08>] (warn_slowpath_fmt+0x64/0xc8)
> [   39.859925] [<c0c1dc08>] (warn_slowpath_fmt) from [<c038b6f4>] (rcu_note_context_switch+0x190/0x764)
> [   39.867503] [<c038b6f4>] (rcu_note_context_switch) from [<c0c2aa3c>] (__schedule+0x84/0x640)
> [   39.876685] [<c0c2aa3c>] (__schedule) from [<c0c2b050>] (schedule+0x58/0x10c)
> [   39.885095] [<c0c2b050>] (schedule) from [<c0c2eed0>] (schedule_timeout+0x1e8/0x3d4)
> [   39.892135] [<c0c2eed0>] (schedule_timeout) from [<c039ad40>] (msleep+0x2c/0x38)
> [   39.899947] [<c039ad40>] (msleep) from [<c0a59d0c>] (qcom_wdt_restart+0xc4/0xcc)
> [   39.907319] [<c0a59d0c>] (qcom_wdt_restart) from [<c0a58290>] (watchdog_restart_notifier+0x18/0x28)
> [   39.914715] [<c0a58290>] (watchdog_restart_notifier) from [<c03468e0>] (atomic_notifier_call_chain+0x60/0x84)
> [   39.923487] [<c03468e0>] (atomic_notifier_call_chain) from [<c030ae64>] (machine_restart+0x78/0x7c)
> [   39.933551] [<c030ae64>] (machine_restart) from [<c0348048>] (__do_sys_reboot+0xdc/0x1e0)
> [   39.942397] [<c0348048>] (__do_sys_reboot) from [<c0300060>] (ret_fast_syscall+0x0/0x54)
> [   39.950721] Exception stack(0xc3e0bfa8 to 0xc3e0bff0)
> [   39.958855] bfa0:                   0001221c bed2fe24 fee1dead 28121969 01234567 00000000
> [   39.963832] bfc0: 0001221c bed2fe24 00000003 00000058 000225e0 00000000 00000000 00000000
> [   39.971985] bfe0: b6e62560 bed2fc84 00010fd8 b6e62580
> [   39.980124] ---[ end trace 3f578288bad866e4 ]---
> 
> Hence, replace msleep() with mdelay() to fix this issue.
> 
> Fixes: 05e487d905ab ("watchdog: qcom: register a restart notifier")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/qcom-wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index ab7465d186fd..cdf754233e53 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -148,7 +148,7 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  	 */
>  	wmb();
>  
> -	msleep(150);
> +	mdelay(150);
>  	return 0;
>  }
>  
> 

