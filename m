Return-Path: <linux-watchdog+bounces-2659-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADCCA02E74
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2025 17:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDA2A1659B3
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2025 16:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BE01DD9AD;
	Mon,  6 Jan 2025 16:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ka0thSi5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2041581F0
	for <linux-watchdog@vger.kernel.org>; Mon,  6 Jan 2025 16:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736182624; cv=none; b=ohbyxt4HiXKNI3PRc0rY3Mo70sRABAcdiyBfmoRZFbhYt84yHr7op3Jxqa3M1ud4qJcV+s0hZqrIgGfpeW0oGXxN/bPAzo+ovOOOxWbWN1vnVIgWS298aptRGcyTno4gyd9g9iWCO+xsONkPYVZMHJRbYu4acnWoMd1oAfbXgXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736182624; c=relaxed/simple;
	bh=jkNypH1TwKkp77NgOLH4L1TGxYgkYwySvG+MoqGR5b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0p58xCdPxexEkPE7xsFPLQg2jtgMby/Nw5pLjDPlN/FYW/N+wD4S6Nx2j61ik+9dAhQ/wTZTXK6p9xRrQdKr5iFVP9h8Z/nZFCOTcXJRHMQs/nYS4LxhgLykfv+a2EPoX6hMmq23zhbug7r+XSO5V8KOvsPxBUIYGnhk4QeUSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ka0thSi5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166651f752so11655645ad.3
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Jan 2025 08:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736182622; x=1736787422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9dsB99JosyydPkmAMD5rOcHL1Q++Mi7lH0Vf7Yld5qk=;
        b=ka0thSi5gZwP3xH9J5R5dxVwoADs4rlrbPX9JDgVSs+Q+HVlt0Nx1511RgBhJS/mbr
         kB0zI4nP5QwRT8DBMHCY+a1o1+p2RMn4fFF0HwwM1uiNhyzf5Gyh7tjlrIZqrJ/+pkMb
         /49u+9JHlq6C90EfbphiNyVU26ojJJ44nS7zkqBQRfgCjfW13tMgIN2X26JAp5T0wODQ
         NYjFg3ayYOPRdHE6nA/ue4dUI70ng7ji66Fg3dPGUtVuceIrXOO019HnS8zjIiVSB5+k
         qxK++gAekzv1f0yIbFhVX5xgDQ64bA1BMROp3bm7t83W3JiG+gUeu/pjkOiX31GM9WIa
         xj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736182622; x=1736787422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dsB99JosyydPkmAMD5rOcHL1Q++Mi7lH0Vf7Yld5qk=;
        b=qH+iIHRhlOEy79+UDUtfeWh1Jdf9SaSLAalpkO5FwiBMMe8ox/LqJpx2hHm1PLp7zY
         eVbmFWYDcT3remsvOhWLzRnNdgSZkX25FWE22iWTnO4VdX1Hpa+mDo7guOyA+6SIKXj6
         O0XJ5BD1pGgSBzHeTCE76VKDKJpyv9dT7qWoerTqPVN8atCgQIL7iGw5ZD7gfoYA+cwG
         rMcwKXp5cpi+vTWXh2qEE6Ue4PoDwMd4WkqWEUlKETQ4NZhV/ImitPzhLp2Zx5ufSUBj
         Vs2K3hqiF+B8wYkDIx19+AKZXVJ18jTUenDvEERKty9f94FBjrx/b3JpvmfEdcmzeFnE
         uu6A==
X-Gm-Message-State: AOJu0YxJEjolOYk9XOHe/7ZgyG41yE2R5AbDBTHav1STnyusQ170EgUi
	11LkSDHh1zb89MdLiEiQ9HkU2nVHGCgV/wa4NnrbQ1jHmSLcmOznJfWG5g==
X-Gm-Gg: ASbGncuK+lLtkjhKsfq1zSTtXPfehvmV1gVpAQ2ZuRQu6bjLvBxLlL2/NOr9MLI9yM+
	rYrCGTcDmBS4fXKl7nK7S4MQsOm637rQ/zMouqGgQqYCFdxXnuCLgqaMobTjscCOLz8SzSJ5XrV
	YCnEBfm4g6x/fuLeDxAWN68PRiQcJpMg5ohX1BSR6Y12PqX3MM3RcL9GTh4dDd/e10/Z85UKkjs
	zPtYFfzOLmXbElijUolUdq6dcyrlsixhqF/j081P6vSZyyR5IvVPV+y1gtuX8ADwakUsWvhUzOp
	FFeNgYtX2P5U7uwZMdSliEGO9hbFLQ==
X-Google-Smtp-Source: AGHT+IGMHzPR1mI6Rdi4Zz3xchbVYB0a7Q7SImmMccHlZVhWyMruDDg5Uu507t1uY2otFnE4F9u/1A==
X-Received: by 2002:a05:6a20:8403:b0:1e1:bef7:af57 with SMTP id adf61e73a8af0-1e5e049f56emr91925991637.21.1736182622105;
        Mon, 06 Jan 2025 08:57:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8309f3sm31567656b3a.55.2025.01.06.08.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 08:57:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dfe17a1e-bc03-4545-91e4-cb191ff3596d@roeck-us.net>
Date: Mon, 6 Jan 2025 08:57:00 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: rti_wdt: Fix an OF node leak in rti_wdt_probe()
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org
References: <20250105111718.4184192-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250105111718.4184192-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/25 03:17, Joe Hattori wrote:
> rti_wdt_probe() does not release the OF node reference obtained by
> of_parse_phandle(). Add a of_node_put() call.
> 
> This was found by an experimental verification tool that I am
> developing. Due to the lack of the actual device, no runtime test was
> able to be performed.
> 
> Fixes: f20ca595ae23 ("watchdog:rit_wdt: Add support for WDIOF_CARDRESET")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/rti_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 58c9445c0f88..255ece133576 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -301,6 +301,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
>   	node = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
>   	if (node) {
>   		ret = of_address_to_resource(node, 0, &res);
> +		of_node_put(node);
>   		if (ret) {
>   			dev_err(dev, "No memory address assigned to the region.\n");
>   			goto err_iomap;


