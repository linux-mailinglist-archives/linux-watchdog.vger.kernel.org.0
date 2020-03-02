Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD1AE175CCC
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2020 15:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgCBOTs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Mar 2020 09:19:48 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38623 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgCBOTs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Mar 2020 09:19:48 -0500
Received: by mail-pg1-f194.google.com with SMTP id x7so521125pgh.5;
        Mon, 02 Mar 2020 06:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ldz6VYxbURG1sW8v3fwieAF8HOL43xk0HODeVKT9mY8=;
        b=Tqh/UKsX4S8zHti9tgWyvujEQUWFU/MRodEqOdBJRIk4r6sG7zXOQNgG32JnXJufSv
         EfFj4e1osDCiEj5ZMh7zU13oGpelUbN0AO2CU8Z1JQbcVEnkmPq5nsLUaX7cnznVU5Pc
         qh3Ya8SAwtVMTBv2LLWsfR/r8S6PJE1ARDtSJ5bxnArxNnqQu8MwzPgRzDQv0INqk0X3
         tAKnjxH+isCODJ0MQaBcboOZVWfktbXjwkYjSBGp+xq4So1DN+UeXhgt8zYzPWJTiL/s
         PFUmkDz7fpwzvNFknQATdJ26+HXDpDH6TFsX8kgWdsOtZCrfXB0yK90ZV89c6QdNvhWp
         JiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ldz6VYxbURG1sW8v3fwieAF8HOL43xk0HODeVKT9mY8=;
        b=WyeXB2dtr/IB0fq83NUTDrDjMbWy7Cd4PB9MiwJwDMPNEfFvfWsvTdJFIyHLt6CgtW
         8VFMHl6rCqyXGDtUDOXjFD8cBXr0+cs3s1CGyieibA77GMkgXvgal/P4dxxQ1h1NOeIR
         GRQwkQDhohq0kdhmSaeD7SFFLdlBZuycqJr1HoYvUqlbQIAZJ/CGQpUgEQkasPSOWryx
         2XN0t0nSg3Ap048YIjsTwDrQROrijujo1CghU9nFFzQYv1X7UDp/8HTWw56iN87i0oke
         1dHAx11ld/DqHJ99jZdiSvX7jzFdIONQOuYINhQUSShWAl+QBkxMl/xjiTd2CNWmqw9f
         EADA==
X-Gm-Message-State: APjAAAXm3tAG+iKxTmPpU8SgFETLQGWDZSuP47jNqupVJMQne5fTNmeS
        V8RAxqA++s2+eY6O0ZSpv+GEdJQA
X-Google-Smtp-Source: APXvYqxUx/IEn6C8/F8saWnZ1gDAk54vRl8c/4B/E3x7hF/bMp2LuQBNSHA2YSthAaQCHVrLQg51vQ==
X-Received: by 2002:aa7:9a96:: with SMTP id w22mr17971225pfi.210.1583158786789;
        Mon, 02 Mar 2020 06:19:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q66sm22304040pfq.27.2020.03.02.06.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 06:19:45 -0800 (PST)
Subject: Re: [PATCH] watchdog: sbsa_gwdt: disable watchdog when system panic
 was trigged by signal WS0
To:     luanshi <zhangliguang@linux.alibaba.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1583138781-40936-1-git-send-email-zhangliguang@linux.alibaba.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9018b040-d958-4745-e2b9-a9a6c75dd4e5@roeck-us.net>
Date:   Mon, 2 Mar 2020 06:19:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1583138781-40936-1-git-send-email-zhangliguang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/2/20 12:46 AM, luanshi wrote:
> When ARM SBSA Generic Watchdog worked in the two stages mode by setting
> module parameter action to 1, when the timeout is reached, the first
> signal (WS0) will trigger panic. Before panic, the value of register
> SBSA_GWDT_WCS was 0x0, after panic and system startup, the value of
> register SBSA_GWDT_WCS was 0x7, status bits SBSA_GWDT_WCS_EN
> SBSA_GWDT_WCS_WS0 and SBSA_GWDT_WCS_WS1 were set, this will increase the
> refcnt of module sbsa_gwdt by function watchdog_cdev_register because
> flag WDOG_HW_RUNNING was set, so we cannot unload the module again. To be
> consistent with reboot, watchdog should be disabled when system panic was
> trigged by signal(WS0).
> 
> Signed-off-by: Liguang Zhang <zhangliguang@linux.alibaba.com>
> ---
>  drivers/watchdog/sbsa_gwdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index f0f1e3b..6bee5bb 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -194,6 +194,12 @@ static int sbsa_gwdt_stop(struct watchdog_device *wdd)
>  
>  static irqreturn_t sbsa_gwdt_interrupt(int irq, void *dev_id)
>  {
> +	struct sbsa_gwdt *gwdt = (struct sbsa_gwdt *)dev_id;
> +	struct watchdog_device *wdd = &gwdt->wdd;
> +
> +	if (wdd->ops->stop)
> +		wdd->ops->stop(wdd);
> +
>  	panic(WATCHDOG_NAME " timeout");
>  
>  	return IRQ_HANDLED;
> 

This prevents the 2nd stage (the actual system reset) from working if the panic
call gets stuck and doesn't result in a reboot. I don't think it is a good idea
to do that. It effectively disables the second stage.

Ultimately, this is a bios problem; the bios/rommon should have stopped
the watchdog when rebooting. If you don't want the watchdog to run on startup,
you have to add a module parameter to disable the watchdog if it is running
at probe time.

Guenter
