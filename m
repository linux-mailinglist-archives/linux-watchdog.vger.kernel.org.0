Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7AF169808
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Feb 2020 15:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgBWOJZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 23 Feb 2020 09:09:25 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44440 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgBWOJZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 23 Feb 2020 09:09:25 -0500
Received: by mail-pl1-f193.google.com with SMTP id d9so2871001plo.11;
        Sun, 23 Feb 2020 06:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g/zr+nEP7I2sASuRjNOJywWt3IsP3tPOs0T2EdBDfXc=;
        b=dTinCoQthw3yzlMZSlkXQTzhpBqI9dENakVrv9e104Uz2uSLB2ASlb0MU1abXczxg6
         d6nTTYWa6cPdGkfJAB2ZB/KJQx2lct6zxWMho7H5nCVh3EGzgHbid6P6xhxL6gj6q/Xl
         a1lW5uHL5b5jp5I6zGbdhtOT5jh27EgXirsk7UJ2C2hNynZtFGaRcKbunjNlz1Hx7fwa
         0hEBl0xbGtRXJNtv8HjRoc0Ul9PH0QKVix7KI7XMrAournnhK7TeoZHxF7luCCiIW6Gt
         KkdlgvNnWr4QVM0Q3wOyA+Hs+tGQ5aahHJ1oVs32DxZygFYZpSMGrB8QUpmaoSrPy2Ps
         wPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g/zr+nEP7I2sASuRjNOJywWt3IsP3tPOs0T2EdBDfXc=;
        b=mPrRGgEomGBlQNKgO4TTJrzBU2iAj05Kl4ZCm++3OGpPICbK8BeGr9nZNqWGsOf8DK
         GalAcvQnbtVpmFi5ACJBVd8BsKGF+uphpL/iqlTCtt9+blxoiJfjl00+j4emO/fK47Bx
         7TioIB7EAnIf/iEhfeIC2wKbC7yAmuPZAxrBrFNrKppoHSzjs02goWkgTBW58EWSQNoP
         ePiq3+/e+yGu7uZ5jNSzJhHB9BVlOf3fVsELHWfl1Ve1vs642GVEGZ7bEPYTDLYLeiij
         n3nlvzEVPBsOOp2BzP3tdTPP4OMEpridncmGVJFTdSxfXmq9Fp6qsbluhNNjV1HqRr4p
         nVuw==
X-Gm-Message-State: APjAAAVk+oEOysKHJz7L8kSulLfA67/pC0d7wUp7x/DGMsgV9GviXCUz
        JDq2IpEPr2VBk2ngtaLtcinrvPb3
X-Google-Smtp-Source: APXvYqyvK5HE+qPRswwpcQOKaZmgGL5lWnDJTKhwtdAiHzs8HZY7xRDSmviPt4SLhyxUDcC1xd3Frw==
X-Received: by 2002:a17:90a:b381:: with SMTP id e1mr14602135pjr.38.1582466964669;
        Sun, 23 Feb 2020 06:09:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f81sm9353298pfa.118.2020.02.23.06.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2020 06:09:24 -0800 (PST)
Subject: Re: [PATCHv3] watchdog: Add stop_on_reboot parameter to control
 reboot policy
To:     Dmitry Safonov <dima@arista.com>, linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
References: <20200223114939.194754-1-dima@arista.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <c503f828-6a9a-3e38-f69e-db7e7bcf3b70@roeck-us.net>
Date:   Sun, 23 Feb 2020 06:09:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200223114939.194754-1-dima@arista.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/23/20 3:49 AM, Dmitry Safonov wrote:
> Many watchdog drivers use watchdog_stop_on_reboot() helper in order
> to stop the watchdog on system reboot. Unfortunately, this logic is
> coded in driver's probe function and doesn't allows user to decide what
> to do during shutdown/reboot.
> 
> On the other side, Xen and Qemu watchdog drivers (xen_wdt and i6300esb)
> may be configured to either send NMI or turn off/reboot VM as
> the watchdog action. As the kernel may stuck at any state, sending NMIs
> can't reliably reboot the VM.
> 
> At Arista, we benefited from the following set-up: the emulated watchdogs
> trigger VM reset and softdog is set to catch less severe conditions to
> generate vmcore. Just before reboot watchdog's timeout is increased
> to some good-enough value (3 mins). That keeps watchdog always running
> and guarantees that VM doesn't stuck.
> 
> Provide new stop_on_reboot module parameter to let user control
> watchdog's reboot policy.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Dmitry Safonov <dima@arista.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes:
> v3: Make module parameter read-only in runtime (Thanks Guenter for
>      spotting the typo!)
> v2: Add module parameter instead of ioctl()
> 
>   drivers/watchdog/watchdog_core.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 861daf4f37b2..423844757812 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -39,6 +39,10 @@
>   
>   static DEFINE_IDA(watchdog_ida);
>   
> +static int stop_on_reboot = -1;
> +module_param(stop_on_reboot, int, 0444);
> +MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
> +
>   /*
>    * Deferred Registration infrastructure.
>    *
> @@ -254,6 +258,14 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>   		}
>   	}
>   
> +	/* Module parameter to force watchdog policy on reboot. */
> +	if (stop_on_reboot != -1) {
> +		if (stop_on_reboot)
> +			set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> +		else
> +			clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> +	}
> +
>   	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
>   		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
>   
> 

