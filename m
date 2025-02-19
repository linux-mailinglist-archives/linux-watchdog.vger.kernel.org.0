Return-Path: <linux-watchdog+bounces-2968-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDFDA3B02F
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 04:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F08E0188C890
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 03:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43F6189F3B;
	Wed, 19 Feb 2025 03:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="CbxKnW/y"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EAA8C0B;
	Wed, 19 Feb 2025 03:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739937101; cv=none; b=otD65SI0Zuhz5dA9naYFwDISmmT3pvnXCpTyvGGBKy+LkZPNRb6I2YsJl6Ooc2IVTs50iyIOfon86ZIP1sMcN07UJp1ammGFf0nMH8GgbvW1BaFvTby92xdISP18eZuGroCPqT3G1QTM6buP+ifqCQwNVnGs7ZsXWVgU51hB0B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739937101; c=relaxed/simple;
	bh=nJY1vQijPZj33lw0t/1BnRtdtfh0cZ6/GjPKQqy2/M0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BbheLRBlshWOnVU46N+8P4CfdeeeL7gf/TsdlAKXdGkcq7LzPbSSiOlt0C5Y+8nf/1K+EuMYc80njN9Uy10sfUKEfGgDAMe2BYdnsFEoS+BrTsxm6znHk7Wbx+cV+bK2EpOxl4sEEs5uTGL4dOLIJTY5PUhDKEAI4FNGC8gvXR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=CbxKnW/y; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739937086; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=gLDIcoH8g0PVChUT3kwRLObvHSuon6W2GBImNuIMuVc=;
	b=CbxKnW/yiHz+YEnMPqZug6Gq+iMBaTOTtwzW3qasRVsn8vJrY+/R9To066qv6A8v3vb35LmVTrsTavvREl56X7u2ENIb0GLmOUy/bucUL8KhYfXOgD3NM8EEkktVGx0kzM8UniVlEq2T+Guz5HpQgw01zvMk7yKtFaj0ObA7GRo=
Received: from 30.221.144.226(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPnn0O9_1739937085 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Feb 2025 11:51:26 +0800
Message-ID: <5de1e473-9d90-458b-b739-9e912c71febd@linux.alibaba.com>
Date: Wed, 19 Feb 2025 11:51:24 +0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
From: Heyi Guo <guoheyi@linux.alibaba.com>
To: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eddie James <eajames@linux.ibm.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
 <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
 <7e2c5f2c-d07a-472c-aae5-6b639a144d88@linux.alibaba.com>
Content-Language: en-US
In-Reply-To: <7e2c5f2c-d07a-472c-aae5-6b639a144d88@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Really sorry for this mail and previous noisy mails; my thunderbird 
client must be misconfigured to send out mail for command + s shortcut 
when I wanted to save draft...

Heyi

On 2025/2/19 11:40, Heyi Guo wrote:
> Hi Guenter,
>
> Thanks for your comments.
>
> On 2025/2/18 13:33, Guenter Roeck wrote:
> > On 2/17/25 19:16, Heyi Guo wrote:
> >> Aspeed watchdog uses counting down logic, so the value set to register
> >> should be the value of subtracting pretimeout from total timeout.
> >>
> >> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
> >>
> >> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> >>
> >> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> >> Cc: Guenter Roeck <linux@roeck-us.net>
> >> Cc: Joel Stanley <joel@jms.id.au>
> >> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> >> Cc: Eddie James <eajames@linux.ibm.com>
> >> ---
> >>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> >> index b4773a6aaf8c..520d8aba12a5 100644
> >> --- a/drivers/watchdog/aspeed_wdt.c
> >> +++ b/drivers/watchdog/aspeed_wdt.c
> >> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct 
> >> watchdog_device *wdd,
> >>       u32 actual = pretimeout * WDT_RATE_1MHZ;
> >>       u32 s = wdt->cfg->irq_shift;
> >>       u32 m = wdt->cfg->irq_mask;
> >> +    u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
> >> +
> >
> > It is unusual to use a register value here and not the configured timeout
> > value. I would have assumed that pretimeout is compared against wdt->timout,
> > not against the register value, and that the multiplication with WDT_RATE_1MHZ
> > is done after validation. This needs an explanation.
> It was supposed to be a straight-forward way to check if the pretimeout value is
> supported by the hardware. I can change to wdt->timeout if it is better.
>
> Further, in the case of wdt->timeout > max_hw_heartbeat_ms, shall we restrict
> the pretimeout to be larger than wdt->timeout - max_hw_heartbeat_ms  / 2? For
> the watchdog_kworker works in max_hw_heartbeat_ms  / 2 interval, pretimeout
> event may be triggered unexpected when watchdog is not pinged in
> (max_hw_heartbeat_ms - (timeout - pretimeout)).
>
> >
> >> +    if (actual >= reload)
> >> +        return -EINVAL;
> >> +
> >
> > On top of that, you'll also need to explain why watchdog_pretimeout_invalid()
> > and with it the validation in watchdog_set_pretimeout() does not work for this
> > watchdog and why this extra validation is necessary.
> watchdog_pretimeout_invalid() will return false if wdt->timeout == 0, but we
> can't determine the hardware pretimeout value if timeout == 0 here.
> >
> > Guenter
> >
> >> +    /* watchdog timer is counting down */
> >> +    actual = reload - actual;
> >>         wdd->pretimeout = pretimeout;
> >>       wdt->ctrl &= ~m;

