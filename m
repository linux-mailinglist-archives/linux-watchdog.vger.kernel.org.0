Return-Path: <linux-watchdog+bounces-1145-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A1909906
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2024 18:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C78E1C20B43
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2024 16:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA35F2233B;
	Sat, 15 Jun 2024 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lydYskUS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621901DFFD
	for <linux-watchdog@vger.kernel.org>; Sat, 15 Jun 2024 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718468516; cv=none; b=Tsr2dxhNiRYqc+/H7FYQRCDVeRUYSkATHQLVkzsUwQgIAikGf02Zl95jDuutQPMv04OVOgMf38EcKCVbVScqjqqm8lwvvs4hFV6h5v7R/kI9cftsm2i015+hKIuYWXca5B3eskqaYxWsJPam0l2tqy2En0Hpi8+rJGZ6yUyScXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718468516; c=relaxed/simple;
	bh=nseT3jnH7TDugs1GFvb4Xv8OW9smm+XMOFQ1ERn0xxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pryuaiv8JSb7hBRI/cmdg8l9TxDVU8ny6RXgi2W/tWJ07FpQNOUnep8G43Xua4g61JHwBOWV/SjBiLkOYQceFCUZrODR+sGR6xa5lCuqZzwFY/yTESZrTGzMZgRhjb98ydlyOwNZUiiWDdc0KfKV11fLAN6w1bbaDHfgcKpTUtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lydYskUS; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f70fdc9644so31525375ad.0
        for <linux-watchdog@vger.kernel.org>; Sat, 15 Jun 2024 09:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718468515; x=1719073315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6jpbVnER420awWvOnStDFZ6kJFXd2BJcugFSMBCOgB0=;
        b=lydYskUSV7Uith5tyUQrDrlMqm4Cs9nLMwdKKNsg//E4enGU9HX+VESv4FxaWhet72
         Rp13VWluePT2a1Hv6FlMmhw4nC16bUqORVtXI8bWkrwKzDARIOVJbi4t4iCzDuJaEoMN
         vGj2lKE0ihXMPmL3TnSDn0WjPphGqWoSa66lrCj7cFGAw0qrmTBF7fe0Ztp65hKJ5LqQ
         TqPLtDTVO1qduLSjxUG9BqxR4TPZouq2zZZ9qEW+9JfO3GUMoKg5nIWImYcdXxlL48Xv
         HLozcFkyKzdkDkZGtDBYotRdhm4T6oqZ92PgVZKMoZQhz5gYbj+i4JQTG62WUJGZBAz9
         ElIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718468515; x=1719073315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jpbVnER420awWvOnStDFZ6kJFXd2BJcugFSMBCOgB0=;
        b=J1TwevPYdoUfqgA9Ca85f74j5c8AL5f4+PPIy8fPa+40FSuKT1XOLYe9HRH6FQRT0n
         v8QhwJ4PzjV+CFh65GlAoiL86468FmvmE+P/Hvi6mU/ovGSEZPips8fc0MAAFOsdFb3J
         qsI8/IS0XwLifg9C8NvOWaUtArYALbCJIgf/C20HsN0bk6i9Mpeh02zAgZRjavYu73Pm
         5YKOWT2PwyaCl0g1Wq6PuUkcZRG85qJXP4Izi758oBd5FpHnncG3uel5AHLlBk7sguMw
         im8mNWzF4JiL+5a61542AODoBs2pEwQ5y9QUbMDnwf1rh8U+lZPKG5q7dls5CnZZ9HTZ
         j0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXuAykzYy6+YjX+f6b1ih99aF0xmOUOmETudTRcnrsjqJlMf8/PMr5EnMRAWIftBkURAYQEcP+/jYmhHiKXuldKWcp2VQyuG5OIj2BkX1U=
X-Gm-Message-State: AOJu0Yw10wu3Gu2ylTR3MVsu1kTd3jXtC8PU9k3i7WSiBjM3il3oqcks
	3m1GF5MmZxt8SJ1YZy8+l6R+utof2pzu3KExQvMUSvQHSYyuj31rb7AhAw==
X-Google-Smtp-Source: AGHT+IFUzkPmX6Sl86BSalpWN81RJrRwYjLK3O8LsMUn6S0eR2wf4E7W8cdyAqwO8QindJ3xuhMH3g==
X-Received: by 2002:a17:902:f68e:b0:1f7:22b4:8240 with SMTP id d9443c01a7336-1f862322e45mr78056045ad.29.1718468514553;
        Sat, 15 Jun 2024 09:21:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f32334sm51703245ad.259.2024.06.15.09.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jun 2024 09:21:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <69dcaeba-a077-4f41-92ef-669392b66c24@roeck-us.net>
Date: Sat, 15 Jun 2024 09:21:52 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: imx2_wdg: Save the actual timeout value
To: "L.Q" <lqking7735@163.com>
Cc: "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 =?UTF-8?Q?linux-watchdog=40vger=2Eke=E2=80=A6?=
 <linux-watchdog@vger.kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>,
 =?UTF-8?Q?linux-arm-kernel=40lists=2Ein=E2=80=A6?=
 <linux-arm-kernel@lists.infradead.org>
References: <20240615141059.345076-1-lqking7735@163.com>
 <8db871d7-154d-48c3-b934-e480991ad8a8@roeck-us.net>
 <57e6bc77.319eb.1901c76a5fa.Coremail.lqking7735@163.com>
 <480b0513-01c4-42a3-bc8b-5ee6e711a1a1@roeck-us.net>
 <7814550c.31a49.1901c98ad6f.Coremail.lqking7735@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <7814550c.31a49.1901c98ad6f.Coremail.lqking7735@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/15/24 08:51, L.Q wrote:
> Step 1:
> Call imx2_wdt_set_timeout with a timeout value greater than 128
> This illegal value will be stored in wdog->timeout

This is not an illegal value because the driver sets max_hw_heartbeat_ms
which lets the watchdog core handle timeout values exceeding the maximum
timeout supported by the chip.

[ ... ]

> static inline void imx2_wdt_setup(struct watchdog_device *wdog)
> {
>   struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
>   u32 val;
>   regmap_read(wdev->regmap, IMX2_WDT_WCR, &val);
>   /* Suspend timer in low power mode, write once-only */
>   val |= IMX2_WDT_WCR_WDZST;
>   /* Strip the old watchdog Time-Out value */
>   val &= ~IMX2_WDT_WCR_WT;
>   /* Generate internal chip-level reset if WDOG times out */
>   if (!wdev->ext_reset)
>    val &= ~IMX2_WDT_WCR_WRE;
>   /* Or if external-reset assert WDOG_B reset only on time-out */
>   else
>    val |= IMX2_WDT_WCR_WRE;
>   /* Keep Watchdog Disabled */
>   val &= ~IMX2_WDT_WCR_WDE;
>   /* Set the watchdog's Time-Out value */
>   val |= WDOG_SEC_TO_COUNT(wdog->timeout);
>      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

That is the bug. It needs to be
	val |= WDOG_SEC_TO_COUNT(min(wdog->timeout, IMX2_WDT_MAX_TIME));

Guenter


