Return-Path: <linux-watchdog+bounces-2556-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30609EE00B
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 08:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 127B328124F
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 07:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FC6209F48;
	Thu, 12 Dec 2024 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YhgXptoL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEAA13BADF;
	Thu, 12 Dec 2024 07:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987639; cv=none; b=BCvFqltYxy0yjjwCmB4fm+oLRTsPkiCsn+g2X5Y1rTsXih7fI1m7n3P9/3T+PDLR/BB4vK7we7fAYP0kvKRdOu2s+/4d8FGAo7098Gjf7Nu52/E49YMR3eeefU1Py6WlwDbuTg9P1pSwA/a6VCf/idAzp5MmYcA01ZtfSV27ucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987639; c=relaxed/simple;
	bh=G+81i7czaWvBtBgCrJB7Z0BcwFOVSduOqU0gpDjhxi8=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=edDOX1pRxv9/GNdsVrgMgozlXG1xb44xRBUfx8MrT/7REKv87sFQqFmN2KfLdC2vs5gHt+PE/NnbU7EP5C51Ma1um6d8RiQLkWqIFbGjo1YBSDCsqdL6+ONr1VvmibwdL7Tv3NMsnhiAE5CYIGnK0H5GY/IMDxWws1TleLJZLKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=YhgXptoL; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id LdOGtCMF9jBR6LdOGtUv3n; Thu, 12 Dec 2024 08:13:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733987627;
	bh=zM4ll0zQlMuj2VNY5t2n4Bpl5mQ/75H/P9Ox86HuePg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=YhgXptoL4QxmjnYJE5S9+leK+pyT1xMkoNN9ejRlFtAVdovClaTNG0kJdDzpMEM4x
	 m9lWsSwZ7Lett7CyOxgVL7rd+RAHa6MO6BaFFd9uuM5H2eUbJcnmzlaLjFlowx8wJM
	 Wk8VgVFDpMmDSnRgNM0Zw1ygPi72/il912etepMKC+you2AvTrlI/uJuXliG9N+rYU
	 iic9Q474WQoZyx08i5g7kQQ7W1nvzZU/rhAC3fO/CHlvBB7mymLd1tZvqoSgjzSMTL
	 nh+TAFOfQ05r2uCPrOl7CvcjI82KVX0tFOojzFp9iY4ixv5JKDN/1b5Xj1XZ5eA65e
	 xxa3Y8IUJUUTg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 12 Dec 2024 08:13:47 +0100
X-ME-IP: 90.11.132.44
Message-ID: <55411d5c-4167-4f69-9d5b-071764f44ace@wanadoo.fr>
Date: Thu, 12 Dec 2024 08:13:39 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-2-tmyu0@nuvoton.com>
 <47f720f8-90d7-4444-bfde-fb76ec2a2f0f@wanadoo.fr>
 <CAOoeyxXC5zj5R1qV-WSakJmh_q8vK0oh_sjg1VZK=dvhaZdYCw@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, tmyu0@nuvoton.com,
 lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
 linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com
In-Reply-To: <CAOoeyxXC5zj5R1qV-WSakJmh_q8vK0oh_sjg1VZK=dvhaZdYCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 12/12/2024 à 08:01, Ming Yu a écrit :
> Dear Christophe,
> 
> Thank you for your comments,
> 
> Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org> 於 2024年12月12日 週四 上午12:44寫道：
>>
>>> +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
>>> +                  u16 length, void *buf)
>>> +{
>>> +     struct nct6694_cmd_header *cmd_header = nct6694->cmd_header;
>>> +     struct nct6694_response_header *response_header = nct6694->response_header;
>>> +     struct usb_device *udev = nct6694->udev;
>>> +     int tx_len, rx_len, ret;
>>> +
>>> +     guard(mutex)(&nct6694->access_lock);
>>
>> Nitpick: This could be moved a few lines below, should it still comply
>> with your coding style.
>>
> 
> I think the lock should be placed here to prevent the cmd_header from
> being overwritten by another caller.
> Could you share your perspective on this?

You are right, I misread the code :(
(I though cmd_header was a local structure)

> 
>>> +
>>> +     /* Send command packet to USB device */
>>> +     cmd_header->mod = mod;
>>> +     cmd_header->cmd = offset & 0xFF;
>>> +     cmd_header->sel = (offset >> 8) & 0xFF;
>>> +     cmd_header->hctrl = NCT6694_HCTRL_GET;
>>> +     cmd_header->len = length;

CJ

